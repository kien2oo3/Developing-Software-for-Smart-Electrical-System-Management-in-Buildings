using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace BTL_TTCSN_Nhom7.Models
{
    public partial class ManageDB : DbContext
    {
        public ManageDB()
            : base("name=ManageDB1")
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Device> Devices { get; set; }
        public virtual DbSet<Interaction> Interactions { get; set; }
        public virtual DbSet<MaintenanceSchedule> MaintenanceSchedules { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>()
                .HasMany(e => e.Projects)
                .WithOptional(e => e.User)
                .HasForeignKey(e => e.project_Client_Id);
        }
    }
}
