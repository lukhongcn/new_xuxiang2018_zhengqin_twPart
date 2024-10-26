using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;



using ModuleWorkFlow.Model;
using ModuleWorkFlow.Model.Unnormal;

using ModuleWorkFlow.business;

using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.Unnormal;
using ModuleWorkFlow.BLL.NewOrder;
using ModuleWorkFlow.Model.NewOrder;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.BLL.Outsource;
using Utility;

namespace ModuleWorkFlow.order.controls
{
    public partial class OrderDesignView : System.Web.UI.UserControl
    {

        protected System.Web.UI.WebControls.DropDownList ListBox_Priority;


        protected ModuleWorkFlow.BLL.PartProcess pp;

        protected string imgpath;
        protected string moduleidshow = "";
        protected DataSet ds;
        protected bool Business;
        private Hashtable hjt = new Hashtable();
        private Hashtable hdiscard = new Hashtable();
        private string menuid = "B01";

        protected void Page_Load(object sender, EventArgs e)
        {
            //ModuleWorkFlow.BLL.Private.translateControl(this);
        }

        public void bindDate(int id, bool isBusiness)
        {
            pp = new ModuleWorkFlow.BLL.PartProcess();
            OrderDesignInfo orderDesigninfo = new OrderDesignInfo();
            OrderDesign orderdesign = new OrderDesign();
            orderDesigninfo = orderdesign.findbykey(id);
            getModuleInfo(id);
            bindColor();
            ds = pp.getPartProcessView(orderDesigninfo.ModuleId.Trim());
            bindPartByModule(orderDesigninfo.ModuleId.Trim(), "");
            Business = isBusiness;

        }

        public void bindDate(string moduleId, string partNo)
        {
            pp = new ModuleWorkFlow.BLL.PartProcess();
            Table3.Visible = false;
            bindColor();
            ds = pp.getPartProcessView(moduleId, partNo, null, new OutSourceDetail());
            bindPartByModule(moduleId.Trim(), "");
        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        ///		Required method for Designer support - do not modify
        ///		the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            initPage();
            this.MainDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemDataBound);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void initPage()
        {
            IList ilist = new ArrayList();
            ModuleWorkFlow.BLL.ControlTable ct = new ControlTable();
            if (Business)
            {
                ilist = ct.getControlTableByTableNameByIsVisible("tb_order", 1);
            }
            else
            {
                ilist = ct.getControlTableByTableNameByIsVisible("tb_order", 0);
            }

            int i = 1;
            TableRow tr = new TableRow();
            foreach (ModuleWorkFlow.Model.ControlTableInfo cti in ilist)
            {

                TableCell tc = new TableCell();
                if (cti.IsVisible == 1)
                {
                    tc.Text = cti.TableValue;
                    tc.Attributes.Add("Width", "1500px");
                    tr.Cells.Add(tc);
                }
                tc = new TableCell();
                Label label = new Label();
                label.ID = "lab_" + cti.TableField;
                if (cti.IsVisible == 1)
                {
                    label.Visible = true;
                }
                else
                {
                    label.Visible = false;
                }
                tc.Controls.Add(label);
                tc.Attributes.Add("Width", "1500px");
                tr.Cells.Add(tc);
                if (i % 3 == 0)
                {
                    Table3.Rows.Add(tr);
                    tr = new TableRow();
                }
                if ((i >= ilist.Count) && (i + 1) % 3 == 0)
                {
                    Table3.Rows.Add(tr);
                    tr = new TableRow();
                }
                if (i == ilist.Count)
                {
                    Table3.Rows.Add(tr);
                }

                i++;
            }
            TableRow trvisible = new TableRow();
            ilist = ct.getControlTableByTableNameByNoIsVisible("tb_order");
            foreach (ModuleWorkFlow.Model.ControlTableInfo cti in ilist)
            {
                TableCell tc = new TableCell();
                if (cti.IsVisible == 1)
                {
                    tc.Text = cti.TableValue;
                    trvisible.Cells.Add(tc);
                }
                tc = new TableCell();
                Label label = new Label();
                label.ID = "lab_" + cti.TableField;
                if (cti.IsVisible == 1)
                {
                    label.Visible = true;
                }
                else
                {
                    label.Visible = false;
                }
                tc.Controls.Add(label);
                tc.Attributes.Add("Width", "400px");
                trvisible.Cells.Add(tc);


            }
            Table3.Rows.Add(trvisible);
            Table3.Attributes.Add("Style", "border-collapse:   collapse");
        }

        //yuding-071210
        private void bindColor()
        {
            string statusId = "";
            ModuleWorkFlow.BLL.Status status = new ModuleWorkFlow.BLL.Status();
            IList sources = status.getStatusInfoByMenuid(menuid);
            ColorConverter cc = new ColorConverter();
            lab_color.Text = "";
            bool bcolor = true;

            foreach (ModuleWorkFlow.Model.StatusInfo si in sources)
            {
                if (si.StatusId.Contains(menuid))
                {
                    statusId = si.StatusId.Split('|')[0];
                    bcolor = false;
                }
                else
                {
                    statusId = si.StatusId;
                }

                if (statusId.Equals("Implementation") || statusId.Equals("JIEDAN") || statusId.Equals("Working") || statusId.Equals("Ready") || statusId.Equals("XIAODAN") || statusId.Equals("Pending"))
                {
                    lab_color.Text = lab_color.Text + "<td bgcolor='#" + si.StatusColor.Substring(2).Trim() + "' width='100px' height='25'><font color='000000'>" + si.StatusDesc + "</font></td>";
                }

                if (statusId.Equals("Holdon"))
                {
                    lab_color.Text = lab_color.Text + "<td bgcolor='#" + si.StatusColor.Substring(2).Trim() + "' width='100px' height='25'><font color='ffffff'>" + si.StatusDesc + "</font></td>";
                }

                //si.StatusDesc = "<font color = '#" + si.StatusColor.Substring(2).Trim() + "'>" + si.StatusDesc + "</font>";
                //if (si.StatusId.Equals("Holdon") || si.StatusId.Equals("Implementation") || si.StatusId.Equals("JIEDAN") || si.StatusId.Equals("Working") || si.StatusId.Equals("Ready") || si.StatusId.Equals("XIAODAN") || si.StatusId.Equals("Pending"))
                //{
                //    lab_color.Text = lab_color.Text + si.StatusDesc + "--";
                //}
            }

            if (bcolor == false)
            {
                lab_color.Text = lab_color.Text + "<td bgcolor='#" + "FFFFFF" + "' width='100px' height='25'>" + Translate.translateString("延誤帶紅色") + "<font color='FF0000'>*</font></td>";
            }
        }

        private void getModuleInfo(int id)
        {
            OrderDesignInfo orderDesigninfo = new OrderDesignInfo();
            OrderDesign orderdesign = new OrderDesign();
            Material material = new Material();
            //DepartMent department = new DepartMent();

            Label lab_isPart = Table3.FindControl("lab_isPart") as Label;
            Label lab_customerid = Table3.FindControl("lab_CustomerId") as Label;
            Label lab_hasprice = Table3.FindControl("lab_hasprice") as Label;
            Label lab_producttype = Table3.FindControl("lab_ProductTypeId") as Label;
            Label lab_clientModuleId = Table3.FindControl("lab_clientModuleId") as Label;

            Label lab_material = Table3.FindControl("lab_material") as Label;
            Label lab_status = Table3.FindControl("lab_StatusId") as Label;

            Label lab_price = (Label)Table3.FindControl("lab_price");
            Label lab_moduleid = (Label)Table3.FindControl("lab_moduleId");
            Label lab_orderSingle = (Label)Table3.FindControl("lab_ordersingle");
            Label lab_customerModuleId = (Label)Table3.FindControl("lab_customerModuleId");
            Label lab_companyProductId = (Label)Table3.FindControl("lab_companyProductId");
            Label lab_signPrice = (Label)Table3.FindControl("lab_signPrice");
            Label lab_tryPrice = (Label)Table3.FindControl("lab_tryPrice");
            Label lab_creater = (Label)Table3.FindControl("lab_creater");
            Label lab_checker = (Label)Table3.FindControl("lab_checker");
            Label lab_Picture = (Label)Table3.FindControl("lab_FinishPicture");
            Label lab_equipMent = (Label)Table3.FindControl("lab_equipMent");
            Label lab_hole = (Label)Table3.FindControl("lab_hole");
            Label lab_extractRate = (Label)Table3.FindControl("lab_extractRate");
            Label lab_startDate = (Label)Table3.FindControl("lab_startDate");
            Label lab_merchindiseenddate = (Label)Table3.FindControl("lab_merchindiseEndDate");
            Label lab_designEndDate = (Label)Table3.FindControl("lab_designEndDate");
            Label lab_designStart = (Label)Table3.FindControl("lab_designStart");
            Label lab_productenddate = (Label)Table3.FindControl("lab_productEndDate");
            Label lab_T3 = (Label)Table3.FindControl("lab_T3");
            Label lab_checkDate = (Label)Table3.FindControl("lab_checkDate");
            Label lab_tryDate0 = (Label)Table3.FindControl("lab_tryDate0");
            Label lab_referencePictureDate = (Label)Table3.FindControl("lab_referencePictureDate");
            Label lab_tryDate1 = (Label)Table3.FindControl("lab_tryDate1");
            Label lab_tryDate3 = (Label)Table3.FindControl("lab_tryDate3");
            Label lab_tryDate2 = (Label)Table3.FindControl("lab_tryDate2");
            Label lab_tryDateF = (Label)Table3.FindControl("lab_tryDateF");
            Label lab_comment = (Label)Table3.FindControl("lab_comment");
            Label lab_productname = (Label)Table3.FindControl("lab_productname");
            Label lab_ton = (Label)Table3.FindControl("lab_ton");
            Label lab_lockManager = (Label)Table3.FindControl("lab_lockManager");
            Label lab_gradeid = (Label)Table3.FindControl("lab_gradeid");
            Label lab_YingYeDanDang = (Label)Table3.FindControl("lab_YingYeDanDang");
            Label lab_priority = (Label)Table3.FindControl("lab_priority");

            Label lab_productSize = (Label)Table3.FindControl("lab_productSize");
            Label lab_avgThick = (Label)Table3.FindControl("lab_avgThick");
            Label lab_moldStruct = (Label)Table3.FindControl("lab_moldStruct");
            Label lab_productApprance = (Label)Table3.FindControl("lab_productApprance");
            Label lab_cavMaterial = (Label)Table3.FindControl("lab_cavMaterial");
            Label lab_corMaterial = (Label)Table3.FindControl("lab_corMaterial");
            Label lab_projectManager1 = (Label)Table3.FindControl("lab_projectManager1");
            Label lab_projectManager2 = (Label)Table3.FindControl("lab_projectManager2");
            Label lab_projectDepartMent = (Label)Table3.FindControl("lab_projectDepartMent");
            Label lab_tryPlant = (Label)Table3.FindControl("lab_tryPlant");
            Label lab_batchPlant = (Label)Table3.FindControl("lab_batchPlant");
            Label lab_slideMaterial = (Label)Table3.FindControl("lab_slideMaterial");
            Label lab_slideCount = (Label)Table3.FindControl("lab_slideCount");
            Label lab_difficultlevel = (Label)Table3.FindControl("lab_difficultlevel");
            Label lab_pinNumber = (Label)Table3.FindControl("lab_pinNumber");
            Label lab_projectManager3 = (Label)Table3.FindControl("lab_projectManager3");
            Label lab_toolingSize = (Label)Table3.FindControl("lab_toolingSize");
            Label lab_toolingWeight = (Label)Table3.FindControl("lab_toolingWeight");
            Label lab_DFMModuleId = (Label)Table3.FindControl("lab_DFMModuleId");
            Label lab_businessStatus = (Label)Table3.FindControl("lab_businessStatus");
            Label lab_copyfrom = (Label)Table3.FindControl("lab_copyfrom");
            Label lab_manufactureCost = (Label)Table3.FindControl("lab_manufactureCost");
            Label lab_isoutsource = (Label)Table3.FindControl("lab_isoutsource");

            orderDesigninfo = orderdesign.findbykey(id);

            if (orderDesigninfo != null)
            {
                int ispart = orderDesigninfo.isPart;
                if (ispart == 0)
                {
                    lab_isPart.Text = Translate.translateString("模具");
                }
                else
                {
                    lab_isPart.Text = Translate.translateString("零件");
                }
                if (lab_price != null)
                {
                    lab_price.Text = Convert.ToString(orderDesigninfo.Price);
                }
                if (lab_moduleid != null)
                {
                    lab_moduleid.Text = orderDesigninfo.ModuleId;
                }

                CustomerDesign cd = new CustomerDesign();
                CustomerDesignInfo cdi = new CustomerDesignInfo();
                lab_orderSingle.Text = orderDesigninfo.OrderSingle;
                cdi = cd.findbykey(orderDesigninfo.CustomerId);
                if (cdi != null)
                {
                    lab_customerid.Text = cdi.CustomerName;
                }
                ModuleWorkFlow.BLL.System.ProductType pt = new ModuleWorkFlow.BLL.System.ProductType();
                try
                {
                    lab_producttype.Text = "";
                    if (!orderDesigninfo.ProductTypeId.Equals(0))
                    {
                        // ModuleWorkFlow.Model.System.ProductTypeInfo pti = pt.findbykey(Convert.ToInt32(orderDesigninfo.ProductTypeId));
                        WorkFlow.BLL.Standard.StandProcessType standProcessType = new WorkFlow.BLL.Standard.StandProcessType();
                        WorkFlow.Model.Standard.StandProcessTypeInfo spt = standProcessType.FindProcessTypeId(orderDesigninfo.ProductTypeId);
                        lab_producttype.Text = spt.TypeName;
                    }
                }
                catch { }

                ModuleWorkFlow.BLL.System.Model cmi = new ModuleWorkFlow.BLL.System.Model();
                try
                {
                    if (!orderDesigninfo.CustomerModuleId.Equals("0"))
                    {
                        ModuleWorkFlow.Model.System.ModelInfo cmii = cmi.findbykey(Convert.ToInt32(orderDesigninfo.CustomerModuleId));
                        lab_customerModuleId.Text = cmii.MoldName;
                    }
                }
                catch { }

                ModuleWorkFlow.BLL.System.Supply tp = new ModuleWorkFlow.BLL.System.Supply();
                try
                {
                    if (!orderDesigninfo.TryPlant.Equals("0"))
                    {
                        ModuleWorkFlow.Model.System.SupplyInfo tpi = tp.findbykey(Convert.ToInt32(orderDesigninfo.TryPlant));
                        if (tpi != null)
                        {
                            lab_tryPlant.Text = tpi.SupplierName;
                        }
                    }
                }
                catch { }

                ModuleWorkFlow.BLL.System.Supply bp = new ModuleWorkFlow.BLL.System.Supply();
                try
                {
                    if (!orderDesigninfo.CustomerModuleId.Equals("0"))
                    {
                        ModuleWorkFlow.Model.System.SupplyInfo bpi = bp.findbykey(Convert.ToInt32(orderDesigninfo.BatchPlant));
                        if (bpi != null)
                        {
                            lab_batchPlant.Text = bpi.SupplierName;
                        }
                    }
                }
                catch { }

                //lab_customerModuleId.Text = orderDesigninfo.CustomerModuleId.ToString();
                lab_companyProductId.Text = orderDesigninfo.CompanyProductId;

                string s = "";
                if (orderDesigninfo.HasPrice == 1)
                {
                    s = Translate.translateString("模具");
                }
                else
                {
                    s = Translate.translateString("零件");
                }
                lab_hasprice.Text = s;

                lab_signPrice.Text = Convert.ToString(orderDesigninfo.SignPrice);

                lab_tryPrice.Text = Convert.ToString(orderDesigninfo.TryPrice);
                if (lab_creater != null)
                {
                    lab_creater.Text = orderDesigninfo.Creater;
                }


                lab_checker.Text = orderDesigninfo.Checker;
                lab_Picture.Text = orderDesigninfo.FinishPicture;
                lab_lockManager.Text = orderDesigninfo.LockManager;

                lab_equipMent.Text = orderDesigninfo.EquipMent;
                lab_hole.Text = orderDesigninfo.Hole;


                lab_priority.Text = Priority.getPrioriName(orderDesigninfo.Priority);

                lab_extractRate.Text = orderDesigninfo.ExtractRate;


                string[] path = HttpContext.Current.Request.Url.PathAndQuery.Split('/');
                string url = Request.Url.ToString();
                string[] newurl = url.Split('/');
                string query = "http://" + newurl[2];
                if (path.Length > 3)
                {
                    for (int i = 1; i < path.Length - 2; i++)
                    {
                        query += "/" + path[i];
                    }
                }
                else
                {
                    for (int i = 1; i < path.Length - 1; i++)
                    {
                        query += "/" + path[i];
                    }
                }
                imgpath = query + "/" + orderDesigninfo.FinishPicture;

                if (lab_startDate != null)
                {

                    if (!orderDesigninfo.StartDate.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                    {
                        lab_startDate.Text = orderDesigninfo.StartDate.ToShortDateString();
                    }
                    else
                    {
                        lab_startDate.Text = "";
                    }
                }

                if (orderDesigninfo.ClientModuleId != null)
                {
                    lab_clientModuleId.Text = orderDesigninfo.ClientModuleId;
                }

                if (!orderDesigninfo.MerchindiseEndDate.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    lab_merchindiseenddate.Text = orderDesigninfo.MerchindiseEndDate.ToShortDateString();
                }
                else
                {
                    lab_merchindiseenddate.Text = "";
                }
                if (orderDesigninfo.DesignEndDate.Ticks != DateTime.MinValue.Ticks)
                {
                    lab_designEndDate.Text = orderDesigninfo.DesignEndDate.ToShortDateString();
                }
                else
                {
                    lab_designEndDate.Text = "";
                }
                if (lab_designStart != null)
                {
                    if (orderDesigninfo.DesignStart.Ticks != DateTime.MinValue.Ticks)
                    {
                        lab_designStart.Text = orderDesigninfo.DesignStart.ToShortDateString();
                    }
                    else
                    {
                        lab_designStart.Text = "";
                    }
                }
                if (!orderDesigninfo.ProductEndDate.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    lab_productenddate.Text = orderDesigninfo.ProductEndDate.ToString("yyyy-MM-dd HH:mm");
                }
                else
                {
                    lab_productenddate.Text = "";
                }
                if (!orderDesigninfo.T3.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    lab_T3.Text = orderDesigninfo.T3.ToShortDateString();
                }
                else
                {
                    lab_T3.Text = "";
                }

                if (!orderDesigninfo.CheckDate.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    lab_checkDate.Text = orderDesigninfo.CheckDate.ToShortDateString();
                }
                else
                {
                    lab_checkDate.Text = "";
                }


                if (lab_comment != null)
                {
                    lab_comment.Text = orderDesigninfo.Comment;
                }
                if (lab_productname != null)
                {
                    lab_productname.Text = orderDesigninfo.ProductName;
                }

                lab_gradeid.Text = orderDesigninfo.GradeId.ToString();
                MaterialInfo mi = material.GetMaterialInfo(Convert.ToInt32(orderDesigninfo.Material));
                try
                {
                    if (mi != null)
                    {
                        lab_material.Text = mi.Name;
                    }
                }
                catch { }

                MaterialInfo cav = material.GetMaterialInfo(Convert.ToInt32(orderDesigninfo.CavMaterial));
                try
                {
                    if (cav != null)
                    {
                        lab_cavMaterial.Text = cav.Name;
                    }
                }
                catch { }

                MaterialInfo cor = material.GetMaterialInfo(Convert.ToInt32(orderDesigninfo.CorMaterial));
                try
                {
                    if (cor != null)
                    {
                        lab_corMaterial.Text = cor.Name;
                    }
                }
                catch { }

                MaterialInfo sli = material.GetMaterialInfo(Convert.ToInt32(orderDesigninfo.SlideMaterial));
                try
                {
                    if (sli != null)
                    {
                        lab_slideMaterial.Text = sli.Name;
                    }
                }
                catch { }

                ModuleWorkFlow.BLL.DepartMent pdm = new ModuleWorkFlow.BLL.DepartMent();
                try
                {
                    if (orderDesigninfo.ProjectDepartMent != null)
                    {
                        ModuleWorkFlow.Model.DepartMentInfo pdmi = pdm.GetDepartmentById(orderDesigninfo.ProjectDepartMent);
                        lab_projectDepartMent.Text = pdmi.DepartName;
                    }
                }
                catch { }



                lab_ton.Text = orderDesigninfo.Ton;
                if (lab_referencePictureDate != null)
                {
                    if (!orderDesigninfo.ReferencePictureDate.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                    {
                        lab_referencePictureDate.Text = orderDesigninfo.ReferencePictureDate.ToShortDateString();
                    }
                    else
                    {
                        lab_referencePictureDate.Text = "";
                    }
                }

                if (lab_tryDate0 != null)
                {
                    if (!orderDesigninfo.TryDate0.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                    {
                        lab_tryDate0.Text = orderDesigninfo.TryDate0.ToString();
                    }
                    else
                    {
                        lab_tryDate0.Text = "";
                    }
                }

                if (!orderDesigninfo.TryDate1.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    lab_tryDate1.Text = orderDesigninfo.TryDate1.ToShortDateString();
                }
                else
                {
                    lab_tryDate1.Text = "";
                }
                if (!orderDesigninfo.TryDate2.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    lab_tryDate2.Text = orderDesigninfo.TryDate2.ToShortDateString();
                }
                else
                {
                    lab_tryDate2.Text = "";
                }
                if (lab_tryDate3 != null)
                {
                    if (!orderDesigninfo.TryDate3.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                    {
                        lab_tryDate3.Text = orderDesigninfo.TryDate3.ToShortDateString();
                    }
                    else
                    {
                        lab_tryDate3.Text = "";
                    }
                }

                if (!orderDesigninfo.TryDateF.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    lab_tryDateF.Text = orderDesigninfo.TryDateF.ToShortDateString();
                }
                else
                {
                    lab_tryDateF.Text = "";
                }
                if (lab_YingYeDanDang != null)
                {
                    lab_YingYeDanDang.Text = orderDesigninfo.YingYeDanDang;
                }


                lab_productSize.Text = orderDesigninfo.ProductSize;
                lab_avgThick.Text = orderDesigninfo.AvgThick;
                lab_moldStruct.Text = orderDesigninfo.MoldStruct;
                lab_productApprance.Text = orderDesigninfo.ProductApprance;
                //lab_cavMaterial.Text = Convert.ToString(orderDesigninfo.CavMaterial);
                //lab_corMaterial.Text = Convert.ToString(orderDesigninfo.CorMaterial);
                lab_projectManager1.Text = orderDesigninfo.ProjectManager1;
                lab_projectManager2.Text = orderDesigninfo.ProjectManager2;
                //lab_projectDepartMent.Text = Convert.ToString(orderDesigninfo.ProjectDepartMent);
                //lab_tryPlant.Text = Convert.ToString(orderDesigninfo.TryPlant);
                //lab_batchPlant.Text = Convert.ToString(orderDesigninfo.BatchPlant);
                //lab_slideMaterial.Text = Convert.ToString(orderDesigninfo.SlideMaterial);
                lab_slideCount.Text = orderDesigninfo.SlideCount;
                DifficultInfo di = new Difficult().findbykey(orderDesigninfo.Difficultlevel);
                if (di != null && di.Name != null)
                {
                    lab_difficultlevel.Text = di.Name;
                }
                lab_pinNumber.Text = orderDesigninfo.PinNumber;

                if (lab_projectManager3 != null)
                {
                    lab_projectManager3.Text = orderDesigninfo.ProjectManager3;
                }

                if (lab_toolingSize != null)
                {
                    lab_toolingSize.Text = orderDesigninfo.ToolingSize;
                }

                if (lab_toolingWeight != null)
                {
                    lab_toolingWeight.Text = orderDesigninfo.ToolingWeight;
                }

                if (lab_DFMModuleId != null)
                {
                    lab_DFMModuleId.Text = orderDesigninfo.DFMModuleId;
                }

                if (lab_businessStatus != null)
                {
                    lab_businessStatus.Text = orderDesigninfo.businessStatus;
                }
                Hashtable htable = new Hashtable();
                htable.Add("Ready", Translate.translateString("就緒"));
                htable.Add("Holdon", Translate.translateString("暫停"));
                htable.Add("Cancelled", Translate.translateString("取消"));
                if (orderDesigninfo.StatusId != null && htable.ContainsKey(orderDesigninfo.StatusId))
                {
                    lab_status.Text = htable[orderDesigninfo.StatusId].ToString();
                }
                else
                {
                    lab_status.Text = Translate.translateString("消單");
                }


                if (lab_copyfrom != null)
                {
                    lab_copyfrom.Text = orderDesigninfo.Copyfrom;
                }

                if (lab_manufactureCost != null)
                {
                    lab_manufactureCost.Text = orderDesigninfo.ManufactureCost.ToString();
                }

                if (lab_isoutsource != null)
                {
                    if (orderDesigninfo.Isoutsource.Equals(1))
                    {
                        lab_isoutsource.Text = Translate.translateString("是");
                    }
                    else
                    {
                        lab_isoutsource.Text = Translate.translateString("否");
                    }
                }


            }
        }


        private void bindPartByModule(string moduleid, string processid)
        {
            IList parts = new ModuleWorkFlow.BLL.PartProcess().getPartProcessViewAll(moduleid, "", true, new OutSourceDetail(), menuid);

            IList discards = new Discard().getListDiscardInfo(moduleid);
            foreach (DiscardInfo di in discards)
            {
                if (!hdiscard.ContainsKey(di.OldPartNoId))
                {
                    hdiscard.Add(di.OldPartNoId, di);
                }
            }
            //IList parts = new ModuleWorkFlow.BLL.PartProcess().getPartProcessViewAll(moduleid, "", true);
            MainDataGrid.DataSource = parts;
            MainDataGrid.DataBind();
        }

        private void MainDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            BLL.Status status = new BLL.Status();
            Hashtable hstatus = status.getKeyStatusInfo();
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                IList partprocess = new ArrayList();
                string pec = "";
                DataTable dt = new DataTable();
                DataTable dt1 = new DataTable();
                dt = ds.Tables[0];
                dt1 = ds.Tables[0];
                string partnoid = e.Item.Cells[6].Text;
                if (hdiscard.ContainsKey(partnoid))
                {
                    e.Item.Cells[1].ForeColor = Color.Orange;
                    e.Item.Cells[6].Text = "<a href=\"#\" onclick='return ShowDiscardBlock(\"" + e.Item.Cells[0].Text.Trim() + "\", \"" + partnoid + "\")'>" + partnoid + "</a>";
                }
                DataRow[] dr = dt.Select("partno_id = '" + partnoid + "'  and  (FactEndDate is not null or FactOutTime is not null)");
                DataRow[] dr1 = dt1.Select("partno_id = '" + partnoid + "'");
                if (dr.Length > 0)
                {
                    double totalProcessneed = Math.Round(Convert.ToDouble(dt.Compute("SUM(ProcessNeedMinutes)", "partno_id = '" + partnoid + "'")));
                    double pecent = Math.Round(Convert.ToDouble(dt.Compute("SUM(ProcessNeedMinutes)", "partno_id = '" + partnoid + "'  and  (FactEndDate is not null or FactOutTime is not null)")) / totalProcessneed, 3) * 100;
                    pec = Convert.ToString(Math.Round(pecent, 1)) + "%";
                }
                else
                {
                    pec = "0%";
                }

                e.Item.Cells[4].Text = pec;
                string StatusId = e.Item.Cells[5].Text;
                e.Item.Cells[5].Text = ((StatusInfo)hstatus[StatusId]).StatusDesc;

                string moduleid = e.Item.Cells[0].Text;
                string partno = e.Item.Cells[1].Text;
                if (!hjt.ContainsKey(partno))
                {
                    Utility.FileOperate file = new Utility.FileOperate();
                    hjt.Add(partno, file.getJT(moduleid, partnoid));
                }
                string link = hjt[partno] as string;
                if (link.IndexOf(">") > 0)
                {
                    e.Item.Cells[6].Text = link.Substring(0, link.IndexOf(">") + 1) + e.Item.Cells[6].Text + link.Substring(link.LastIndexOf("<"));
                }

            }
        }
    }
}