using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidades;

namespace CapaNegocios
{
    public class negVentas
    {
        public static int AgregarVentasCompanias(entVentas obj)
        {
            return daoVentas.AgregarVentasCompanias(obj);
        }

        public static int AgregarVentasClientes(entVentas obj)
        {
            return daoVentas.AgregarVentasClientes(obj);
        }

        public static List<entVentas> ListarVentasCompanias()
        {
            return daoVentas.ListarVentasCompanias();
        }

        public static List<entVentas> ListarVentasClientes()
        {
            return daoVentas.ListarVentasClientes();
        }

        

        public static List<entVentas> ListarVentasxCompanias(int idcom)
        {
            return daoVentas.ListarVentasxCompanias(idcom);
        }

        public static List<entVentas> ListarVentasxClientes(int idcli)
        {
            return daoVentas.ListarVentasxClientes(idcli);
        }

        public static entVentas ListarVentasEditar(int operacion, int idvta)
        {
            return daoVentas.ListarVentasEditar(operacion, idvta);
        }

        public static entVentas ListarVentasEditarClientes(int operacion, int idvta)
        {
            return daoVentas.ListarVentasEditarClientes(operacion, idvta);
        }

        
    }
}
