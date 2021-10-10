using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using ShopBridge.Models;

namespace ShopBridge.Services
{
    public class DbOpsService:IDbOpsService
    {

        static readonly string connectionString = ConfigurationManager.ConnectionStrings["AssginmentEntities"].ConnectionString.ToString();


        public List<InventoryModel> GetInventoryListFromDB()
        {

            List<InventoryModel> InventoryList = new List<InventoryModel>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                SqlCommand command = new SqlCommand("usp_GetInventory", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var inventory = new InventoryModel()
                    {  
                        ProductId = (Guid)reader["ProductId"]
                        ,ProductName = reader["ProductName"].ToString()
                        ,ProductDescription= reader["ProductDescription"].ToString()
                        ,Price= Convert.ToInt32(reader["Price"])
                        ,CategoryId=Convert.ToInt32(reader["CategoryId"])
                        ,CategoryName= reader["CategoryName"].ToString()
                        ,CategoryDescription= reader["CategoryDescription"].ToString()
                        ,IsActive = Convert.ToBoolean(reader["IsActive"].ToString())
                    };
                    InventoryList.Add(inventory);
                }
            }
            return InventoryList;

        }

        public int CreateInventory(InventoryModel model)
        {
            var t = model;
            return 1;
        }

        public int DeleteInventory(Guid id)
        {
            int result = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_DeleteInventory", connection);
                command.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlParameter param1 = new SqlParameter("@productId", id);
                //param1.SqlDbType = SqlDbType.UniqueIdentifier;

                command.Parameters.AddRange(new SqlParameter[] { param1 });

                result = command.ExecuteNonQuery();

            }
            return result;
        }

        public InventoryModel GetInventoryById(Guid id)
        {
            List<InventoryModel> InventoryList = new List<InventoryModel>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                SqlCommand command = new SqlCommand("usp_GetInventoryById", connection);
                command.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlParameter param1 = new SqlParameter("@id", id);
               // param1.SqlDbType = SqlDbType.UniqueIdentifier;
                command.Parameters.AddRange(new SqlParameter[] { param1 });

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var inventory = new InventoryModel()
                    {
                        ProductId = (Guid)reader["ProductId"],
                        ProductName = reader["ProductName"].ToString(),
                        ProductDescription = reader["ProductDescription"].ToString(),
                        Price = Convert.ToInt32(reader["Price"]),
                        CategoryId = Convert.ToInt32(reader["CategoryId"]),
                        CategoryName = reader["CategoryName"].ToString(),
                        CategoryDescription = reader["CategoryDescription"].ToString(),
                        IsActive = Convert.ToBoolean(reader["IsActive"].ToString())
                    };
                    InventoryList.Add(inventory);
                }
            }
            return InventoryList.FirstOrDefault();
        }

        public int SubmitUpdateInventory(InventoryModel inventoryModel)
        {
            int result = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_UpdateInventory", connection);
                command.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlParameter param1 = new SqlParameter("@productId", inventoryModel.ProductId);
                SqlParameter param2 = new SqlParameter("@productName", inventoryModel.ProductName);
                SqlParameter param3 = new SqlParameter("@productDescription", inventoryModel.ProductDescription);
                SqlParameter param4 = new SqlParameter("@price", inventoryModel.Price);
                SqlParameter param5 = new SqlParameter("@isActive", inventoryModel.IsActive);

                command.Parameters.AddRange(new SqlParameter[] { param1,param2,param3,param4,param5 });

                result = command.ExecuteNonQuery();

            }
            return result;
        }

        public int SubmitAddInventory(InventoryModel inventoryModel)
        {
            int result = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_AddInventory", connection);
                command.CommandType = CommandType.StoredProcedure;
                connection.Open();
               // SqlParameter param1 = new SqlParameter("@productId", inventoryModel.ProductId);
                SqlParameter param2 = new SqlParameter("@productName", inventoryModel.ProductName);
                SqlParameter param3 = new SqlParameter("@productDescription", inventoryModel.ProductDescription);
                SqlParameter param4 = new SqlParameter("@price", inventoryModel.Price);
                SqlParameter param5 = new SqlParameter("@isActive", inventoryModel.IsActive);
                SqlParameter param6 = new SqlParameter("@CategoryId", inventoryModel.CategoryId);


                command.Parameters.AddRange(new SqlParameter[] { param2, param3, param4, param5,param6 });

                result = command.ExecuteNonQuery();

            }
            return result;
        }

        public List<CategoryDTO> GetCategoryDetail()
        {
            List<CategoryDTO> categoryList = new List<CategoryDTO>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                string query = @"SELECT [CategoryId] ,[CategoryName] ,[CategoryDescription]  FROM [Category]";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
             
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var category = new CategoryDTO()
                    {
                        CategoryId = (int)reader["CategoryId"],
                        CategoryName = reader["CategoryName"].ToString(),
                        CategoryDescription = reader["CategoryDescription"].ToString()
                    };
                    categoryList.Add(category);
                }
            }
            return categoryList;
        }


    }
}