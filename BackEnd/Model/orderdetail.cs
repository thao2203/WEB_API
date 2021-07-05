using System;
using System.Collections.Generic;
using System.Text;

namespace Model
{
    public class OrderDetails
    {
        public string OrderDetail_ID { get; set; } //Sua
        public string OrderDetail_OrderID { get; set; } //Sua
        public string image { get; set; }
        public string OrderDetail_Name { get; set; }

        public string Quantity { get; set; }

        public List<OrderDetails> list { get; set; }
        public string total { get; set; }

    }
}
