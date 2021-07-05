using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL
{
    public partial interface IItemRepository
    {
        bool Update(ItemModel model);
        bool Delete(string item_id);
        bool Create(ItemModel model);
        List<ItemModel> GetDataAllnopage();
        ItemModel GetDatabyID(string id);
        List<ItemModel> GetDatabyCate(string id);
        List<ItemModel> GetDataAll(int s);
        List<ItemModel> Search(int pageIndex, int pageSize, out long total, string item_group_id);
        
    }
}
