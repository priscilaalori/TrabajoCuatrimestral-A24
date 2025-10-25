using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Deportista: Usuario
    {
        public int IdProfesor { get; set; }
        public List<Rutina> Rutinas { get; set; }

    }
}
