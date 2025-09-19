using CapaBusiness;
using CapaEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PresentacionAdmin.Controllers
{
    public class MantenedorController : Controller
    {
        // GET: Mantenedor
        public ActionResult Categoria()
        {
            return View();
        }

        public ActionResult Marca()
        {
            return View();
        }

        public ActionResult Producto()
        {
            return View();
        }

        [HttpGet]
        public JsonResult Listar_Categorias()
        {
            List<Categoria> Lista = new List<Categoria>();

            Lista = new CN_Category().Listar();

            return Json(new { data = Lista }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Listar_Marcas()
        {
            List<Marca> Lista = new List<Marca>();

            Lista = new CN_Marca().Listar();

            return Json(new { data = Lista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GuardarCategoria(Categoria objeto)
        {
            object resultado;
            string mensaje = string.Empty;

            if (objeto.IdCategoria == 0)
            {
                resultado = new CN_Category().Registrar(objeto, out mensaje);
            }
            else
            {
                resultado = new CN_Category().Editar(objeto, out mensaje);
            }

            return Json(new { resultado = resultado, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GuardarMarca(Marca objeto)
        {
            object resultado;
            string mensaje = string.Empty;

            if (objeto.IdMarca == 0)
            {
                resultado = new CN_Marca().Registrar(objeto, out mensaje);
            }
            else
            {
                resultado = new CN_Marca().Editar(objeto, out mensaje);
            }

            return Json(new { resultado = resultado, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]

        public JsonResult Eliminar(int id)
        {
            string mensaje = string.Empty;

            bool respuesta = false;

            respuesta = new CN_Category().Eliminar(id, out mensaje);

            return Json(new { resultado = respuesta, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]

        public JsonResult EliminarMarca(int id)
        {
            string mensaje = string.Empty;

            bool respuesta = false;

            respuesta = new CN_Marca().Eliminar(id, out mensaje);

            return Json(new { resultado = respuesta, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }
    }
}