package mx.com.robertoleon.blog

import mx.com.robertoleon.seguridad.Usuario
import org.joda.time.DateTime
import javax.persistence.Transient
import org.joda.time.Period
import org.joda.time.format.PeriodFormatter
import org.joda.time.format.PeriodFormatterBuilder

class Comentario {

    String titulo
    Usuario usuario
    String descripcion
    Date fechaCreacion
    static belongsTo  = [post:Post]

    static constraints = {
        titulo(blank: false)
        descripcion(blank: false, maxSize: 1000)
    }

    @Transient
    tiepoTranscurrido(){
        def periodo = new Period(new DateTime(fechaCreacion), new DateTime())

        PeriodFormatter durationFormatter = new PeriodFormatterBuilder()
                .minimumPrintedDigits(2) // Número de dígitos que se mostrarán en la salida para los campos siguientes
                //.printZeroAlways() // Indica que deben mostrarse los campos siguientes aunque su valor sea 0
                .appendDays()
                .appendSuffix(" días ")
                .appendHours()
                .appendSuffix(" horas ")
                .appendMinutes()
                .appendSuffix(" mins ")
                .appendSeconds()
                .appendSuffix(" segs")
                .toFormatter();
        durationFormatter.print(periodo)
    }
}
