using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.IO;
using System.Collections.Generic;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for selectUser
    /// </summary>
    [WebService(Namespace = "http://localhost/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]

    public class selectUser : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public string[] GetCompleteList(string prefixText, int count)
        {
            ModuleWorkFlow.BLL.User user = new ModuleWorkFlow.BLL.User();
            List<string> items = new List<string>(count);
            IList list = new ArrayList();
            list = user.getUestInfolike(prefixText,count);
            foreach (ModuleWorkFlow.Model.UserInfo ui in list)
            {
                items.Add(ui.UserName+"_"+ui.Name); 
            }
            return items.ToArray();
        }
    }
}
