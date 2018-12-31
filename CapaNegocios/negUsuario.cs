using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaDatos;

namespace CapaNegocios
{
    public class negUsuario
    {
        //se instancian las clases para el paso de los datos entre capas
        public static entUsuario Login(String usuario, String contrasena)
        {
            return daoUsuario.Login(usuario, contrasena);
        }
    }
}
