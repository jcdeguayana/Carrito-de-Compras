using CapaData;
using CapaEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaBusiness
{
    public class CN_Producto
    {
        private CD_Producto obj = new CD_Producto();
        private CD_Producto producto = new CD_Producto();

        public List<Producto> Listar()
        {
            return obj.Listar();
        }

        public int Registrar(Producto obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrWhiteSpace(obj.Nombre))
            {
                Mensaje = "El nombre no puede ser vacío";
            }
            else if (string.IsNullOrWhiteSpace(obj.Descripcion))
            {
                Mensaje = "La descripción no puede ser vacía";
            }
            else if (obj.Marca == null || obj.Marca.IdMarca == 0)
            {
                Mensaje = "Debe seleccionar una marca";
            }
            else if (obj.Categoria == null || obj.Categoria.IdCategoria == 0)
            {
                Mensaje = "Debe seleccionar una categoría";
            }
            else if (obj.Precio <= 0)
            {
                Mensaje = "El precio debe ser mayor a cero";
            }
            else if (obj.Stock < 0)
            {
                Mensaje = "El stock no puede ser negativo";
            }

            if (string.IsNullOrEmpty(Mensaje))
            {
                return producto.Registrar(obj, out Mensaje);
            }
            else
            {
                return 0;
            }
        }

        public bool Editar(Producto obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrWhiteSpace(obj.Nombre))
            {
                Mensaje = "El nombre no puede ser vacío";
            }
            else if (string.IsNullOrWhiteSpace(obj.Descripcion))
            {
                Mensaje = "La descripción no puede ser vacía";
            }
            else if (obj.Marca == null || obj.Marca.IdMarca == 0)
            {
                Mensaje = "Debe seleccionar una marca";
            }
            else if (obj.Categoria == null || obj.Categoria.IdCategoria == 0)
            {
                Mensaje = "Debe seleccionar una categoría";
            }
            else if (obj.Precio <= 0)
            {
                Mensaje = "El precio debe ser mayor a cero";
            }
            else if (obj.Stock < 0)
            {
                Mensaje = "El stock no puede ser negativo";
            }

            if (string.IsNullOrEmpty(Mensaje))
            {
                return producto.Editar(obj, out Mensaje);
            }
            else
            {
                return false;
            }
        }

        public bool Eliminar(int id, out string Mensaje)
        {
            return producto.Eliminar(id, out Mensaje);
        }
    }
}
