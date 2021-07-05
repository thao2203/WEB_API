using System;
using System.Collections.Generic;
using System.Text;

namespace Model
{
    public class order
    {
        public int Order_ID { get; set; } //Sua
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Order_Name { get; set; }

        public List<order> list { get; set; }
        
        public string CreatedDate { get; set; }
        public string total  { get; set; }
        public int status { get; set; }
    }
}
