using CapaData;
using CapaEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaBusiness
{
    public class CN_User
    {
        private CD_User obj = new CD_User();

        public List<Usuario> Listar()
        {
            return obj.Listar();
        }

    }
}
