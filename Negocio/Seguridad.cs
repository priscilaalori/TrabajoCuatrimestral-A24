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
    }
}
