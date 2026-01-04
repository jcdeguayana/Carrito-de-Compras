using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaData
{
    public class Conexion
    {
        //public static string cn = ConfigurationManager.ConnectionStrings["cadena"].ConnectionString;

        public static string cn
        {
            get
            {
                var cs = ConfigurationManager.ConnectionStrings["cadena"];
                if (cs == null)
                    throw new Exception("ConnectionString 'cadena' NO encontrada");

                return cs.ConnectionString;
            }
        }

    }
}
