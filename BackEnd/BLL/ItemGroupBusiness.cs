using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public partial class ItemGroupBusiness : IItemGroupBusiness
    {
        private IItemGroupRepository _res;
        public ItemGroupBusiness(IItemGroupRepository ItemGroupRes)
        {
            _res = ItemGroupRes;
        }

        public bool Create(ItemGroupModel model)
        {
            return _res.Create(model);
        }

        public bool Delete(string id)
        {
            return _res.Delete(id);
        }



        public List<ItemGroupModel> GetDataAll(int s)
        {
            return _res.GetDataAll(s);
        }

        public ItemGroupModel GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }

        //public List<ItemGroupModel> GetHiearchyList(List<ItemGroupModel> lstAll, ItemGroupModel node)
        //{
        //    //var lstChilds = lstAll.Where(ds => ds.parent_item_group_id == node.item_group_id).ToList();
        //    //if (lstChilds.Count == 0)
        //    //    return null;
        //    //for (int i = 0; i < lstChilds.Count; i++)
        //    //{
        //    //    var childs = GetHiearchyList(lstAll, lstChilds[i]);
        //    //    lstChilds[i].type = (childs == null || childs.Count == 0) ? "leaf" : "";
        //    //    lstChilds[i].children = childs;
        //    //}
        //    //return lstChilds.OrderBy(s => s.seq_num).ToList();
        //}

        public List<ItemGroupModel> Search(int pageIndex, int pageSize, out long total, string item_group_name)
        {
            return _res.Search(pageIndex, pageSize, out total, item_group_name);
        }

        public bool Update(ItemGroupModel model)
        {
            return _res.Update(model);
        }
        public IEnumerable<ItemGroupModel> GetDataAllwithoutpage()
        {
            return _res.GetDataAllwithoutpage();
        }
    }

}
