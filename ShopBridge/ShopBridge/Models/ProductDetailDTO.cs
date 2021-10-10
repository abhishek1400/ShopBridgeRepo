using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopBridge.Models
{
    public class ProductDetailDTO
    {

        public Guid ProductId { get; set; }
        
        public string ProductName { get; set; }
        
        public string ProductDescription { get; set; }
        
        public float Price { get; set; }
       
        public int MyProperty { get; set; }
        //CategoryId]
        //CreatedOn]
        //UpdatedOn]
        //IsActive]
    }
}