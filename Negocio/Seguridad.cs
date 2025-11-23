using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public static class Seguridad
    {

        public static bool SessionActivaEntrenador(object usuario)
        {
            if ((Usuario)usuario != null && ((Usuario)usuario).Rol == TipoUsuario.ENTRENADOR)
                return true; 

            return false;
        }

        public static bool SessionActivaAdmin(object usuario)
        {
            if ((Usuario)usuario != null && ((Usuario)usuario).Rol == TipoUsuario.ADMIN)
                return true;

            return false;
        }
        public static bool SessionActivaDeportista(object usuario)
        {
            if ((Usuario)usuario != null && ((Usuario)usuario).Rol == TipoUsuario.DEPORTISTA)
                return true;

            return false;
        }
    }
}
