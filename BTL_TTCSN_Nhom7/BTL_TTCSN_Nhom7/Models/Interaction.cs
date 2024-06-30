namespace BTL_TTCSN_Nhom7.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Interaction
    {
        [Key]
        [DisplayName("Mã tương tác")]
        public int interaction_Id { get; set; }

        [DisplayName("Tên thiết bị")]
        public int? device_Id { get; set; }

        [DisplayName("Người dùng")]
        public int? users_Id { get; set; }

        [DisplayName("Loại tương tác")]
        [StringLength(255)]
        public string interaction_Type { get; set; }

        [DisplayName("Thời gian")]
        public DateTime? interaction_Time { get; set; }

        [StringLength(255)]
        [DisplayName("Chi tiết")]
        public string interaction_Details { get; set; }

        public virtual Device Device { get; set; }

        public virtual User User { get; set; }
    }
}
