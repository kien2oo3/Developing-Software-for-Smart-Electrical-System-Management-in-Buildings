namespace BTL_TTCSN_Nhom7.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            Interactions = new HashSet<Interaction>();
            Projects = new HashSet<Project>();
        }

        [Key]
        [DisplayName("Mã tài khoản")]
        public int users_Id { get; set; }

        [DisplayName("Tài khoản")]
        [Required(ErrorMessage = "Tên đăng nhập không được để trống!")]
        [StringLength(50)]
        public string users_Username { get; set; }

        [DisplayName("Mật khẩu")]
        [Required(ErrorMessage = "Mật khẩu không được để trống!")]
        [StringLength(12)]
        public string users_Password { get; set; }

        [DisplayName("Người dùng")]
        [Required(ErrorMessage = "Người dùng không được để trống!")]
        [StringLength(255)]
        public string users_Full_Name { get; set; }

        [DisplayName("Chức vụ")]
        [StringLength(255)]
        public string users_Position { get; set; }

        [DisplayName("Ảnh chân dung")]
        [StringLength(255)]
        public string users_Img { get; set; }

        [DisplayName("Số điện thoại")]
        [StringLength(255)]
        public string users_Phone_Number { get; set; }

        [DisplayName("Địa chỉ")]
        public string users_Address { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Interaction> Interactions { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Project> Projects { get; set; }
    }
}
