using System;
using System.Collections.Generic;

namespace Model
{
    public class ItemModel
    {
        //public string item_id { get; set; } = Guid.NewGuid().ToString();
        public int item_id { get; set; } //Sua
        public int item_group_id { get; set; } //Sua
        public string item_name { get; set; }
        public string item_image { get; set; }
        public double item_price { get; set; }
        public int total { get; set; }

        //Mới thêm item_description
        public string item_description { get; set; }

    }
}
