using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaDatos;


namespace CapaNegocios
{
    public class negClientes
    {
        public static int AgregarCompanias(entClientes obj)
        {
            return daoClientes.AgregarClientes(obj);
        }

        public static List<entClientes> ListarClientes()
        {
            return daoClientes.ListarClientes();
        }

        public static entClientes ListarClientesEditar(int operacion, int idcli)
        {
            return daoClientes.ListarClientesEditar(operacion, idcli);
        }
    }
}
