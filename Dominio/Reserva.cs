using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Reserva
    {
        public int IdReserva { get; set; }
        public int IdProfesor { get; set; }

        public int IdDeportista { get; set; }
        public DateTime Fecha { get; set; }
        public DateTime HoraInicio { get; set; }
        public DateTime HoraFin { get; set; }
        public bool Disponible { get; set; }
        public string TipoEntrenamiento { get; set; } // ej: Técnica de nado, Fuerza, Resistencia
        public string Descripcion { get; set; }
        public string Estado { get; set; } // Pendiente, Aceptada, Rechazada, Realizada, Cancelada
        public DateTime FechaCreacion { get; set; }
        public string Ubicacion { get; set; } // opcional: lugar físico o virtual

    }
}
