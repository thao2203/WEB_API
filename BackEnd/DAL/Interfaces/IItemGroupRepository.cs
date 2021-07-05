using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL
{
    public partial interface IItemGroupRepository
    {
        List<ItemGroupModel> GetDataAll(int s);

        // viết inteface creat, updae, delete, getItem theo id, update
        ItemGroupModel GetDatabyID(string item_group_id);

        List<ItemGroupModel> Search(int pageIndex, int pageSize, out long total, string item_group_name);
        bool Create(ItemGroupModel model);
        bool Update(ItemGroupModel model);
        bool Delete(string item_group_id);
        IEnumerable<ItemGroupModel> GetDataAllwithoutpage();
    }
}
