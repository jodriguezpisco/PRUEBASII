using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entVentas
    {
        public int Operacion { get; set; }
        public int id { get; set; }
        public int id_compania { get; set; }
        public int id_producto { get; set; }
        public int idcli { get; set; }
        public int idcom { get; set; }
        public string descCompania { get; set; }
        public int idpro { get;set;}
        public string descproducto { get; set; }
        public string descripcion { get; set; }
        public string valor { get; set; }
        public string nombre { get; set; }
}
}
