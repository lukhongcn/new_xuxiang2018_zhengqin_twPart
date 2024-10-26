using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ModuleWorkFlow
{
    public partial class DefaultSub : System.Web.UI.MasterPage
    {
        protected string menuname;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string _menuid;
        public string menuId
        {
            set
            {
                _menuid = value;
            }
        }

        
        public string Menuname
        {
            get { return menuname; }
            set { menuname = value; }
        }
    }

      
}