using ShopBridge.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopBridge.Services
{
    public interface IDbOpsService
    {
        List<InventoryModel> GetInventoryListFromDB();
        int CreateInventory(InventoryModel model);
        int DeleteInventory(Guid id);
        InventoryModel GetInventoryById(Guid id);
        int SubmitUpdateInventory(InventoryModel inventoryModel);
        int SubmitAddInventory(InventoryModel inventoryModel);
        List<CategoryDTO> GetCategoryDetail();
    }
}
