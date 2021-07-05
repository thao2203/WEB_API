using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL
{
    public partial interface IHoaDonBusiness
    {
        bool Create(HoaDonModel model);
        IEnumerable<OrderDetails> Update(IEnumerable<OrderDetails> model);
        HoaDonModel GetDatabyID(string id);
        bool Delete(string id);
        List<HoaDonModel> Search(int pageIndex, int pageSize, out long total, string hoten, string diachi);
        List<order> GetByStatus(int status);
        List<OrderDetails> GetOrderDetail(int orderID);
        int updateStatus(order status);
    }
}
