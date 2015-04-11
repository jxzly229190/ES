//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel.DataAnnotations;

namespace ES.Server
{
    using System;
    using System.Collections.Generic;
    
    public partial class TranConfig
    {
        public int ID { get; set; }
        public System.Guid Guid { get; set; }
        [Required(ErrorMessage = "传输名称 不能为空")]
        [Display(Name = "传输名称")]
        public string Name { get; set; }
        [Required(ErrorMessage = "传输编码 不能为空")]
        [Display(Name = "传输编码")]
        public string Code { get; set; }
        [Required(ErrorMessage = "顺序 不能为空")]
        [Display(Name = "顺序")]
        public int Sort { get; set; }
        [Required(ErrorMessage = "最大传输行 不能为空")]
        [Display(Name = "最大传输行")]
        public int MaxCount { get; set; }
        public Nullable<long> LastStamp { get; set; }
        [Display(Name = "方向")]
        public int Direct { get; set; }
        [Display(Name = "传输头")]
        [DataType(DataType.MultilineText)]
        public string HeaderSql { get; set; }
        [Display(Name = "传输体")]
        [DataType(DataType.MultilineText)]
        public string DetailSql { get; set; }
        [Display(Name = "传输脚")]
        [DataType(DataType.MultilineText)]
        public string FooterSql { get; set; }
        [Display(Name = "备注")]
        [DataType(DataType.MultilineText)]
        public string Remark { get; set; }
        [Display(Name = "状态")]
        public int Status { get; set; }
        [Display(Name = "重要程度")]
        public int Import { get; set; }
        [Display(Name = "时间戳")]
        public byte[] Timestamp { get; set; }
        public System.DateTime CreatedTime { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> ModifiedTime { get; set; }
        public string ModifiedBy { get; set; }
    }
}
