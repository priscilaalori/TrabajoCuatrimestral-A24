using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Observacion
    {//revisar junto con el historial en etapa 3 
            public int IdObservacion { get; set; }
            public int IdRutina { get; set; }
            public int IdProfesor { get; set; } //
            public string Comentario { get; set; }
            public DateTime Fecha { get; set; }
      
    }
}
