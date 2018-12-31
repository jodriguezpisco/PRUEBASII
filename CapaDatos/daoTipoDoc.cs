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
    public class daoTipoDoc
    {
        public static List<entTipoDoc> listarTiposDocs()
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entTipoDoc> listTdocs = null;
            try
            {
                daoConexion cn = new daoConexion();
                SqlConnection cnx = cn.conectar();
                cmd = new SqlCommand("SP_CARGAR_TDOCS", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                listTdocs = new List<entTipoDoc>();
                while (dr.Read())
                {
                    entTipoDoc iden = new entTipoDoc();
                    iden.id = Convert.ToInt32(dr["id"].ToString());
                    iden.descripcion = dr["descripcion"].ToString();
                    listTdocs.Add(iden);
                }
            }
            catch (Exception ex)
            {
                listTdocs = null;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return listTdocs;

        }
    }
}
