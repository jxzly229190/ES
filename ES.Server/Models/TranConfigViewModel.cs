using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ES.Server.Models
{
    public class CreateTranConfigViewModel
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
        [Display(Name = "方向")]
        public int Direct { get; set; }

        [Display(Name = "传输表")]
        [Required(ErrorMessage = "表名不能为空。")]
        public List<SelectListItem> TableNames { get; set; }

        [Display(Name = "传输字段")]
        [Required(ErrorMessage = "至少需要1个字段。")]
        public List<SelectListItem> ColumnList { get; set; }
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
    }
}