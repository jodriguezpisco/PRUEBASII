using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class daoConexion
    {
        //establesco las propiedades de la cadena de conexion para invocarlas desde el web.config
        public SqlConnection conectar()
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cn"].ConnectionString);
            
            return cn;
        }
    }
}
