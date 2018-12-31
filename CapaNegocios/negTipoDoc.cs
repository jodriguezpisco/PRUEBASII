using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaDatos;

namespace CapaNegocios
{
    public class negTipoDoc
    {
        public static List<entTipoDoc> listarTiposDocs()
        {
            return daoTipoDoc.listarTiposDocs();
        }
    }
}
