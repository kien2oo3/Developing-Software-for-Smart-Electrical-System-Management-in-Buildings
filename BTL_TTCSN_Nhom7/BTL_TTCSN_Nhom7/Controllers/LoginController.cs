using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_TTCSN_Nhom7.Models;

namespace BTL_TTCSN_Nhom7.Controllers
{
    public class LoginController : Controller
    {
        ManageDB db = new ManageDB();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login(string users_Username, string users_Password)
        {
            var query = db.Users.SingleOrDefault(p => (users_Username.Equals(p.users_Username) && users_Password.Equals(p.users_Password)));
            if (query != null)
            {
                Session["user_Id"] = query.users_Id;
                Session["user"] = query.users_Username;
                Session["position"] = query.users_Position;
                Session["img"] = query.users_Img;
                return RedirectToAction("Index", "Projects");
            }
            else
            {
                ViewBag.err = "Tên đăng nhập hoặc mật khẩu không đúng!";
                return View("Index");
            }
        }
        public ActionResult Logout()
        {
            Session["user_Id"] = null;
            Session["user"] = null;
            Session["position"] = null;
            Session["img"] = null;
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult Regis(string users_Full_Name, string users_Username, string users_Password, string repeat_Password)
        {
            var query = db.Users.SingleOrDefault(p => p.users_Username.Equals(users_Username));
            if (query != null)
            {
                ViewBag.msg = 1;
                ViewBag.err1 = "Tài khoản đã tồn tại!";
            }
            else
            {
                if (repeat_Password != users_Password)
                {
                    ViewBag.msg = 1;
                    ViewBag.err1 = "Mật khẩu nhập lại không trùng với mật khẩu hiện tại!";
                }
                else
                {
                    User u = new User();
                    u.users_Full_Name = users_Full_Name;
                    u.users_Username = users_Username;
                    u.users_Password = users_Password;
                    u.users_Position = "Khách hàng";
                    db.Users.Add(u);
                    db.SaveChanges();
                    return RedirectToAction("Login");
                }
            }
            return View("Index");
        }
    }
}