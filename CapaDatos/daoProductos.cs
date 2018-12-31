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
    public class daoProductos
    {
        public static int AgregarProductos(entProductos obj)
        {
            int indicador = 0;
            SqlCommand cmd = null;
            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_TRANSAC_PRODUCTOS", cnx);
                cmd.Parameters.AddWithValue("@Operacion", obj.Operacion);
                cmd.Parameters.AddWithValue("@id", obj.id);
                cmd.Parameters.AddWithValue("@nombre", obj.nombre);
                cmd.Parameters.AddWithValue("@descripcion", obj.descripcion);
                cmd.Parameters.AddWithValue("@valor", obj.valor);
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

        public static List<entProductos> ListarProductos()
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entProductos> listapro = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_CARGAR_PRODUCTOS", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                listapro = new List<entProductos>();
                while (dr.Read())
                {
                    entProductos c = new entProductos();
                    c.id = Convert.ToInt32(dr["id"].ToString());
                    c.nombre = dr["nombre"].ToString();
                    c.descripcion = dr["descripcion"].ToString();
                    c.valor = dr["valor"].ToString();

                    listapro.Add(c);
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
            return listapro;
        }

        public static entProductos ListarProductosEditar(int operacion, int idpro)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            entProductos obj = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_TRANSAC_PRODUCTOS", cnx);
                cmd.Parameters.AddWithValue("@Operacion", operacion);
                cmd.Parameters.AddWithValue("@id", idpro);
                cmd.Parameters.AddWithValue("@nombre", "");
                cmd.Parameters.AddWithValue("@descripcion", "");
                cmd.Parameters.AddWithValue("@valor", "");
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entProductos();
                dr.Read();
                entProductos c = new entProductos();
                obj.id = Convert.ToInt32(dr["id"].ToString());
                obj.nombre = dr["nombre"].ToString();
                obj.descripcion = dr["descripcion"].ToString();
                obj.valor = dr["valor"].ToString();
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
