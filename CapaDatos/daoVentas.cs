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
    public class daoVentas
    {
        public static int AgregarVentasCompanias(entVentas obj)
        {
            int indicador = 0;
            SqlCommand cmd = null;
            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_TRANSAC_VENTAS_COMPANIAS", cnx);
                cmd.Parameters.AddWithValue("@Operacion", obj.Operacion);
                cmd.Parameters.AddWithValue("@id", obj.id);
                cmd.Parameters.AddWithValue("@id_compania", obj.id_compania);
                cmd.Parameters.AddWithValue("@id_producto", obj.id_producto);
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

        public static int AgregarVentasClientes(entVentas obj)
        {
            int indicador = 0;
            SqlCommand cmd = null;
            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_TRANSAC_VENTAS_CLIENTES", cnx);
                cmd.Parameters.AddWithValue("@Operacion", obj.Operacion);
                cmd.Parameters.AddWithValue("@id", obj.id);
                cmd.Parameters.AddWithValue("@id_compania", obj.id_compania);
                cmd.Parameters.AddWithValue("@id_producto", obj.id_producto);
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

        public static List<entVentas> ListarVentasCompanias()
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entVentas> listavta = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_CARGAR_VENTAS_TOTAL_COM", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                listavta = new List<entVentas>();
                while (dr.Read())
                {
                    entVentas c = new entVentas();
                    c.id = Convert.ToInt32(dr["id"].ToString());
                    c.idcom = Convert.ToInt32(dr["idcom"].ToString());
                    c.descCompania = dr["descCompania"].ToString();
                    c.idpro = Convert.ToInt32(dr["idpro"].ToString());
                    c.descproducto = dr["descproducto"].ToString();

                    listavta.Add(c);
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
            return listavta;
        }

        public static List<entVentas> ListarVentasClientes()
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entVentas> listavta = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_CARGAR_VENTAS_TOTAL_CLI", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                listavta = new List<entVentas>();
                while (dr.Read())
                {
                    entVentas c = new entVentas();
                    c.id = Convert.ToInt32(dr["id"].ToString());
                    c.idcli = Convert.ToInt32(dr["idcli"].ToString());
                    c.nombre = dr["nombre"].ToString();
                    c.idpro = Convert.ToInt32(dr["idpro"].ToString());
                    c.descproducto = dr["descproducto"].ToString();

                    listavta.Add(c);
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
            return listavta;
        }


        public static entVentas ListarVentasEditar(int operacion, int idvta)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            entVentas obj = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_TRANSAC_VENTAS_COMPANIAS", cnx);
                cmd.Parameters.AddWithValue("@Operacion", operacion);
                cmd.Parameters.AddWithValue("@id", idvta);
                cmd.Parameters.AddWithValue("@id_compania", "");
                cmd.Parameters.AddWithValue("@id_producto", "");
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entVentas();
                dr.Read();
                entVentas c = new entVentas();
                obj.id = Convert.ToInt32(dr["id"].ToString());
                obj.idcom = Convert.ToInt32(dr["idcom"].ToString());
                obj.descCompania = dr["descCompania"].ToString();
                obj.idpro = Convert.ToInt32(dr["idpro"].ToString());
                obj.descproducto = dr["descproducto"].ToString();
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

        public static entVentas ListarVentasEditarClientes(int operacion, int idvta)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            entVentas obj = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_TRANSAC_VENTAS_CLIENTES", cnx);
                cmd.Parameters.AddWithValue("@Operacion", operacion);
                cmd.Parameters.AddWithValue("@id", idvta);
                cmd.Parameters.AddWithValue("@id_compania", "");
                cmd.Parameters.AddWithValue("@id_producto", "");
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entVentas();
                dr.Read();
                entVentas c = new entVentas();
                obj.id = Convert.ToInt32(dr["id"].ToString());
                obj.idcli = Convert.ToInt32(dr["idcli"].ToString());
                obj.nombre = dr["nombre"].ToString();
                obj.idpro = Convert.ToInt32(dr["idpro"].ToString());
                obj.descproducto = dr["descproducto"].ToString();
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

        public static List<entVentas> ListarVentasxCompanias(int idcom)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entVentas> listavtacom = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_CARGAR_VENTAS_X_COMPANIA", cnx);
                cmd.Parameters.AddWithValue("@id", idcom);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                listavtacom = new List<entVentas>();
                while (dr.Read())
                {
                    entVentas c = new entVentas();
                    c.id = Convert.ToInt32(dr["id"].ToString());
                    c.idpro = Convert.ToInt32(dr["idpro"].ToString());
                    c.descproducto = dr["descproducto"].ToString();
                    c.descripcion = dr["descripcion"].ToString();
                    c.valor = dr["valor"].ToString();

                    listavtacom.Add(c);
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
            return listavtacom;
        }


        public static List<entVentas> ListarVentasxClientes(int idcli)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entVentas> listavtacli = null;

            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_CARGAR_VENTAS_X_CLI", cnx);
                cmd.Parameters.AddWithValue("@id", idcli);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                listavtacli = new List<entVentas>();
                while (dr.Read())
                {
                    entVentas c = new entVentas();
                    c.id = Convert.ToInt32(dr["id"].ToString());
                    c.idpro = Convert.ToInt32(dr["idpro"].ToString());
                    c.descproducto = dr["descproducto"].ToString();
                    c.descripcion = dr["descripcion"].ToString();
                    c.valor = dr["valor"].ToString();

                    listavtacli.Add(c);
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
            return listavtacli;
        }
    }
}
