using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Deportista: Usuario
    {
        
        public Entrenador Entrenador { get; set; } //cambio ID por objeto
        public List<Deporte> Deporte { get; set; } //faltaba deporte
        public List<Rutina> Rutinas { get; set; }

    }
}
