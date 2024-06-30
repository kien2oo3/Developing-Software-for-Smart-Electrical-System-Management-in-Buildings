namespace BTL_TTCSN_Nhom7.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MaintenanceSchedule")]
    public partial class MaintenanceSchedule
    {
        [Key]
        [DisplayName("Mã lịch")]
        public int schedule_Id { get; set; }

        [DisplayName("Thiết bị")]
        public int? device_Id { get; set; }

        [Column(TypeName = "date")]
        [DisplayName("Ngày bắt đầu")]
        public DateTime? schedule_StartDate { get; set; }

        [Column(TypeName = "date")]
        [DisplayName("Ngày kết thúc")]
        public DateTime? schedule_EndDate { get; set; }

        [StringLength(255)]
        [DisplayName("Địa điểm")]
        public string schedule_Location { get; set; }

        [DisplayName("Mô tả")]
        public string schedule_Description { get; set; }

        [StringLength(255)]
        [DisplayName("Thể loại")]
        public string schedule_Type { get; set; }

        [StringLength(255)]
        [DisplayName("Chuyên viên")]
        public string schedule_Technician { get; set; }

        [StringLength(255)]
        [DisplayName("Trạng thái")]
        public string schedule_Status { get; set; }

        public virtual Device Device { get; set; }
    }
}
