using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    internal class Observacion
    {
            public int IdObservacion { get; set; }
            public int IdRutina { get; set; }
            public int IdProfesor { get; set; } //
            public string Comentario { get; set; }
            public DateTime Fecha { get; set; }
      
    }
}
