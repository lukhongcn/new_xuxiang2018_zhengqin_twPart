using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.IO;
using System.Collections.Generic;

using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;



namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for selectModuleId
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]

    public class selectModuleId : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string[] GetCompleteListNeedOver(string prefixText, int count)
        {
            ModuleWorkFlow.BLL.Order order = new ModuleWorkFlow.BLL.Order();
            List<string> items = new List<string>(count);
            IList list = new ArrayList();
            list = order.getListOrderInfoByNeedOver(prefixText,count);
            foreach (ModuleWorkFlow.Model.OrderInfo oi in list)
            {
                items.Add(oi.Id);
            }
            return items.ToArray();
        }

        [WebMethod]
        public string[] GetCompleteListNeedBusinessOver(string prefixText, int count)
        {
            ModuleWorkFlow.BLL.Order order = new ModuleWorkFlow.BLL.Order();
            List<string> items = new List<string>(count);
            IList list = new ArrayList();
            list = order.getListOrderInfoByNeedBusinessOver(prefixText, count);
            foreach (ModuleWorkFlow.Model.OrderInfo oi in list)
            {
                items.Add(oi.Id);
            }
            return items.ToArray();
        }

        [WebMethod]
        public string[] GetCompleteListNewNeedOver(string prefixText, int count)
        {
            ModuleWorkFlow.BLL.Order order = new ModuleWorkFlow.BLL.Order();
            List<string> items = new List<string>(count);
            IList list = new ArrayList();
            list = order.getListNewOrderInfoByNeedOver(prefixText, count);
            foreach (ModuleWorkFlow.Model.OrderInfo oi in list)
            {
                items.Add(oi.Id);
            }
            return items.ToArray();
        }

        [WebMethod]
        public string[] GetCompleteListUnOver(string prefixText, int count)
        {
            ModuleWorkFlow.BLL.Order order = new ModuleWorkFlow.BLL.Order();
            List<string> items = new List<string>(count);
            IList list = new ArrayList();
            list = order.getListOrderInfoByUnOver(prefixText, count);
            foreach (ModuleWorkFlow.Model.OrderInfo oi in list)
            {
                items.Add(oi.Id);
            }
            return items.ToArray();
        }

        [WebMethod]
        public string[] GetCompleteListNewUnOver(string prefixText, int count)
        {
            ModuleWorkFlow.BLL.Order order = new ModuleWorkFlow.BLL.Order();
            List<string> items = new List<string>(count);
            IList list = new ArrayList();
            list = order.getListNewOrderInfoByUnOver(prefixText, count);
            foreach (ModuleWorkFlow.Model.OrderInfo oi in list)
            {
                items.Add(oi.Id);
            }
            return items.ToArray();
        }

        [WebMethod]
        public string[] GetListUnDesign(string prefixText, int count)
        {
            ModuleWorkFlow.BLL.Order order = new ModuleWorkFlow.BLL.Order();
            List<string> items = new List<string>(count);
            IList list = new ArrayList();
            list = order.getListOrderInfoByUnDesign(prefixText, count);
            foreach (ModuleWorkFlow.Model.OrderInfo oi in list)
            {
                items.Add(oi.Id);
            }
            return items.ToArray();
        }


        [WebMethod]
        public string[] GetListNoDesign(string prefixText, int count)
        {
            ModuleWorkFlow.BLL.Order order = new ModuleWorkFlow.BLL.Order();
            List<string> items = new List<string>(count);
            IList list = new ArrayList();
            list = order.getListOrderInfoByNoDesign(prefixText, count);
            foreach (ModuleWorkFlow.Model.OrderInfo oi in list)
            {
                items.Add(oi.Id);
            }
            return items.ToArray();
        }


        [WebMethod]
        public string[] GetListNewUnDesign(string prefixText, int count)
        {
            ModuleWorkFlow.BLL.Order order = new ModuleWorkFlow.BLL.Order();
            List<string> items = new List<string>(count);
            IList list = new ArrayList();
            list = order.getListOrderInfoByUnDesign(prefixText, count);
            foreach (ModuleWorkFlow.Model.OrderInfo oi in list)
            {
                if (!oi.IsModifyModuleOrder)
                {
                    items.Add(oi.Id);
                }
            }
            return items.ToArray();
        }

        [WebMethod]
        public string[] GetBOMListUnOver(string prefixText, int count)
        {
            BomDesign bomdesign = new BomDesign();
            List<string> items = new List<string>(count);
            IList list = new ArrayList();
            list = bomdesign.getBOMListUnOver(prefixText, count);
            foreach (ModuleWorkFlow.Model.BomDesignInfo bi in list)
            {
                items.Add(bi.ModuleId);
            }
            return items.ToArray();
        }

        [WebMethod]
        public string[] GetNewBOMList(string prefixText, int count)
        {
            BomDesign bomdesign = new BomDesign();
            List<string> items = new List<string>(count);
            IList list = new ArrayList(); 
            list = bomdesign.getNewBOMList(prefixText, count);

            foreach (string moduleid in list)
            {
                items.Add(moduleid);
            }

            return items.ToArray();
        }

        [WebMethod]
        public string[] GetBOMWithoutProcessList(string prefixText, int count)
        {
            BomDesign bomdesign = new BomDesign();
            List<string> items = new List<string>(count);
            IList list = new ArrayList();
            list = bomdesign.getNewBOMList(prefixText, count);

            foreach (string moduleid in list)
            {
                items.Add(moduleid);
            }

            return items.ToArray();
        }

         [WebMethod]
        public string[] getNewModuleList(string prefixText, int count)
        {
            VirtualPart virtualPart = new VirtualPart();
            List<string> items = new List<string>(count);
            IList list = virtualPart.getNewModuleList(prefixText, count);

            foreach (VirtualPartInfo vpi in list)
            {
                items.Add(vpi.ModuleId);
            }
            return items.ToArray();


        }

         [WebMethod]
         public string[] getModuleidlist(string prefixText, int count)
         {
             List<string> items = new List<string>(count);
             IList list = new Order().getModuleidlist(prefixText, count);

             foreach (OrderInfo vpi in list)
             {
                 items.Add(vpi.ModuleId);
             }
             return items.ToArray();

         }

       
    }
}
