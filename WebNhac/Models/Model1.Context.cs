﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class NgheNhacEntities : DbContext
    {
        public NgheNhacEntities()
            : base("name=NgheNhacEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<tbAlbumCaNhan> tbAlbumCaNhans { get; set; }
        public virtual DbSet<tbBinhLuan> tbBinhLuans { get; set; }
        public virtual DbSet<tbCaSi> tbCaSis { get; set; }
        public virtual DbSet<tbNguoiDung> tbNguoiDungs { get; set; }
        public virtual DbSet<tbNhac> tbNhacs { get; set; }
        public virtual DbSet<tbQuocGia> tbQuocGias { get; set; }
        public virtual DbSet<tbTheLoai> tbTheLoais { get; set; }
        public virtual DbSet<tbTrinhBay> tbTrinhBays { get; set; }
        public virtual DbSet<tbAdmin> tbAdmins { get; set; }
    }
}
