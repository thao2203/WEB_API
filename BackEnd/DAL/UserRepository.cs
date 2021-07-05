using DAL.Helper;
using Model;
using Helper;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System;

namespace DAL
{
    public partial class UserRepository : IUserRepository
    {
        private IDatabaseHelper _dbHelper;
        public UserRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public bool Create(UserModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_user_create",
                "@user_id", model.user_id,
                "@hoten", model.hoten,
                "@ngaysinh", model.ngaysinh,
                "@diachi", model.diachi,
                "@gioitinh", model.gioitinh,
                "@email", model.email,
                "@taikhoan", model.taikhoan,
                "@matkhau", model.matkhau,
                "@role", model.role,
                "@image_url", model.image_url);
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

        public bool Delete(string id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_user_delete",
                "@user_id", id);
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
        public bool Update(UserModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_user_update",
                "@user_id", model.user_id,
                "@hoten", model.hoten,
                "@ngaysinh", model.ngaysinh,
                "@diachi", model.diachi,
                "@gioitinh", model.gioitinh,
                "@email", model.email,
                "@taikhoan", model.taikhoan,
                "@matkhau", model.matkhau,
                "@role", model.role,
                "@image_url", model.image_url);
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


        public UserModel GetUser(string username, string password)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_user_get_by_username_password",
                     "@taikhoan", username,
                     "@matkhau", password);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<UserModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public UserModel GetDatabyID(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_user_get_by_id",
                     "@user_id", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<UserModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<UserModel> Search(int pageIndex, int pageSize, out long total, string hoten, string taikhoan)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_user_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@hoten", hoten,
                    "@taikhoan", taikhoan);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<UserModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static int id;
        public int createorder(order o)
        {
            string query = string.Format("insert into [dbo].[order] (Order_Name,CreatedDate,Phone,Address,total,status)  OUTPUT INSERTED.Order_ID VALUES (N'{0}',N'{1}',N'{2}',N'{3}',{4},0)", o.Order_Name, DateTime.Today, o.Phone, o.Address,o.total);
            id = _dbHelper.getLastId(query);
            return id;//đây này
        }
        public IEnumerable<cart> orderDetails(IEnumerable<cart> model)
        {
            int j = id;
            string msgError = "";
            foreach (cart i in model)//for dây
            {
                //tạo 1 proc insert into ỏderdetails vs các giá trị truyền vào ở dưới
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "oderdetail",
           "@OrderDetail_OrderID", j,
           "@OrderDetail_Name", i.label,
           "@Quantity", i.quantity,
           "@image", i.image,
           "@total",i.price * i.quantity
       );
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
            }
            return model;
        }
    }
}
