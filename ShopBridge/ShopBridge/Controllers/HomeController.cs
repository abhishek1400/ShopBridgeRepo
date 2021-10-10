using Newtonsoft.Json;
using ShopBridge.Models;
using ShopBridge.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace ShopBridge.Controllers
{
    public class HomeController : Controller
    {
        static string baseApiUrl = "http://localhost:57526/api/";
        public async Task<ActionResult> Index()
        {
            List<InventoryModel> product = new List<InventoryModel>();
            HttpResponseMessage response = new HttpResponseMessage();
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Clear();
            client.BaseAddress = new Uri(baseApiUrl + "HomeApi/GetInventory");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            try
            {
                response = await client.GetAsync(baseApiUrl + "HomeApi/GetInventory");
                if (response.IsSuccessStatusCode)
                {
                    product = JsonConvert.DeserializeObject<List<InventoryModel>>(response.Content.ReadAsStringAsync().Result);
                }
            }
            catch (Exception e)
            {
                var m = e.Message;
            }
            finally
            {
                client.Dispose();
            }

            return View(product);
        }

        public async Task<ActionResult> DeleteInventory(string Id)
        {

            HttpResponseMessage response = new HttpResponseMessage();
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Clear();
            client.BaseAddress = new Uri(baseApiUrl + "HomeApi/DeleteInventory");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            try
            {
                response = await client.GetAsync(baseApiUrl + "HomeApi/DeleteInventory/?Id=" + Id);
                if (response.IsSuccessStatusCode)
                {
                    ViewBag.Message = "Inventory Deleted";
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            finally
            {
                client.Dispose();
            }


            return RedirectToAction("Index", "Home");
        }

        public async Task<ActionResult> AddUpdateInventory()
        {
            List<CategoryDTO> categories = new List<CategoryDTO>();
            HttpResponseMessage response = new HttpResponseMessage();
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Clear();
            client.BaseAddress = new Uri(baseApiUrl + "HomeApi/GetCategoryDetail");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            try
            {
                response = await client.GetAsync(baseApiUrl + "HomeApi/GetCategoryDetail");
                if (response.IsSuccessStatusCode)
                {
                    categories = JsonConvert.DeserializeObject<List<CategoryDTO>>(response.Content.ReadAsStringAsync().Result);
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            finally
            {
                client.Dispose();
            }

            ViewBag.Categories = categories;
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> AddUpdateInventory(InventoryModel model)
        {
            InventoryModel product = new InventoryModel();
            HttpResponseMessage response = new HttpResponseMessage();
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Clear();
            client.BaseAddress = new Uri(baseApiUrl + "HomeApi/UpdateInventory");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            try
            {
                response = await client.PostAsJsonAsync(baseApiUrl + "HomeApi/SubmitAddInventory",model);
                if (response.IsSuccessStatusCode)
                {
                    product = JsonConvert.DeserializeObject<InventoryModel>(response.Content.ReadAsStringAsync().Result);
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            finally
            {
                client.Dispose();
            }
            return RedirectToAction("Index");
        }

        public async Task<ActionResult> UpdateInventory(string Id)
        {
            InventoryModel product = new InventoryModel();
            HttpResponseMessage response = new HttpResponseMessage();
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Clear();
            client.BaseAddress = new Uri(baseApiUrl + "HomeApi/UpdateInventory");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            try
            {
                response = await client.GetAsync(baseApiUrl + "HomeApi/UpdateInventory/?id=" + Id);
                if (response.IsSuccessStatusCode)
                {
                    product = JsonConvert.DeserializeObject<InventoryModel>(response.Content.ReadAsStringAsync().Result);
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            finally
            {
                client.Dispose();
            }


            return View(product);
        }


        [HttpPost]
        public async Task<ActionResult> UpdateInventory(InventoryModel inventoryModel)
        {
            InventoryModel product = new InventoryModel();
            HttpResponseMessage response = new HttpResponseMessage();
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Clear();
            client.BaseAddress = new Uri(baseApiUrl + "HomeApi/SubmitUpdateInventory");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            try
            {
                response = await client.PostAsJsonAsync(baseApiUrl + "HomeApi/SubmitUpdateInventory", inventoryModel);
                if (response.IsSuccessStatusCode)
                {
                    product = JsonConvert.DeserializeObject<InventoryModel>(response.Content.ReadAsStringAsync().Result);
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            finally
            {
                client.Dispose();
            }


            return RedirectToAction("Index");
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}