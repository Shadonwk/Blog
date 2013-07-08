package mx.com.robertoleon.helper

class PathService {

    /*
    * Regresa la extensión de un filename.
    * La extension es todo lo que venga después de último punto
    * Si no tiene extension, regresa una cadena vacía
    */
    def fileExtension(filename) {
        def index = filename.lastIndexOf('.')

        (index > 0) ? filename.substring(index + 1) : ""
    }

    /*
     * Construye un path para almacenar un archivo a partir
     * de baseDir y los primeros dígitos de id para generar una
     * ruta con nestingLevel niveles de profundidad.
     * El path regresado NO contiene el último separador de directorios "/"
     */
    def buildPath(baseDir, nestingLevel, id) {
        // Por cada nivel de nesting, tenemos dos dígitos en la máscara
        // p.e. nestingLevel = 3       ->    maskLength = 6
        // Con máscara "%06d", id = 1  ->    fileID = 000001

        def maskLength = nestingLevel * 2
        def fileID = String.format("%0${maskLength}d", id)

        // Tomamos los últimos maskLength caracteres
        fileID = fileID[-maskLength..-1]

        // Divide fileID en grupos de 2 caracteres
        // From: http://stackoverflow.com/questions/2297347/splitting-a-string-at-every-n-th-character
        // The regex (?<=\G...) matches an empty string that has the last match (\G) followed by
        // three characters (...) before it ((?<= ))
        def tokens = fileID.split("(?<=\\G.{2})")

        // Genera el path
        def path = baseDir + tokens.join("/")

        // Crea los directorios para el path
        try {
            new File(path).mkdirs()
        } catch(e) {
            log.error("Error creando directorio ${fullPath}")
        }

        path
    }
}
