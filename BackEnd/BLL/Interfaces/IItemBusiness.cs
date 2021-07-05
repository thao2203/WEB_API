using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL
{
    public partial interface IItemBusiness
    {
        bool Create(ItemModel model);
        bool Update(ItemModel model);
        bool Delete(string id);
        ItemModel GetDatabyID(string id);
        List<ItemModel> GetDatabyCate(string id);
        List<ItemModel> GetDataAll(int g);
        List<ItemModel> Search(int pageIndex, int pageSize, out long total, string item_group_id);
        IEnumerable<ItemModel> GetDataAllwithoutpage();
     
    }
}
