package mx.com.robertoleon.helper

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.springframework.context.i18n.LocaleContextHolder

class FileuploadService {

    boolean transactional = true

    def messageSource
    def pathService = new mx.com.robertoleon.helper.PathService()

    def validateFile(group, file) {

        // Configuración para el grupo
        def config = ConfigurationHolder.config.archivoService[group]

        // Valida extensiones
        def fileExtension = pathService.fileExtension(file.originalFilename).toLowerCase()
        if (!config.allowedExtensions[0].equals("*") && !config.allowedExtensions.contains(fileExtension)) {
            def msg = messageSource.getMessage("fileupload.upload.unauthorizedExtension", [fileExtension, config.allowedExtensions] as Object[], LocaleContextHolder.locale)
            log.debug msg
            return false
        }

        // Valida tamaños
        if (config.maxSize) { //if maxSize config exists
            def maxSizeInKb = ((int) (config.maxSize / 1024))
            if (file.size > config.maxSize) { //if filesize is bigger than allowed
                log.debug "FileUploader plugin received a file bigger than allowed. Max file size is ${maxSizeInKb} kb"
                def msg = messageSource.getMessage("fileupload.upload.fileBiggerThanAllowed", [maxSizeInKb] as Object[], LocaleContextHolder.locale)
                return false
            }
        }

        return true
    }

    def validateFiles(group, files) {
        files.every { validateFile(group, it) }
    }
}
