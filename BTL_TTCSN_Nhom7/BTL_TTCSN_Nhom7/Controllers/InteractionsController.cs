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
    public class InteractionsController : Controller
    {
        private ManageDB db = new ManageDB();

        // GET: Interactions
        public ActionResult Index()
        {
            var interactions = db.Interactions.Include(i => i.Device).Include(i => i.User);
            interactions = interactions.OrderByDescending(i => i.interaction_Id).Take(5);
            return View(interactions.ToList());
        }

        // GET: Interactions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Interaction interaction = db.Interactions.Find(id);
            if (interaction == null)
            {
                return HttpNotFound();
            }
            return View(interaction);
        }

        // GET: Interactions/Create
        public ActionResult Create()
        {
            ViewBag.device_Id = new SelectList(db.Devices, "device_Id", "device_Name");
            ViewBag.users_Id = new SelectList(db.Users, "users_Id", "users_Username");
            return View();
        }

        // POST: Interactions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "interaction_Id,device_Id,users_Id,interaction_Type,interaction_Time,interaction_Details")] Interaction interaction)
        {
            if (ModelState.IsValid)
            {
                db.Interactions.Add(interaction);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.device_Id = new SelectList(db.Devices, "device_Id", "device_Name", interaction.device_Id);
            ViewBag.users_Id = new SelectList(db.Users, "users_Id", "users_Username", interaction.users_Id);
            return View(interaction);
        }

        // GET: Interactions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Interaction interaction = db.Interactions.Find(id);
            if (interaction == null)
            {
                return HttpNotFound();
            }
            ViewBag.device_Id = new SelectList(db.Devices, "device_Id", "device_Name", interaction.device_Id);
            ViewBag.users_Id = new SelectList(db.Users, "users_Id", "users_Username", interaction.users_Id);
            return View(interaction);
        }

        // POST: Interactions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "interaction_Id,device_Id,users_Id,interaction_Type,interaction_Time,interaction_Details")] Interaction interaction)
        {
            if (ModelState.IsValid)
            {
                db.Entry(interaction).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.device_Id = new SelectList(db.Devices, "device_Id", "device_Name", interaction.device_Id);
            ViewBag.users_Id = new SelectList(db.Users, "users_Id", "users_Username", interaction.users_Id);
            return View(interaction);
        }

        // GET: Interactions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Interaction interaction = db.Interactions.Find(id);
            if (interaction == null)
            {
                return HttpNotFound();
            }
            return View(interaction);
        }

        // POST: Interactions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Interaction interaction = db.Interactions.Find(id);
            db.Interactions.Remove(interaction);
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
