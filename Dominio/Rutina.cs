using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Rutina
    {
        public int IdRutina { get; set; }
        //public int IdDeportista { get; set; } La rutina no tiene un deportista asignado
        public int IdEntrenador { get; set; }

        public Deporte Deporte { get; set; }
        public string Nombre { get; set; }
        public string Nivel { get; set; } //(principiante, intermedio, avanzado)
        public string Descripcion { get; set; }
        public DateTime FechaCreacion { get; set; }
        //public int Duracion {  get; set; } Cambiamos este atributo por Fecha inicio/fin 

        public DateTime FechaInicio { get; set; }

        public DateTime FechaFinizacion { get; set; }
        public bool Activa { get; set; }
        public List<Ejercicio> Ejercicios { get; set; }

        //public List<Observacion> Observaciones { get; set; }

    }
}
