using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using System.Data.SqlClient;
using System.Data;

namespace CapaDatos
{
    public class daoClientes
    {
        public static int AgregarClientes(entClientes obj)
        {
            int indicador = 0;
            SqlCommand cmd = null;
            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_TRANSAC_CLIENTES", cnx);
                cmd.Parameters.AddWithValue("@Operacion", obj.Operacion);
                cmd.Parameters.AddWithValue("@id", obj.id);
                cmd.Parameters.AddWithValue("@nombre", obj.nombre);
                cmd.Parameters.AddWithValue("@tipo_doc", obj.tipo_doc);
                cmd.Parameters.AddWithValue("@identificacion", obj.identificacion);
                cmd.Parameters.AddWithValue("@telefono", obj.telefono);
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

        public static List<entClientes> ListarClientes()
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entClientes> listacli = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_CARGAR_CLIENTES", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                listacli = new List<entClientes>();
                while (dr.Read())
                {
                    entClientes c = new entClientes();
                    c.id = Convert.ToInt32(dr["id"].ToString());
                    c.nombre = dr["nombre"].ToString();
                    c.tdocumento = dr["tipo_doc"].ToString();
                    c.identificacion = dr["identificacion"].ToString();
                    c.telefono = dr["telefono"].ToString();
                    c.direccion = dr["direccion"].ToString();

                    listacli.Add(c);
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
            return listacli;
        }

        public static entClientes ListarClientesEditar(int operacion, int idcli)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            entClientes obj = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_TRANSAC_CLIENTES", cnx);
                cmd.Parameters.AddWithValue("@Operacion", operacion);
                cmd.Parameters.AddWithValue("@id", idcli);
                cmd.Parameters.AddWithValue("@nombre", "");
                cmd.Parameters.AddWithValue("@tipo_doc", "");
                cmd.Parameters.AddWithValue("@identificacion", "");
                cmd.Parameters.AddWithValue("@telefono", "");
                cmd.Parameters.AddWithValue("@direccion", "");
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entClientes();
                dr.Read();
                entClientes c = new entClientes();
                obj.id = Convert.ToInt32(dr["id"].ToString());
                obj.nombre = dr["nombre"].ToString();
                obj.idtdoc = Convert.ToInt32(dr["idtdoc"].ToString());
                obj.tdocumento = dr["tdocumento"].ToString();
                obj.identificacion = dr["identi"].ToString();
                obj.telefono = dr["telefono"].ToString();
                obj.direccion = dr["direccion"].ToString();
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
