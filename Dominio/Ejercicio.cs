using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace Dominio
{
    public class Ejercicio
    {
        public int IdEjercicio { get; set; }
        public int IdRutina { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; } //en este campo se describen series, repeticiones según corresponda
        //public int Series { get; set; }
        //public int Repeticiones { get; set; }
        //public string Duracion { get; set; } // opcional
        
        public string UrlVideo { get; set; } //lo dejamos en video para que sea más fácil y es opcional

    }
}
