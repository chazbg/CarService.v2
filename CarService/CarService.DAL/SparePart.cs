//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CarService.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class SparePart
    {
        public SparePart()
        {
            this.RepairCards = new HashSet<RepairCard>();
        }
    
        public int Id { get; set; }
        [Required]
        [Display(Name = "Part")]
        public string PartName { get; set; }

        [Required]
        [Display(Name = "Price")]
        public decimal Price { get; set; }
        public bool Activated { get; set; }
        public int UserId { get; set; }
    
        public virtual UserProfile UserProfile { get; set; }
        public virtual ICollection<RepairCard> RepairCards { get; set; }
    }
}
