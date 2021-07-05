using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public partial class HoaDonBusiness : IHoaDonBusiness
    {
        private IHoaDonRepository _res;
        public HoaDonBusiness(IHoaDonRepository res)
        {
            _res = res;
        }
        public bool Create(HoaDonModel model)
        {
            return _res.Create(model);
        }
        public IEnumerable<OrderDetails> Update(IEnumerable<OrderDetails> model)
        {
            return _res.updateorder(model);
        }
        public bool Delete(string id)
        {
            return _res.Delete(id);
        }
        public HoaDonModel GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }
        public List<HoaDonModel> Search(int pageIndex, int pageSize, out long total, string hoten, string diachi)
        {
            return _res.Search(pageIndex, pageSize, out total, hoten, diachi);
        }

        public List<order> GetByStatus(int status)
        {
            return _res.GetByStatus(status);
        }

        public int updateStatus(order status)
        {
            return _res.updateStatus(status);
        }

        public List<OrderDetails> GetOrderDetail(int orderID)
        {
            return _res.GetOrderDetail(orderID);
        }
    }

}
