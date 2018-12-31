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
    public class daoCompanias
    {
        public static int AgregarCompanias(entCompanias obj)
        {
            int indicador = 0;
            SqlCommand cmd = null;
            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_TRANSAC_COMPANIAS", cnx);
                cmd.Parameters.AddWithValue("@Operacion", obj.Operacion);
                cmd.Parameters.AddWithValue("@id", obj.id); 
                cmd.Parameters.AddWithValue("@nombre", obj.nombre);
                cmd.Parameters.AddWithValue("@nit", obj.nit);
                cmd.Parameters.AddWithValue("@dig_ver", obj.dig_ver);
                cmd.Parameters.AddWithValue("@telefono1", obj.telefono1);
                cmd.Parameters.AddWithValue("@telefono2", obj.telefono2);
                cmd.Parameters.AddWithValue("@direccion", obj.direccion);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                cmd.ExecuteNonQuery();
                indicador = 1;
            }
            catch (Exception ex)
            {
                throw ex;
                //indicador = 0;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return indicador;
        }

        public static List<entCompanias> ListarCompanias()
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entCompanias> listacom = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_CARGAR_COMPANIAS", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                listacom = new List<entCompanias>();
                while (dr.Read())
                {
                    entCompanias c = new entCompanias();
                    c.id = Convert.ToInt32(dr["id"].ToString());
                    c.nombre = dr["nombre"].ToString();
                    c.nit = dr["nit"].ToString();
                    c.telefono1 = dr["telefono1"].ToString();
                    c.telefono2 = dr["telefono2"].ToString();
                    c.direccion = dr["direccion"].ToString();
                    c.estado = dr["estado"].ToString();
                   
                    listacom.Add(c);
                }
            }
            catch (Exception e)
            {
                throw e;
                //listacom = null;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return listacom;
        }

        public static entCompanias ListarCompaniasEditar(int operacion, int idcom)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            entCompanias obj = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_TRANSAC_COMPANIAS", cnx);
                cmd.Parameters.AddWithValue("@Operacion", operacion);
                cmd.Parameters.AddWithValue("@id", idcom);
                cmd.Parameters.AddWithValue("@nombre", "");
                cmd.Parameters.AddWithValue("@nit", "");
                cmd.Parameters.AddWithValue("@dig_ver", "");
                cmd.Parameters.AddWithValue("@telefono1", "");
                cmd.Parameters.AddWithValue("@telefono2", "");
                cmd.Parameters.AddWithValue("@direccion", "");
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entCompanias();
                dr.Read();
                    entCompanias c = new entCompanias();
                    obj.id = Convert.ToInt32(dr["id"].ToString());
                    obj.nombre = dr["nombre"].ToString();
                    obj.nit = dr["nit"].ToString();
                    obj.dig_ver = dr["dve"].ToString();
                    obj.telefono1 = dr["telefono1"].ToString();
                    obj.telefono2 = dr["telefono2"].ToString();
                    obj.direccion = dr["direccion"].ToString();
                    obj.estado = dr["estado"].ToString();
            }
            catch (Exception e)
            {
                throw e;
                //listacom = null;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return obj;
        }
    }
}
