using Newtonsoft.Json;
using ShopBridge.Models;
using ShopBridge.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace ShopBridge.Controllers
{
    public class HomeApiController:ApiController
    {
        private  IDbOpsService _DbOps;
        public HomeApiController(IDbOpsService dbOpsService)
        {
            _DbOps = dbOpsService;
        }

        [HttpGet,ActionName("GetInventory")]
        public dynamic GetInventory()
        {
            var inventory = _DbOps.GetInventoryListFromDB();
         
            return  inventory;
        }


        [HttpGet, ActionName("DeleteInventory")]
        public dynamic DeleteInventory(string Id )
        {
            var tguid = Guid.Parse( Id);
            var inventory = _DbOps.DeleteInventory(tguid);
        
            return inventory;
        }

       
        [HttpGet, ActionName("UpdateInventory")]
        public dynamic UpdateInventory(string id)
        {
            var tguid = Guid.Parse(id);
            var inventory = _DbOps.GetInventoryById(tguid);

            return inventory;
        }

        [HttpPost, ActionName("SubmitUpdateInventory")]
        public dynamic SubmitUpdateInventory([FromBody] InventoryModel inventoryModel)
        {
            //var tguid = Guid.Parse(id);
            var inventory = _DbOps.SubmitUpdateInventory(inventoryModel);
           // int t = 8;
            return inventory;
        }

        [HttpPost, ActionName("SubmitAddInventory")]
        public dynamic SubmitAddInventory([FromBody] InventoryModel inventoryModel)
        {
            //var tguid = Guid.Parse(id);
            var inventory = _DbOps.SubmitAddInventory(inventoryModel);
            // int t = 8;
            return inventory;
        }

        [HttpGet, ActionName("GetCategoryDetail")]
        public dynamic GetCategoryDetail()
        {
            var inventory = _DbOps.GetCategoryDetail();
            return inventory;
        }




    }
}