using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Entrenador: Usuario
    {
        public List<Deporte> Deportes { get; set; }
        public List<Deportista> Deportistas { get; set; }

    }
}
