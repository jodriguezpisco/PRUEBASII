using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaDatos;


namespace CapaNegocios
{
    public class negProductos
    {
        public static int AgregarProductos(entProductos obj)
        {
            return daoProductos.AgregarProductos(obj);
        }

        public static List<entProductos> ListarProductos()
        {
            return daoProductos.ListarProductos();
        }

        public static entProductos ListarProductosEditar(int operacion, int idpro)
        {
            return daoProductos.ListarProductosEditar(operacion, idpro);
        }
    }
}
