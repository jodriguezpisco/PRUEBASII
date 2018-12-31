using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class daoUsuario
    {
        //paso los parametros para la consulta del usuario y permitir su login
        public static entUsuario Login(String usuario, String contrasena)
        {
            entUsuario obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_VALIDAR_USUARIO", cnx);
                cmd.Parameters.AddWithValue("@usuario", usuario);
                cmd.Parameters.AddWithValue("@clave", contrasena);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entUsuario();
                dr.Read();
                obj.id = Convert.ToInt32(dr["id"].ToString());
                obj.usuario = dr["usuario"].ToString();
                obj.clave = dr["clave"].ToString();
                obj.nombre = dr["nombre"].ToString();
            }
            catch (Exception ex)
            {
                //throw ex;
                obj = null;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return obj;
        }
    }
}
