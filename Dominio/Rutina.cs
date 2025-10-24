using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    internal class Rutina
    {
        public int IdRutina { get; set; }
        public int IdDeportista { get; set; }
        public int IdProfesor { get; set; }
        public string Nombre { get; set; }
        public string Nivel { get; set; } //(principiante, intermedio, avanzado)
        public string Descripcion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public int Duracion {  get; set; }
        public bool Activa { get; set; }
        public List<Ejercicio> Ejercicios { get; set; }
        //public List<Observacion> Observaciones { get; set; }

    }
}
