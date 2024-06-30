using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BTL_TTCSN_Nhom7.Models;
using Newtonsoft.Json;
using PagedList;

namespace BTL_TTCSN_Nhom7.Controllers
{
    public class DevicesController : Controller
    {
        private ManageDB db = new ManageDB();

        // GET: Devices
        public ActionResult Index(FormCollection f, string Name, int? page, string NameCurrent, string listPrj, string listCat, string PrjCurrent, string CatCurrent)
        {
            ViewData["listPrj"] = new SelectList(db.Projects, "project_Id", "project_Name", PrjCurrent);
            ViewData["listCat"] = new SelectList(db.Categories, "category_Id", "category_Name", CatCurrent);
            //var devices = db.Devices.Include(d => d.Category).Include(d => d.Project);
            //Lấy giá trị bộ lọc 1 hiện tại:
            if (listPrj != null)
            {
                page = 1;
            }
            else
            {
                listPrj = PrjCurrent;
            }
            ViewBag.PrjCurrent = listPrj;
            //Lấy giá trị bộ lọc 1 hiện tại:
            if (listCat != null)
            {
                page = 1;
            }
            else
            {
                listCat = CatCurrent;
            }
            ViewBag.CatCurrent = listCat;
            //Lấy giá trị bộ lọc 3 hiện tại:
            if (Name != null)
            {
                page = 1; //Trang đầu tiên
            }
            else
            {
                Name = NameCurrent;
            }
            ViewBag.NameCurrent = Name;

            var devices = db.Devices.Select(p => p);

            //Tìm kiếm theo mã dự án:
            if (!String.IsNullOrEmpty(listPrj))
            {
                int id = int.Parse(listPrj);
                devices = devices.Where(p => p.project_Id == id);
            }
            //Tìm kiếm theo mã danh mục:
            if (!String.IsNullOrEmpty(listCat))
            {
                int id = int.Parse(listCat);
                devices = devices.Where(p => p.category_Id == id);
            }
            //Tìm kiếm theo tên:
            if (!String.IsNullOrEmpty(Name))
            {
                devices = devices.Where(p => p.device_Name.Contains(Name));
            }

            //Sắp xếp trước khi phân trang:
            devices = devices.OrderByDescending(p => p.device_Id);
            //Phân trang:
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(devices.ToPagedList(pageNumber, pageSize));
        }

        // GET: Devices/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Device device = db.Devices.Find(id);
            if (device == null)
            {
                return HttpNotFound();
            }
            return View(device);
        }

        // GET: Devices/Create
        public ActionResult Create()
        {
            ViewBag.category_Id = new SelectList(db.Categories, "category_Id", "category_Name");
            ViewBag.project_Id = new SelectList(db.Projects, "project_Id", "project_Name");
            return View();
        }

        // POST: Devices/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "device_Id,project_Id,device_Name,device_Img,device_Description,device_Location,device_Price,device_Status,category_Id,device_Specifications,device_Warranty,device_Manufacturer")] Device device)
        //{
        //    try
        //    {
        //        if (ModelState.IsValid)
        //        {
        //            //Lấy file ảnh từ input type=file:
        //            var ImgFile = Request.Files["ImgFile"];
        //            //Kiểm tra đk:
        //            if (ImgFile != null && ImgFile.ContentLength > 0)
        //            {
        //                //Lấy tên ảnh:
        //                var ImgName = System.IO.Path.GetFileName(ImgFile.FileName);
        //                //Tạo đường dẫn và lưu File ảnh lên Server:
        //                var ImgPath = Server.MapPath("~/wwwroot/images/" + ImgName);
        //                ImgFile.SaveAs(ImgPath);
        //                //Lưu tên ảnh cho đối tượng Device:
        //                device.device_Img = ImgName;
        //            }
        //            db.Devices.Add(device);
        //            db.SaveChanges();
        //        }
        //        return RedirectToAction("Index");
        //    }
        //    catch (Exception e)
        //    {
        //        ViewBag.err = "Lỗi khi thêm!" + e.Message;
        //        ViewBag.category_Id = new SelectList(db.Categories, "category_Id", "category_Name", device.category_Id);
        //        ViewBag.project_Id = new SelectList(db.Projects, "project_Id", "project_Name", device.project_Id);
        //        return View(device);
        //    }
        //}
        [HttpPost]
        public ActionResult Create(FormCollection f)
        {
            try
            {
                // Lấy dữ liệu từ yêu cầu Ajax
                var deviceJson = Request.Form["device"];
                var device = JsonConvert.DeserializeObject<Device>(deviceJson);
                //Lấy File ảnh:
                var ImgFile = Request.Files[0];
                if (ImgFile != null && ImgFile.ContentLength > 0)
                {
                    // Lấy tên ảnh:
                    var imgName = System.IO.Path.GetFileName(ImgFile.FileName);
                    // Tạo đường dẫn và lưu ảnh lên Server:
                    var imgPath = Server.MapPath("~/wwwroot/images/" + imgName);
                    ImgFile.SaveAs(imgPath);
                    // Lưu tên ảnh vào đối tượng device:
                    device.device_Img = imgName;
                }
                db.Devices.Add(device);
                db.SaveChanges();
                return Json(new { result = true, JsonRequestBehavior.AllowGet });
            }
            catch (Exception e)
            {
                return Json(new { result = false, error = e.Message });
            }
        }

        // GET: Devices/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Device device = db.Devices.Find(id);
            if (device == null)
            {
                return HttpNotFound();
            }
            ViewBag.category_Id = new SelectList(db.Categories, "category_Id", "category_Name", device.category_Id);
            ViewBag.project_Id = new SelectList(db.Projects, "project_Id", "project_Name", device.project_Id);
            return View(device);
        }

        // POST: Devices/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "device_Id,project_Id,device_Name,device_Img,device_Description,device_Location,device_Price,device_Status,category_Id,device_Specifications,device_Warranty,device_Manufacturer")] Device device)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        //Lấy file ảnh từ input type=file:
        //        var ImgFile = Request.Files["ImgFile"];
        //        //Kiểm tra đk:
        //        if (ImgFile != null && ImgFile.ContentLength > 0)
        //        {
        //            //Lấy tên ảnh:
        //            var ImgName = System.IO.Path.GetFileName(ImgFile.FileName);
        //            //Tạo đường dẫn và lưu File ảnh lên Server:
        //            var ImgPath = Server.MapPath("~/wwwroot/images/" + ImgName);
        //            ImgFile.SaveAs(ImgPath);
        //            //Lưu tên ảnh cho đối tượng Device:
        //            device.device_Img = ImgName;
        //        }
        //        db.Entry(device).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.category_Id = new SelectList(db.Categories, "category_Id", "category_Name", device.category_Id);
        //    ViewBag.project_Id = new SelectList(db.Projects, "project_Id", "project_Name", device.project_Id);
        //    return View(device);
        //}
        [HttpPost]
        public ActionResult Edit(int id, FormCollection f)
        {
            var query = db.Devices.Find(id);
            try
            {
                //Lấy file ảnh từ input type=file:
                var ImgFile = Request.Files["ImgFile"];
                //Kiểm tra đk:
                if (ImgFile != null && ImgFile.ContentLength > 0)
                {
                    //Lấy tên ảnh:
                    var ImgName = System.IO.Path.GetFileName(ImgFile.FileName);
                    //Tạo đường dẫn và lưu File ảnh lên Server:
                    var ImgPath = Server.MapPath("~/wwwroot/images/" + ImgName);
                    ImgFile.SaveAs(ImgPath);
                    //Lưu tên ảnh cho đối tượng Device:
                    query.device_Img = ImgName;
                }
                //Gán lại các giá trị cho query:
                query.project_Id = int.Parse(f["project_Id"]);
                query.device_Name = f["device_Name"];
                query.device_Description = f["device_Description"];
                query.device_Location = f["device_Location"];
                query.device_Price = double.Parse(f["device_Price"]);
                query.device_Status = f["device_Status"];
                query.category_Id = int.Parse(f["category_Id"]);
                query.device_Specifications = f["device_Specifications"];
                query.device_Warranty = f["device_Warranty"];
                query.device_Manufacturer = f["device_Manufacturer"];
                //Thực hiện chức năng cập nhật:
                db.Devices.AddOrUpdate(query);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ViewBag.category_Id = new SelectList(db.Categories, "category_Id", "category_Name", query.category_Id);
                ViewBag.project_Id = new SelectList(db.Projects, "project_Id", "project_Name", query.project_Id);
                ViewBag.err = "Lỗi khi sửa!" + e.Message;
                return View(query);
            }
        }

        // GET: Devices/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Device device = db.Devices.Find(id);
            if (device == null)
            {
                return HttpNotFound();
            }
            return View(device);
        }

        // POST: Devices/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Device device = db.Devices.Find(id);
            try
            {
                db.Devices.Remove(device);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ViewBag.err = "Lỗi khi xóa!" + e.Message;
                return View("Delete", device);
            }

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
