using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BTL_TTCSN_Nhom7.Models;

namespace BTL_TTCSN_Nhom7.Controllers
{
    public class MaintenanceSchedulesController : Controller
    {
        private ManageDB db = new ManageDB();

        // GET: MaintenanceSchedules
        public ActionResult Index()
        {
            var maintenanceSchedules = db.MaintenanceSchedules.Include(m => m.Device);
            return View(maintenanceSchedules.ToList());
        }
        //Danh sách các dự án:
        public ActionResult DanhSachDuAn()
        {
            var query = db.Projects.Select(p => p);
            return PartialView(query.ToList());
        }
        //Danh sách các thiết bị có lịch bảo trì thuộc dự án
        [Route("DanhSachThietBi_LichBaoTri/{project_Id}")]
        public ActionResult DanhSachThietBiByDuAn(int project_Id)
        {
            var query = from s in db.MaintenanceSchedules
                        join d in db.Devices
                        on s.device_Id equals d.device_Id
                        join p in db.Projects
                        on d.project_Id equals p.project_Id
                        where p.project_Id == project_Id
                        select s;
            return View(query.ToList());
        }

        // GET: MaintenanceSchedules/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MaintenanceSchedule maintenanceSchedule = db.MaintenanceSchedules.Find(id);
            if (maintenanceSchedule == null)
            {
                return HttpNotFound();
            }
            return View(maintenanceSchedule);
        }

        // GET: MaintenanceSchedules/Create
        public ActionResult Create()
        {
            var query = db.Users.Where(p => p.users_Position == "Kỹ thuật viên").ToList();
            //Dropdown list technician:
            List<string> lstTechnician = new List<string>();
            if (query != null)
            {
                foreach (var item in query)
                {
                    lstTechnician.Add(item.users_Full_Name);
                }
            }
            ViewBag.technician = new SelectList(lstTechnician);
            //Dropdown list type:
            List<string> lstType = new List<string>();
            lstType.Add("Bảo trì sửa chữa");
            lstType.Add("Bảo trì khẩn cấp");
            lstType.Add("Bảo trì thường niên");
            lstType.Add("Khác");
            ViewBag.type = new SelectList(lstType);
            //Dropdown list status
            List<string> lstStatus = new List<string>();
            lstStatus.Add("Đang chờ xử lý");
            lstStatus.Add("Đã xác nhận");
            lstStatus.Add("Hoàn thành");
            ViewBag.status = new SelectList(lstStatus);
            ViewBag.device_Id = new SelectList(db.Devices, "device_Id", "device_Name");
            return View();
        }

        // POST: MaintenanceSchedules/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(FormCollection f, [Bind(Include = "schedule_Id,device_Id,schedule_StartDate,schedule_EndDate,schedule_Location,schedule_Description")] MaintenanceSchedule maintenanceSchedule)
        {
            if (ModelState.IsValid)
            {
                maintenanceSchedule.schedule_Type = f["type"];
                maintenanceSchedule.schedule_Status = f["status"];
                maintenanceSchedule.schedule_Technician = f["technician"];
                maintenanceSchedule.schedule_StartDate = DateTime.Now;
                db.MaintenanceSchedules.Add(maintenanceSchedule);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.device_Id = new SelectList(db.Devices, "device_Id", "device_Name", maintenanceSchedule.device_Id);
            return View(maintenanceSchedule);
        }

        // GET: MaintenanceSchedules/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MaintenanceSchedule maintenanceSchedule = db.MaintenanceSchedules.Find(id);
            if (maintenanceSchedule == null)
            {
                return HttpNotFound();
            }
            //Dropdown list technician:
            var query = db.Users.Where(p => p.users_Position == "Kỹ thuật viên").ToList();
            List<string> lstTechnician = new List<string>();
            if (query != null)
            {
                foreach (var item in query)
                {
                    lstTechnician.Add(item.users_Full_Name);
                }
            }
            ViewBag.technician = new SelectList(lstTechnician, maintenanceSchedule.schedule_Technician);
            //Dropdown list type:
            List<string> lstType = new List<string>();
            lstType.Add("Bảo trì sửa chữa");
            lstType.Add("Bảo trì khẩn cấp");
            lstType.Add("Bảo trì thường niên");
            lstType.Add("Khác");
            ViewBag.type = new SelectList(lstType, maintenanceSchedule.schedule_Type);
            //Dropdown list status
            List<string> lstStatus = new List<string>();
            lstStatus.Add("Đang chờ xử lý");
            lstStatus.Add("Đã xác nhận");
            lstStatus.Add("Hoàn thành");
            ViewBag.status = new SelectList(lstStatus, maintenanceSchedule.schedule_Status);
            ViewBag.device_Id = new SelectList(db.Devices, "device_Id", "device_Name", maintenanceSchedule.device_Id);
            return View(maintenanceSchedule);
        }

        // POST: MaintenanceSchedules/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(FormCollection f, [Bind(Include = "schedule_Id,device_Id,schedule_StartDate,schedule_EndDate,schedule_Location,schedule_Description")] MaintenanceSchedule maintenanceSchedule)
        {
            if (ModelState.IsValid)
            {
                maintenanceSchedule.schedule_Type = f["type"];
                maintenanceSchedule.schedule_Status = f["status"];
                maintenanceSchedule.schedule_Technician = f["technician"];
                db.Entry(maintenanceSchedule).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.device_Id = new SelectList(db.Devices, "device_Id", "device_Name", maintenanceSchedule.device_Id);
            return View(maintenanceSchedule);
        }

        // GET: MaintenanceSchedules/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MaintenanceSchedule maintenanceSchedule = db.MaintenanceSchedules.Find(id);
            if (maintenanceSchedule == null)
            {
                return HttpNotFound();
            }
            return View(maintenanceSchedule);
        }

        // POST: MaintenanceSchedules/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MaintenanceSchedule maintenanceSchedule = db.MaintenanceSchedules.Find(id);
            db.MaintenanceSchedules.Remove(maintenanceSchedule);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
