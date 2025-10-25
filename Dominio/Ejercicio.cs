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
        public string Descripcion { get; set; }
        public int Series { get; set; }
        public int Repeticiones { get; set; }
        public string Duracion { get; set; } // opcional
        
        public string Referencia { get; set; } //a definir porque puede ser un video/ imagen y necesitamos una clase más.

    }
}
