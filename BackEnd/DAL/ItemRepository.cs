using DAL.Helper;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public partial class ItemRepository : IItemRepository
    {
        private IDatabaseHelper _dbHelper;
        public ItemRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public bool Create(ItemModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_item_create",
                "@item_group_id", model.item_group_id,
                "@item_image", model.item_image,
                "@item_name", model.item_name,
                "@item_price", model.item_price,
                "@item_description", model.item_description);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public ItemModel GetDatabyID(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_item_get_by_id",
                     "@item_id", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ItemModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<ItemModel> GetDataAll(int s)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_item_all",
                    "@page",s);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ItemModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        public List<ItemModel> GetDataAllnopage()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_item_all_nonepage");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ItemModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<ItemModel> Search(int pageIndex, int pageSize, out long total, string item_group_id)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_item_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@item_group_id", item_group_id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<ItemModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Update(ItemModel model)
        {
            string msgError = "";
            try
            {
                var item = GetDatabyID(model.item_id.ToString());
                if(model.item_image==null)
                {
                    model.item_image = item.item_image;
                }    
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_item_update",
                "@item_id", model.item_id,
                "@item_group_id", model.item_group_id,
                "@item_image", model.item_image,
                "@item_name", model.item_name,
                "@item_price", model.item_price,
                "@item_description", model.item_description);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Delete(string item_id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_item_delete",
                "@id", item_id);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IEnumerable<ItemModel> GetDataAllwithoutpage()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_item_all_pageout"
                   );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ItemModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<ItemModel> GetDatabyCate(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_item_get_by_cate",
                     "@item_group_id", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ItemModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
    }
}
