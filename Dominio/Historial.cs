using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Historial
    {
        //Revisar en final de etapa 3 el rol de esta clase y su estructura
        public int IdHistorial { get; set; }
        public int IdDeportista { get; set; }
        public List<Observacion> Observaciones{ get; set; }
        public List<Rutina> Rutinas { get; set; }

    }
}
