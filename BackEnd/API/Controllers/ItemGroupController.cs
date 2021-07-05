using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using BLL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Model;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemGroupController : ControllerBase
    {
        private IItemGroupBusiness _itemGroupBusiness;
       
        public ItemGroupController(IItemGroupBusiness itemGroupBusiness)
        {
            _itemGroupBusiness = itemGroupBusiness;
            
        }

        [Route("get-menu/{page}")]
        [HttpGet]
        public IEnumerable<ItemGroupModel> GetDataAll(int page)
        {
            return _itemGroupBusiness.GetDataAll(page);
        }

        [Route("get-menu")]
        [HttpGet]
        public IEnumerable<ItemGroupModel> GetAllMenu()
        {
            return _itemGroupBusiness.GetDataAllwithoutpage();
        }

        [Route("get-menu-by-id/{id}")]
        [HttpGet]
        public ItemGroupModel GetDatabyID(string id)
        {
            return _itemGroupBusiness.GetDatabyID(id);
        }


        [Route("create-menu")]
        [HttpPost]
        public ItemGroupModel CreateMenu([FromForm] ItemGroupModel model)
        {
       
            _itemGroupBusiness.Create(model);
            return model;
        }

        [Route("delete-menu/{id}")]
        [HttpGet]
        public IActionResult Delete(string id)
        {

            _itemGroupBusiness.Delete(id);
            return Ok();
        }

       // public IActionResult DeleteMenu([FromBody] Dictionary<string, object> formData)
       // {
       //     string item_group_id = "";
      //      if (formData.Keys.Contains("item_group_id") && !string.IsNullOrEmpty(Convert.ToString(formData["item_group_id"]))) { item_group_id = Convert.ToString(formData["item_group_id"]); }
      //      _itemGroupBusiness.Delete(item_group_id);
      //      return Ok();
      //  }

       
        [Route("update-menu")]
        [HttpPost]
        public ItemGroupModel UpdateMenu([FromForm] ItemGroupModel model)
        {
            _itemGroupBusiness.Update(model);
            return model;
        }


        [Route("search-menu")]
        [HttpPost]
        public ResponseModel Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string item_group_name = "";
                if (formData.Keys.Contains("item_group_name") && !string.IsNullOrEmpty(Convert.ToString(formData["item_group_name"]))) { item_group_name = Convert.ToString(formData["item_group_name"]); }
                
                long total = 0;
                var data = _itemGroupBusiness.Search(page, pageSize, out total, item_group_name);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
    }
}
