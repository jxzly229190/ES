﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ES.Server
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Entities : DbContext
    {
        public Entities()
            : base("name=Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }
        public virtual DbSet<Client> Client { get; set; }
        public virtual DbSet<TranConfig> TranConfig { get; set; }
        public virtual DbSet<TranLog> TranLog { get; set; }
        public virtual DbSet<Meta_KeyValue> Meta_KeyValue { get; set; }
        public virtual DbSet<TranBlobConfig> TranBlobConfig { get; set; }
    }
}
