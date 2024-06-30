namespace BTL_TTCSN_Nhom7.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Category")]
    public partial class Category
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Category()
        {
            Devices = new HashSet<Device>();
        }

        [Key]
        [DisplayName("Mã danh mục")]
        public int category_Id { get; set; }

        [DisplayName("Tên danh mục")]
        [Required(ErrorMessage = "Tên danh mục không được để trống!")]
        [StringLength(255)]
        public string category_Name { get; set; }

        [DisplayName("Lưu ý")]
        public string category_Notes { get; set; }

        [DisplayName("Ngày tạo")]
        public DateTime? category_Created_Date { get; set; }

        [DisplayName("Tác giả")]
        [StringLength(255)]
        public string category_Created_Author { get; set; }

        [DisplayName("Hình ảnh")]
        [StringLength(255)]
        public string category_Img { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Device> Devices { get; set; }
    }
}
