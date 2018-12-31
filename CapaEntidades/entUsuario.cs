using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entUsuario
    { 
        //declaro las entidades que se manejaran entre la base y la capa de entidades
        public int id { get; set; }
        public string usuario { get; set; }
        public string clave { get; set; }
        public string nombre { get; set; }
        public string identificacion { get; set; }
        public int estado { get; set; }
        public DateTime fecha_creacion { get; set; }
    }
}
