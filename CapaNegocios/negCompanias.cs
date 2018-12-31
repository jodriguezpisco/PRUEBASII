using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaDatos;

namespace CapaNegocios
{
    public class negCompanias
    {
        public static int AgregarCompanias(entCompanias obj)
        {
            return daoCompanias.AgregarCompanias(obj);
        }

        public static List<entCompanias> ListarCompanias()
        {
            return daoCompanias.ListarCompanias();
        }

        public static entCompanias ListarCompaniasEditar(int operacion, int idcom)
        {
            return daoCompanias.ListarCompaniasEditar(operacion, idcom);
        }
    }
}
