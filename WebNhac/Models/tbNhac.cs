//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebNhac.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbNhac
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbNhac()
        {
            this.tbAlbumCaNhans = new HashSet<tbAlbumCaNhan>();
            this.tbAlbumDSNhacs = new HashSet<tbAlbumDSNhac>();
            this.tbTrinhBays = new HashSet<tbTrinhBay>();
            this.tbBinhLuans = new HashSet<tbBinhLuan>();
        }
    
        public int MaNhac { get; set; }
        public string TenBaiHat { get; set; }
        public string HinhAnh { get; set; }
        public string LoiBaiHat { get; set; }
        public string Nhac { get; set; }
        public Nullable<int> LuotXem { get; set; }
        public string LinkTaiVe { get; set; }
        public Nullable<int> LuotLike { get; set; }
        public Nullable<int> MaTheLoai { get; set; }
        public Nullable<int> MaQuocGia { get; set; }
        public Nullable<System.DateTime> NgayDang { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbAlbumCaNhan> tbAlbumCaNhans { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbAlbumDSNhac> tbAlbumDSNhacs { get; set; }
        public virtual tbQuocGia tbQuocGia { get; set; }
        public virtual tbTheLoai tbTheLoai { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbTrinhBay> tbTrinhBays { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbBinhLuan> tbBinhLuans { get; set; }
    }
}
