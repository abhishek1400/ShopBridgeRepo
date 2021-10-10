using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopBridge.Models
{
    public class InventoryModel
    {
        public Guid ProductId { get; set; }

        public string ProductName{ get; set; }

        public string ProductDescription { get; set; }

        public float Price { get; set; }

        public int CategoryId { get; set; }

        public string CategoryName{ get; set; }
 
        public string CategoryDescription { get; set; }

        public bool IsActive{ get; set; }
       
    }
}