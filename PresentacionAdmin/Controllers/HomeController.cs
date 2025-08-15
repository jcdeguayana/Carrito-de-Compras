using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CapaBusiness;
using CapaEntity;

namespace PresentacionAdmin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Default
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Users()
        {
            return View();
        }

        public JsonResult Listar_Usuarios()
        {
            List<Usuario> Lista = new List<Usuario>();

            Lista = new CN_User().Listar();

            return Json(Lista,JsonRequestBehavior.AllowGet);
        }
    }
}