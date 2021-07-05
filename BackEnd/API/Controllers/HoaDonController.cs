using System;
using System.Collections.Generic;
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
    public class HoaDonController : ControllerBase
    {
        private IHoaDonBusiness _hoaDonBusiness;
        public HoaDonController(IHoaDonBusiness hoaDonBusiness)
        {
            _hoaDonBusiness = hoaDonBusiness;
        }

        [Route("create-hoa-don")]
        [HttpPost]
        public HoaDonModel CreateItem([FromBody] HoaDonModel model)
        {
            model.ma_hoa_don = Guid.NewGuid().ToString();
            if (model.listjson_chitiet != null)
            {
                foreach (var item in model.listjson_chitiet)
                {
                    item.ma_hoa_don = model.ma_hoa_don;
                    item.ma_chi_tiet = Guid.NewGuid().ToString();
                }

            }
            _hoaDonBusiness.Create(model);
            return model;
        }
        [Route("update-hoa-don")]
        [HttpPost]
        public  IEnumerable <OrderDetails> updateItem([FromBody] IEnumerable <OrderDetails> model)
        {
           
            return _hoaDonBusiness.Update(model);
        }

        //[Route("update-hoa-don")]
        //[HttpPost]
        //public HoaDonModel UpdateItem([FromBody] HoaDonModel model)
        //{
        //    if (model.listjson_chitiet != null)
        //    {
        //        foreach (var item in model.listjson_chitiet)
        //            if (item.status == 1)
        //            {
        //                item.ma_chi_tiet = Guid.NewGuid().ToString();
        //            }
        //    }
        //    _hoaDonBusiness.Update(model);
        //    return model;
        //}

        [Route("search")]
        [HttpPost]
        public ResponseModel Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string hoten = "";
                if (formData.Keys.Contains("hoten") && !string.IsNullOrEmpty(Convert.ToString(formData["hoten"]))) { hoten = Convert.ToString(formData["hoten"]); }
                string diachi = "";
                if (formData.Keys.Contains("diachi") && !string.IsNullOrEmpty(Convert.ToString(formData["diachi"]))) { diachi = Convert.ToString(formData["diachi"]); }
                long total = 0;
                var data = _hoaDonBusiness.Search(page, pageSize, out total, hoten, diachi);
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

        [Route("getbystatus/{status}")]
        [HttpGet]
        public List<order> getByStatus(int status)
        {
            try
            {
                return _hoaDonBusiness.GetByStatus(status);

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return null;
        }

        [Route("updateTrangThai")]
        [HttpPost]
        public int updateStatus([FromForm]order data)
        {
            try
            {
                return _hoaDonBusiness.updateStatus(data);

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return 1;
        }

        [Route("get-by-id/{id}")]
        [HttpGet]
        public HoaDonModel GetDatabyID(string id)
        {
            return _hoaDonBusiness.GetDatabyID(id);
        }


        [Route("get-orderDetail/{id}")]
        [HttpGet]
        public List<OrderDetails> getOrderDetail(int id)
        {
            try
            {
                return _hoaDonBusiness.GetOrderDetail(id);

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        [Route("delete")]
        [HttpPost]
        public IActionResult DeleteUser([FromBody] Dictionary<string, object> formData)
        {
            string ma_hoa_don = "";
            if (formData.Keys.Contains("ma_hoa_don") && !string.IsNullOrEmpty(Convert.ToString(formData["ma_hoa_don"]))) { ma_hoa_don = Convert.ToString(formData["ma_hoa_don"]); }
            _hoaDonBusiness.Delete(ma_hoa_don);
            return Ok();
        }


        [Route("delete-get-by-id/{id}")]
        [HttpGet]
        public IActionResult Delete(string id)
        {
            _hoaDonBusiness.Delete(id);
            return Ok();
        }
    }
}
