using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Mvc;
using BTL_TTCSN_Nhom7.Models;
using PagedList;

namespace BTL_TTCSN_Nhom7.Controllers
{
    public class ProjectsClientController : Controller
    {
        ManageDB db = new ManageDB();
        // GET: ProjectsClient
        public ActionResult Index(string Key)
        {
            int userId = int.Parse(Session["user_Id"].ToString());
            var projects = db.Projects.Where(p => p.project_Client_Id == userId);
            return View(projects.ToList());
        }
        [HttpGet]
        public ActionResult Detail(int id)
        {
            var query = db.Devices.Find(id);
            return View(query);
        }
        [HttpGet]
        public ActionResult ChiTiet(int id)
        {
            var query = db.Projects.Find(id);
            return View(query);
        }

        public ActionResult DanhSachThietBi_NULL()
        {
            return View();
        }

        public ActionResult DanhSachThietBi(int id, string Key, string KeyCurrent, int? page)
        {
            var query = db.Devices.Where(p => p.project_Id == id);
            ViewBag.duan = db.Projects.Find(id).project_Name;
            if (query.Count() > 0)
            {
                //Lấy Key hiện tại:
                if (Key != null)
                {
                    page = 1;
                }
                else
                {
                    Key = KeyCurrent;
                }
                ViewBag.KeyCurrent = Key;
                if (!String.IsNullOrEmpty(Key))
                {
                    query = query.Where(p => p.device_Name.Contains(Key));
                }
                //Sắp xếp:
                query = query.OrderBy(p => p.device_Name);
                //Phân trang:
                int pageSize = 5;
                int pageNumber = page ?? 1;
                return View(query.ToPagedList(pageNumber, pageSize));
            }
            return RedirectToAction("DanhSachThietBi_NULL");
        }
        [HttpGet]
        public ActionResult TuongTac(int Id)
        {
            var query = db.Devices.Find(Id);
            ViewData["Status"] = new SelectList(db.Devices, "device_Status", "device_Status", query.device_Status);
            return View(query);
        }
        [HttpPost]
        public ActionResult TuongTac(int Id, FormCollection f, Interaction i)
        {
            // Lấy ra thiết bị vừa tương tác và cập nhật vào trong CSDL:
            var query = db.Devices.Find(Id);
            query.device_Status = f["Interact"];
            db.Devices.AddOrUpdate(query);
            // Lưu vào trong bảng tương tác:
            int deviceId = query.device_Id;
            int userId = int.Parse(Session["user_Id"].ToString());
            string userName = Session["user"].ToString();
            string type = query.device_Status;
            DateTime dateTime = DateTime.Now;
            string details = "Người dùng " + userName + "(id = " + (userId + ") đã " + type + " thiết bị " + query.device_Name + "(id = " + deviceId + ").").ToLowerInvariant();
            i.device_Id = deviceId;
            i.users_Id = userId;
            i.interaction_Type = type;
            i.interaction_Time = dateTime;
            i.interaction_Details = details;
            db.Interactions.Add(i);
            db.SaveChanges();
            ViewBag.kq = "Lưu thành công!";
            return this.TuongTac(Id);
        }
        [HttpGet]
        public ActionResult LenLichBaoTri(int Id)
        {
            List<string> list = new List<string>();
            list.Add("Bảo trì sửa chữa");
            list.Add("Bảo trì khẩn cấp");
            list.Add("Bảo trì thường niên");
            list.Add("Khác");
            //Tìm thiết bị theo Id
            var query = db.Devices.Find(Id);
            ViewBag.duan = db.Projects.First(p => p.project_Id == query.project_Id).project_Name;
            var query1 = db.MaintenanceSchedules.SingleOrDefault(p => p.device_Id == Id);
            ViewBag.location = query.device_Location;
            if (query1 != null)
            {
                ViewBag.description = query1.schedule_Description;
                ViewData["type"] = new SelectList(list, query1.schedule_Type);
                ViewBag.rs = "define";
            }
            else
            {
                ViewData["type"] = new SelectList(list);
            }
            return View(query);
        }
        [HttpPost]
        public ActionResult LenLichBaoTri(int Id, FormCollection f, MaintenanceSchedule m)
        {
            int idProj = (int)db.Devices.Find(Id).project_Id;
            try
            {
                var query = db.MaintenanceSchedules.SingleOrDefault(p => p.device_Id == Id);
                if (query != null)
                {
                    m.schedule_Id = query.schedule_Id;
                }
                m.device_Id = Id;
                m.schedule_StartDate = DateTime.Now;
                m.schedule_EndDate = null;
                m.schedule_Location = f["location"];
                m.schedule_Description = f["description"];
                m.schedule_Type = f["type"];             
                m.schedule_Technician = null;
                m.schedule_Status = "Đang chờ xử lý";
                db.MaintenanceSchedules.AddOrUpdate(m);
                db.SaveChanges();
                return RedirectToAction("DanhSachThietBi", new { id = idProj });
            }
            catch (Exception e)
            {
                ViewBag.err = e.Message;
                return View("LenLichBaoTri", new { Id = Id });
            }
        }
        [HttpGet]
        public ActionResult XoaLichBaoTri(int Id)
        {
            List<string> list = new List<string>();
            list.Add("Bảo trì sửa chữa");
            list.Add("Bảo trì khẩn cấp");
            list.Add("Bảo trì thường niên");
            list.Add("Khác");
            //Tìm thiết bị theo Id
            var query = db.Devices.Find(Id);
            ViewBag.duan = db.Projects.First(p => p.project_Id == query.project_Id).project_Name;
            var query1 = db.MaintenanceSchedules.SingleOrDefault(p => p.device_Id == Id);
            ViewBag.location = query.device_Location;
            if (query1 != null)
            {
                ViewBag.description = query1.schedule_Description;
                //ViewData["type"] = new SelectList(list, query1.schedule_Type);
                ViewData["type1"] = query1.schedule_Type;
            }
            else
            {
                ViewData["type"] = new SelectList(list);
            }
            return View(query);
        }

        public ActionResult ConfirmXoaLichBaoTri(int Id)
        {
            int projId = (int)db.Devices.Find(Id).project_Id;
            var m = db.MaintenanceSchedules.Where(p => p.device_Id == Id).First();
            try
            {
                db.MaintenanceSchedules.Remove(m);
                db.SaveChanges();
            }
            catch (Exception e)
            {
                ViewBag.err = e.Message;
                return View("XoaLichBaoTri", new { Id = Id });
            }
            return RedirectToAction("DanhSachThietBi", new { id = projId });
        }
        [HttpGet]
        public ActionResult SeeInfo(int id)
        {
            var idProj = (int)db.Devices.Find(id).project_Id;
            ViewBag.idProj = idProj;
            var query2 = from m in db.MaintenanceSchedules
                         join d in db.Devices
                         on m.device_Id equals d.device_Id
                         join p in db.Projects
                         on d.project_Id equals p.project_Id
                         where d.project_Id == idProj
                         select m;
            return View(query2.OrderByDescending(m => m.schedule_Id).ToList());
        }
    }
}