namespace BTL_TTCSN_Nhom7.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Device")]
    public partial class Device
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Device()
        {
            Interactions = new HashSet<Interaction>();
            MaintenanceSchedules = new HashSet<MaintenanceSchedule>();
        }

        [Key]
        [DisplayName("Mã thiết bị")]
        public int device_Id { get; set; }

        [DisplayName("Dự án")]
        public int? project_Id { get; set; }

        [DisplayName("Tên thiết bị")]
        [StringLength(255)]
        public string device_Name { get; set; }

        [DisplayName("Hình ảnh")]
        [StringLength(255)]
        public string device_Img { get; set; }

        [DisplayName("Mô tả")]
        public string device_Description { get; set; }

        [DisplayName("Nơi lắp đặt")]
        public string device_Location { get; set; }

        [DisplayName("Giá")]
        public double? device_Price { get; set; }

        [DisplayName("Trạng thái")]
        [StringLength(255)]
        public string device_Status { get; set; }

        [DisplayName("Danh mục")]
        public int? category_Id { get; set; }

        [DisplayName("Thông số kỹ thuật")]
        public string device_Specifications { get; set; }

        [DisplayName("Bảo hành")]
        public string device_Warranty { get; set; }

        [DisplayName("Nhà sản xuất")]
        [StringLength(255)]
        public string device_Manufacturer { get; set; }

        public virtual Category Category { get; set; }

        public virtual Project Project { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Interaction> Interactions { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MaintenanceSchedule> MaintenanceSchedules { get; set; }
    }
}
