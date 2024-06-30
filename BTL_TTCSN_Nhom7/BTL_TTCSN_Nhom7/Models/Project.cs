namespace BTL_TTCSN_Nhom7.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Project")]
    public partial class Project
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Project()
        {
            Devices = new HashSet<Device>();
        }

        [Key]
        [DisplayName("Mã dự án")]
        public int project_Id { get; set; }

        [DisplayName("Tên dự án")]
        [Required(ErrorMessage = "Tên dự án không được để trống!")]
        [StringLength(255)]
        public string project_Name { get; set; }

        [DisplayName("Mô tả")]
        public string project_Description { get; set; }

        [DisplayName("Ngày bắt đầu")]
        public DateTime? project_StartDate { get; set; }

        [DisplayName("Ngày kết thúc")]
        public DateTime? project_EndDate { get; set; }

        [DisplayName("Địa điểm")]
        public string project_Location { get; set; }

        [DisplayName("Ngân sách")]
        public double? project_Budget { get; set; }

        [DisplayName("Quản lý")]
        [StringLength(255)]
        public string project_Manager { get; set; }

        [DisplayName("Khách hàng")]
        public int? project_Client_Id { get; set; }

        [DisplayName("Trạng thái")]
        [StringLength(255)]
        public string project_Status { get; set; }

        [DisplayName("Loại")]
        [StringLength(255)]
        public string project_Type { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Device> Devices { get; set; }

        public virtual User User { get; set; }
    }
}
