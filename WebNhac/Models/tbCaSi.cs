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
    
    public partial class tbCaSi
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbCaSi()
        {
            this.tbTrinhBays = new HashSet<tbTrinhBay>();
        }
    
        public int MaCaSi { get; set; }
        public string TenCaSi { get; set; }
        public string AnhCaSi { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbTrinhBay> tbTrinhBays { get; set; }
    }
}
