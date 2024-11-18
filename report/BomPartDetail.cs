using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

using System.Reflection;
using System.IO;

using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL.Inventory;
using ModuleWorkFlow.Model.Inventory;
using Utility;
using ModuleWorkFlow.business;



namespace ModuleWorkFlow.report
{
    /// <summary>
    /// Summary description for BomPartDetail.
    /// </summary>
    public class BomPartDetail
    {
        private IList errorlist;
        public BomPartDetail()
        {
            //
            // TODO: Add constructor logic here
            //

            errorlist = new ArrayList();
        }

        /// <summary>
        /// 驗證長×寬×高規格格式
        /// </summary>
        /// <param name="strSpec"></param>
        /// <returns></returns>
        public bool isValid(string strSpec)
        {
            System.Text.RegularExpressions.Regex reg = new System.Text.RegularExpressions.Regex(@"^\d{1,}\.{0,1}\d{0,}(\*)\d{1,}\.{0,1}\d{0,}(\*)\d{1,}\.{0,1}\d{0,}$");

            return reg.IsMatch(strSpec);
        }

        /// <summary>
        /// 驗證直徑規格格式，例如 ?200×25
        /// </summary>
        /// <param name="strSpec"></param>
        /// <returns></returns>
        public bool isValidD(string strSpec)
        {
            System.Text.RegularExpressions.Regex reg = new System.Text.RegularExpressions.Regex(@"^\d{1,}\.{0,1}\d{0,}(\*)\d{1,}\.{0,1}\d{0,}$");

            return reg.IsMatch(strSpec);
        }

        public IList getErrorList()
        {
            return errorlist;
        }

        public bool isValidFour(string strSpec)
        {
            System.Text.RegularExpressions.Regex reg = new System.Text.RegularExpressions.Regex(@"^\d{1,}\.{0,1}\d{0,}(\*)\d{1,}\.{0,1}\d{0,}(\*)\d{1,}\.{0,1}\d{0,}(\*)\d{1,}\.{0,1}\d{0,}$");

            return reg.IsMatch(strSpec);
        }

        public IList CheckDetailElectFile(string[] lines, BomDesignInfo dbi, bool needStandProcess, string stylecustomer)
        {
            return CheckDetailElectFile(lines, dbi, needStandProcess, null, stylecustomer);
        }

        public IList CheckDetailElectFile(string[] lines, BomDesignInfo dbi, bool needStandProcess, Hashtable hbomdetail, string stylecustomer)
        {
            string[] cells;
            IList parts = new ArrayList();
            BomDetailInfo bdesigninfo = new BomDetailInfo();
            BOMStyle bs = new BOMStyle();
            BOMStyleInfo bsi = bs.getBOMStyleInfo(stylecustomer);
            string sLine;
            //ModuleWorkFlow.BLL.System.ModuleType mt = new ModuleWorkFlow.BLL.System.ModuleType();
            Material material = new Material();
            //			errors = new ArrayList();
            BLL.Part part = new BLL.Part();

            BomDetail bomDetail = new BomDetail();

            Hashtable hparts = new Hashtable();
            Supply supply = new Supply();
            Hashtable hstandprocess = new Hashtable();
            if (hbomdetail == null)
            {
                hbomdetail = new Hashtable();
            }
            IList bomdetails = bomDetail.GetBomDesignDetailByModuleId(dbi.ModuleId, -1);
            foreach (BomDetailInfo detailinfo in bomdetails)
            {
                if (detailinfo.PartNo == null || detailinfo.PartNo.Trim().Equals(""))
                {
                    continue;
                }
                hbomdetail.Add(detailinfo.PartNo.ToUpper().Trim(), detailinfo);
            }
            Hashtable hmaterial = new Hashtable();
            IList materials = material.GetMaterial("Part");
            foreach (MaterialInfo mi in materials)
            {
                hmaterial.Add(mi.Name.ToUpper().Trim(), mi);
            }
            string error = "";
            if (bsi != null)
            {
                bool needConstraint = false;
                Hashtable hconstraintParts = new Hashtable();
                if (dbi.ModuleId.IndexOf('-') > 0 && System.Configuration.ConfigurationSettings.AppSettings["MODIFYCONSTRAIN"] != null)
                {
                    needConstraint = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["MODIFYCONSTRAIN"]);
                }

                if (needConstraint)
                {
                    IList constranintparts = part.GetModifyParts(dbi.ModuleId.Substring(0, dbi.ModuleId.IndexOf('-')), true);
                    foreach (PartInfo pi in constranintparts)
                    {
                        if (!hconstraintParts.ContainsKey(pi.PartNo) && (pi.QRCode == null || (pi.QRCode != null && !pi.QRCode.Equals("已解綁"))))
                        {
                            hconstraintParts.Add(pi.PartNo, pi);
                        }
                    }

                }

                for (int i = 0; i < lines.Length; i++)//根據行數決定循環添加記錄數
                {
                    error = "";
                    bdesigninfo = new BomDetailInfo();
                    sLine = lines[i];
                    cells = sLine.Split('\t');

                    if (cells.Length == bsi.Rows)
                    {


                        bdesigninfo.BomDesignNo = dbi.Id;
                        bdesigninfo.ModuleId = dbi.ModuleId;
                        bdesigninfo.ModuleIdentity = dbi.ModuleIdentity;
                        if (bsi.SeriesNoRow != -1)
                        {
                            if (!cells[Convert.ToInt32(bsi.SeriesNoRow)].Trim().Equals(""))
                            {
                                bdesigninfo.SeriesNo = cells[Convert.ToInt32(bsi.SeriesNoRow)].Trim();
                            }
                        }
                        if (bsi.SendDateRow != -1)
                        {
                            if (!cells[Convert.ToInt32(bsi.SendDateRow)].Trim().Equals(""))
                            {
                                try
                                {
                                    bdesigninfo.SendDate = Convert.ToDateTime(cells[Convert.ToInt32(bsi.SendDateRow)].Trim());
                                }
                                catch
                                {
                                    error = error + "送件日期格式錯誤";
                                }
                            }
                        }
                        if (bsi.CheckDateRow != -1)
                        {
                            if (!cells[Convert.ToInt32(bsi.CheckDateRow)].Trim().Equals(""))
                            {
                                try
                                {
                                    bdesigninfo.CheckDate = Convert.ToDateTime(cells[Convert.ToInt32(bsi.CheckDateRow)].Trim());
                                }
                                catch
                                {
                                    error = error + "檢討日期格式錯誤";
                                }
                            }
                        }
                        if (bsi.DueDateRow != -1)
                        {
                            if (!cells[Convert.ToInt32(bsi.DueDateRow)].Trim().Equals(""))
                            {
                                try
                                {
                                    bdesigninfo.DueDate = Convert.ToDateTime(cells[Convert.ToInt32(bsi.DueDateRow)].Trim());
                                }
                                catch
                                {
                                    error = error + "需求日期格式錯誤";
                                }
                            }
                        }
                        if (bsi.CommentRow != -1)
                        {
                            if (!cells[Convert.ToInt32(bsi.CommentRow)].Trim().Equals(""))
                            {
                                bdesigninfo.Comment = cells[Convert.ToInt32(bsi.CommentRow)].Trim();
                            }
                            else
                            {
                                error = error + "";
                            }
                        }
                        if (bsi.HeadHardRow != -1)
                        {
                            bdesigninfo.HeadHard = cells[Convert.ToInt32(bsi.HeadHardRow)].Trim();
                        }
                        if (bsi.VersionRow != -1)
                        {
                            bdesigninfo.Version = cells[Convert.ToInt32(bsi.VersionRow)].Trim();
                        }


                        if (bsi.PdfUploadRow != -1)
                        {
                            if (!cells[Convert.ToInt32(bsi.PdfUploadRow)].Trim().Equals(""))
                            {
                                bdesigninfo.Pdfupload = cells[Convert.ToInt32(bsi.PdfUploadRow)].Trim();
                            }
                            else
                            {
                                error = error + "";
                            }
                        }

                        if (!cells[bsi.PartNoRow].Trim().Equals(""))
                        {
                            if (ConvertString.ConvertToPratNo(cells[bsi.PartNoRow].Trim().ToUpper().ToUpper()) && ConvertString.ConvertToPartNoToG(cells[bsi.PartNoRow].Trim().ToUpper().ToUpper()) && !hparts.ContainsKey(cells[bsi.PartNoRow].Trim().ToUpper()))//通過驗證
                            {
                                if (needConstraint && hconstraintParts.ContainsKey(cells[bsi.PartNoRow].Trim().ToUpper()))
                                {
                                    error += Translate.translateString("零件編號在") + (hconstraintParts[cells[bsi.PartNoRow].Trim().ToUpper()] as PartInfo).ModuleId + Translate.translateString("未解綁");
                                }
                                else
                                {
                                    bdesigninfo.PartNo = cells[bsi.PartNoRow].Trim().ToUpper();
                                    hparts.Add(cells[bsi.PartNoRow].Trim().ToUpper(), 1);
                                }
                            }
                            else
                            {
                                error = error + Translate.translateString("零件編號不允許輸入-且不允許重複,且不允許輸入逗號，");
                            }
                        }
                        else
                        {
                            error = error + Translate.translateString("零件編號必須填寫");
                        }


                        BomDetailInfo bdi = null;

                        if (bdesigninfo.PartNo != null && hbomdetail.ContainsKey(bdesigninfo.PartNo.ToUpper().Trim()))
                        {
                            bdi = hbomdetail[bdesigninfo.PartNo.ToUpper().Trim()] as BomDetailInfo;
                        }
                        if (bdi != null && bdi.IsPrepare > 0)
                        {
                            error = error + Translate.translateString("零件已備料,不允許修改");
                        }
                        else
                        {
                            if (bdi == null && part.getPartInfo(bdesigninfo.ModuleId, bdesigninfo.PartNo) != null)
                            {
                                error = error + Translate.translateString("拼料料號,不允許匯入");
                            }
                        }

                        if (!cells[bsi.PartNameRow].Trim().Equals(""))
                        {
                            bdesigninfo.PartName = cells[bsi.PartNameRow].Trim();//3	
                        }
                        else
                        {
                            error = error + Translate.translateString("零件名稱必須填寫");
                        }

                        if (bsi.SupplyRow > 0 && !cells[bsi.SupplyRow].Trim().Equals(""))
                        {
                            SupplyInfo si = supply.GetSupplyInfoBySupplierName(cells[bsi.SupplyRow].Trim(), null);
                            if (si != null)
                            {
                                bdesigninfo.SupplyId = si.Id;
                            }
                            else
                            {
                                error = error + Translate.translateString("供應商不存在;");
                            }
                        }

                        if (bsi.RefSupplyRow > 0 && !cells[bsi.RefSupplyRow].Trim().Equals(""))
                        {
                            SupplyInfo si = supply.GetSupplyInfoBySupplierName(cells[bsi.RefSupplyRow].Trim(), null);
                            if (si != null)
                            {
                                bdesigninfo.RefSupplyId = si.Id;
                            }
                            else
                            {
                                error = error + Translate.translateString("供應商不存在");
                            }
                        }

                        if (bsi.RequiredDateRow > 0 && !cells[bsi.RequiredDateRow].Trim().Equals(""))
                        {
                            try
                            {
                                bdesigninfo.RequiredDate = Convert.ToDateTime(cells[bsi.RequiredDateRow].Trim());
                            }
                            catch
                            {
                                error = error + Translate.translateString("需求日期請填入正確的日期格式");
                            }
                        }

                        if (bsi.WeightRow > 0 && !cells[bsi.WeightRow].Trim().Equals(""))
                        {
                            try
                            {
                                bdesigninfo.Weight = Convert.ToDouble(cells[bsi.WeightRow].Trim());
                            }
                            catch
                            {
                                error = error + Translate.translateString("重量請填入正確數字");
                            }
                        }


                        //採購材料檢查
                        if (cells[bsi.IsMerchindiseRow].Trim().Equals("") || cells[bsi.IsMerchindiseRow].Trim().Equals("否"))
                        {
                            bdesigninfo.IsMerchindise = 0;


                            if (bsi.UglySpecRow == -1 && bsi.UglyLengthRow == -1 && bsi.LengthRow == -1)
                            {
                                if (!cells[bsi.SpecRow].Trim().Equals(""))//不為空
                                {
                                    if (this.isValid(cells[bsi.SpecRow].Trim()))//通過驗證
                                    {
                                        bdesigninfo.Spec = cells[bsi.SpecRow].Trim().Replace("*", "X");
                                    }
                                    else
                                    {
                                        if (this.isValidD(cells[bsi.SpecRow].Trim()))
                                        {
                                            bdesigninfo.Spec = cells[bsi.SpecRow].Trim().Replace("*", "X");
                                        }
                                        else
                                        {
                                            bdesigninfo.Spec = cells[bsi.SpecRow].Trim();
                                            try
                                            {
                                                bdesigninfo.Price = Convert.ToDouble(cells[bsi.PriceRow].Trim());
                                            }
                                            catch
                                            {
                                                bdesigninfo.Price = 0;
                                            }

                                        }
                                    }
                                }
                                else
                                {
                                    error = error + "";
                                }
                            }
                            else
                            {
                                if (bsi.UglySpecRow != -1)
                                {
                                    if (!cells[bsi.UglySpecRow].Trim().Equals(""))//不為空
                                    {
                                        if (this.isValid(cells[bsi.UglySpecRow].Trim()))//通過驗證
                                        {
                                            bdesigninfo.UglySpec = cells[bsi.UglySpecRow].Trim().Replace("*", "*");
                                        }
                                        else
                                        {
                                            if (this.isValidD(cells[bsi.SpecRow].Trim()))
                                            {
                                                bdesigninfo.Spec = cells[bsi.SpecRow].Trim().Replace("*", "*");
                                            }
                                            else
                                            {
                                                bdesigninfo.Spec = cells[bsi.SpecRow].Trim();
                                                try
                                                {
                                                    bdesigninfo.Price = Convert.ToDouble(cells[bsi.PriceRow].Trim());
                                                }
                                                catch
                                                {
                                                    bdesigninfo.Price = 0;
                                                }
                                            }
                                        }
                                    }
                                    else
                                    {
                                        error = error + "";
                                    }
                                }
                                if (bsi.SpecRow > -1 && !cells[bsi.SpecRow].Trim().Equals(""))//不為空
                                {
                                    if (this.isValid(cells[bsi.SpecRow].Trim()))//通過驗證
                                    {
                                        bdesigninfo.Spec = cells[bsi.SpecRow].Trim().Replace("*", "*");
                                    }
                                    else
                                    {
                                        if (this.isValidD(cells[bsi.SpecRow].Trim()))
                                        {
                                            bdesigninfo.Spec = cells[bsi.SpecRow].Trim().Replace("*", "*");
                                        }
                                        else
                                        {
                                            bdesigninfo.Spec = cells[bsi.SpecRow].Trim();
                                            try
                                            {
                                                bdesigninfo.Price = Convert.ToDouble(cells[bsi.PriceRow].Trim());
                                            }
                                            catch
                                            {
                                                bdesigninfo.Price = 0;
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    error = error + "";
                                }

                                if (bsi.UglyLengthRow != -1)
                                {
                                    if (!cells[bsi.UglyLengthRow].Trim().Equals(""))//不為空
                                    {
                                        if (this.isValidD(cells[bsi.UglyLengthRow].Trim()))//通過驗證
                                        {
                                            bdesigninfo.UglyLength = cells[bsi.UglyLengthRow].Trim().Replace("*", "*");
                                        }
                                        else
                                        {
                                            bdesigninfo.UglyLength = cells[bsi.UglyLengthRow].Trim();
                                            try
                                            {
                                                bdesigninfo.Price = Convert.ToDouble(cells[bsi.PriceRow].Trim());
                                            }
                                            catch
                                            {
                                                bdesigninfo.Price = 0;
                                            }
                                        }
                                    }
                                    else
                                    {
                                        error = error + "";
                                    }
                                }
                                if (bsi.LengthRow != -1)
                                {
                                    if (!cells[bsi.LengthRow].Trim().Equals(""))//不為空
                                    {
                                        try
                                        {
                                            bdesigninfo.Length = Convert.ToDouble(cells[bsi.LengthRow].Trim());
                                            bdesigninfo.Spec = cells[bsi.LengthRow].Trim();
                                        }
                                        catch
                                        {
                                            bdesigninfo.Spec = cells[bsi.LengthRow].Trim();
                                            bdesigninfo.Spec.Replace('*', 'X');
                                        }
                                    }
                                    else
                                    {
                                        bdesigninfo.Length = 0;
                                        bdesigninfo.Spec = bdesigninfo.Length.ToString();

                                    }
                                }

                                if (bsi.WidthRow != -1)
                                {
                                    if (!cells[bsi.WidthRow].Trim().Equals(""))
                                    {
                                        try
                                        {
                                            bdesigninfo.Width = Convert.ToDouble(cells[bsi.WidthRow].Trim());
                                            bdesigninfo.Spec = bdesigninfo.Spec + "*" + cells[bsi.WidthRow].Trim();
                                        }
                                        catch
                                        {
                                            bdesigninfo.Spec = cells[bsi.LengthRow].Trim();
                                            bdesigninfo.Spec.Replace('*', 'X');
                                        }
                                    }
                                }

                                if (bsi.HeightRow != -1)
                                {
                                    if (!cells[bsi.HeightRow].Trim().Equals(""))
                                    {
                                        try
                                        {
                                            bdesigninfo.Height = Convert.ToDouble(cells[bsi.HeightRow].Trim());
                                            bdesigninfo.Spec = bdesigninfo.Spec + "*" + cells[bsi.HeightRow].Trim();
                                        }
                                        catch
                                        {
                                            bdesigninfo.Spec = cells[bsi.LengthRow].Trim();
                                            bdesigninfo.Spec.Replace('*', 'X');
                                        }

                                    }
                                }
                            }

                            if (!cells[bsi.MaterialRow].Trim().Equals(""))
                            {
                                MaterialInfo mi = null;
                                if (hmaterial.ContainsKey(cells[bsi.MaterialRow].Trim().ToUpper()))
                                {
                                    mi = hmaterial[cells[bsi.MaterialRow].Trim().ToUpper()] as MaterialInfo;
                                }

                                if (mi != null)
                                {
                                    bdesigninfo.MaterialId = mi.Id;
                                }
                                else
                                {
                                    error = error + Translate.translateString("材料不存在填寫");
                                }
                            }
                            else
                            {
                                error = error + Translate.translateString("材料必須填寫");
                            }
                            if (!cells[bsi.RequireCountRow].Trim().Equals("") && (bsi.BatchCountRow == -1 || bsi.EachBatchCountRow == -1))
                            {
                                try
                                {
                                    bdesigninfo.RequireCount = Convert.ToDouble(cells[bsi.RequireCountRow].Trim());
                                    bdesigninfo.BatchCount = 1;
                                    bdesigninfo.EachBatchCount = Convert.ToInt32(bdesigninfo.RequireCount);
                                }
                                catch
                                {
                                    error = error + cells[bsi.RequireCountRow].Trim() + ":" + Lang.INPUT_NUMBER;
                                }
                            }
                            else
                            {
                                error = error + Translate.translateString("數量必須填寫");
                            }
                        }
                        else
                        {
                            bdesigninfo.IsMerchindise = 1;
                            if (bsi.SpecRow != -1)
                            {
                                try
                                {
                                    bdesigninfo.Spec = cells[bsi.SpecRow].Trim().Replace("*", "*");
                                }
                                catch
                                {
                                    bdesigninfo.Spec = cells[bsi.SpecRow].Trim();
                                }
                            }
                            if (bsi.UglySpecRow != -1)
                            {
                                try
                                {
                                    bdesigninfo.UglySpec = cells[bsi.UglySpecRow].Trim().Replace("*", "*");
                                }
                                catch
                                {
                                    bdesigninfo.UglySpec = cells[bsi.UglySpecRow].Trim();
                                }
                            }
                            if (bsi.UglyLengthRow != -1)
                            {
                                try
                                {
                                    bdesigninfo.UglyLength = cells[bsi.UglyLengthRow].Trim().Replace("*", "*");
                                }
                                catch
                                {
                                    bdesigninfo.UglyLength = cells[bsi.UglyLengthRow].Trim();
                                }
                            }
                            if (bsi.LengthRow != -1)
                            {
                                if (!cells[bsi.LengthRow].Trim().Equals(""))//不為空
                                {
                                    try
                                    {
                                        bdesigninfo.Length = Convert.ToDouble(cells[bsi.LengthRow].Trim());
                                        bdesigninfo.Spec = cells[bsi.LengthRow].Trim();
                                    }
                                    catch
                                    {
                                        bdesigninfo.Spec = cells[bsi.LengthRow].Trim();
                                        bdesigninfo.Spec.Replace('*', 'X');
                                    }
                                }
                                else
                                {
                                    bdesigninfo.Length = 0;
                                    bdesigninfo.Spec = bdesigninfo.Length.ToString();

                                }
                            }

                            if (bsi.WidthRow != -1)
                            {
                                if (!cells[bsi.WidthRow].Trim().Equals(""))
                                {
                                    try
                                    {
                                        bdesigninfo.Width = Convert.ToDouble(cells[bsi.WidthRow].Trim());
                                        bdesigninfo.Spec = bdesigninfo.Spec + "*" + cells[bsi.WidthRow].Trim();
                                    }
                                    catch
                                    {
                                        bdesigninfo.Spec = cells[bsi.LengthRow].Trim();
                                        bdesigninfo.Spec.Replace('*', 'X');
                                    }
                                }
                            }

                            if (bsi.HeightRow != -1)
                            {
                                if (!cells[bsi.HeightRow].Trim().Equals(""))
                                {
                                    try
                                    {
                                        bdesigninfo.Height = Convert.ToDouble(cells[bsi.HeightRow].Trim());
                                        bdesigninfo.Spec = bdesigninfo.Spec + "*" + cells[bsi.WidthRow].Trim();
                                    }
                                    catch
                                    {
                                        bdesigninfo.Spec = cells[bsi.LengthRow].Trim();
                                        bdesigninfo.Spec.Replace('*', 'X');
                                    }

                                }
                            }

                            if (!cells[bsi.MaterialRow].Trim().Equals(""))
                            {
                                MaterialInfo mi = material.getPartMaterialByName(cells[bsi.MaterialRow].Trim());
                                if (mi == null)
                                {
                                    mi = new MaterialInfo();
                                    mi.Name = cells[bsi.MaterialRow].Trim();
                                    mi.TypeId = "Part";
                                    mi.Price = 0;
                                    mi.Density = 0;
                                    material.AddMaterial(mi);
                                    mi = material.getMaterialByName(cells[bsi.MaterialRow].Trim());
                                    bdesigninfo.MaterialId = mi.Id;
                                }
                                else
                                {
                                    bdesigninfo.MaterialId = mi.Id;
                                }

                            }
                            else
                            {
                                bdesigninfo.MaterialId = 0;

                            }
                            if (!cells[bsi.RequireCountRow].Trim().Equals(""))
                            {
                                try
                                {
                                    bdesigninfo.RequireCount = Convert.ToDouble(cells[bsi.RequireCountRow].Trim());
                                }
                                catch
                                {
                                    error = error + cells[bsi.RequireCountRow].Trim() + ":" + Lang.INPUT_NUMBER;
                                }
                            }
                            else
                            {
                                bdesigninfo.RequireCount = 0;
                            }
                            if (bsi.PriceRow != -1)
                            {
                                if (!cells[bsi.PriceRow].Trim().Equals(""))
                                {
                                    try
                                    {
                                        bdesigninfo.Price = Convert.ToDouble(cells[bsi.PriceRow].Trim());
                                    }
                                    catch
                                    {
                                        bdesigninfo.Price = 0;
                                    }
                                }
                                else
                                {
                                    bdesigninfo.Price = 0;
                                }
                            }
                        }
                        //採購材料檢查結束

                        if (bsi.MoldSkletonRow != -1)
                        {
                            bdesigninfo.MoldSkleton = cells[bsi.MoldSkletonRow].Trim();
                        }
                        if (bsi.StandRow != -1)
                        {
                            bdesigninfo.Stand = cells[bsi.StandRow].Trim();
                        }
                        if (bsi.SkillRequirementRow != -1)
                        {
                            bdesigninfo.SkillRequirement = cells[bsi.SkillRequirementRow].Trim();
                        }
                        if (bsi.HeatProcessRow != -1)
                        {
                            if (cells[bsi.HeatProcessRow].Trim().Equals("") || cells[bsi.HeatProcessRow].Trim().Equals("否"))
                            {
                                bdesigninfo.HeatProcess = "0";
                            }
                            else
                            {
                                bdesigninfo.HeatProcess = "1";
                            }
                        }
                        if (bsi.CryogenicRow != -1)
                        {
                            bdesigninfo.Cryogenic = cells[bsi.CryogenicRow].Trim();
                        }
                        if (bsi.RequestRow != -1)
                        {
                            bdesigninfo.Request = cells[bsi.RequestRow].Trim();
                        }
                        if (bsi.MaterialerRow != -1)
                        {
                            bdesigninfo.Materialer = cells[bsi.MaterialerRow].Trim();
                        }

                        //標準工藝檢查
                        if (needStandProcess)
                        {
                            if (bsi.StandProcessRow != -1)
                            {
                                if (!cells[bsi.StandProcessRow].Trim().Equals(""))
                                {
                                    IList stands = new ArrayList();
                                    if (!hstandprocess.ContainsKey(cells[bsi.StandProcessRow].Trim()))
                                    {
                                        WorkFlow.BLL.Standard.StandProcess standprocess = new WorkFlow.BLL.Standard.StandProcess();
                                        stands = standprocess.GetStandProcessByName(cells[bsi.StandProcessRow].Trim());
                                        hstandprocess.Add(cells[bsi.StandProcessRow].Trim(), stands);
                                    }
                                    stands = hstandprocess[cells[bsi.StandProcessRow].Trim()] as ArrayList;
                                    if (stands.Count == 0)
                                    {
                                        error = error + Translate.translateString("標準工藝編號未定義");
                                    }
                                    else
                                    {
                                        bdesigninfo.StandProcess = cells[bsi.StandProcessRow].Trim();
                                    }
                                }
                            }
                            else
                            {
                                error = error + Translate.translateString("BOM格式中沒有定義標準工藝");
                            }
                        }

                        bdesigninfo.Error = error;

                        if (!error.Equals(""))
                        {
                            BomDeatilError bde = new BomDeatilError();
                            bde.ErrorLine = Convert.ToString(i + 1);
                            bde.ErrorMessage = error;
                            errorlist.Add(bde);
                        }
                        else
                        {
                            parts.Add(bdesigninfo);
                        }

                    }
                    else
                    {
                        BomDeatilError bde = new BomDeatilError();
                        bde.ErrorLine = Convert.ToString(i + 1);
                        bde.ErrorMessage = Translate.translateString("必須為") + bsi.Rows + Translate.translateString("列"); ;
                        errorlist.Add(bde);

                    }
                }
            }

            return parts;
        }





        private int countnum(string text1, string text2)
        {
            int total = 0;
            int loact = text1.IndexOf(text2);
            while (loact != -1)
            {
                int loc = text1.IndexOf(text2) + text2.Length;
                int len = text1.Length - loc;
                if (loc != -1)
                {
                    text1 = text1.Substring(loc, len);
                }
                loact = text1.IndexOf(text2);
                total++;
            }
            return total;
        }

        public bool checkpartno(string text)//判斷字符串中是否包含2個以上的"-" 如果有單獨的'-'返回 false, 否則返回 true;
        {
            if (countnum(text, "-") >= 2)
            {
                if (text.IndexOf("--") >= 0)
                {
                    string temp = text.Substring(text.IndexOf("--") + 2);
                    if (!temp.Trim().Equals(""))
                    {
                        temp = checktopstr(temp);
                        if (temp.IndexOf("-") < 0)
                        {
                            return true;
                        }
                        else
                        {
                            return checkpartno(temp);
                        }
                    }
                    else
                    {
                        return true;
                    }

                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        private string checktopstr(string text)
        {
            string temp = "";
            if (text.IndexOf("-") == 0)
            {
                temp = text.Substring(text.IndexOf("-") + 1);
                return checktopstr(temp);
            }
            else
            {
                return text;
            }
        }


        //whd081203
        public IList CheckDetailisElectFile(string[] lines, BomDesignInfo dbi, bool needStandProcess)
        {
            string[] cells;
            IList parts = new ArrayList();
            BomDetailInfo bdesigninfo = new BomDetailInfo();
            BOMStyle bs = new BOMStyle();
            BOMStyleInfo bsi = bs.getIsElectrodeBOMStyleInfo();
            string sLine;
            //ModuleWorkFlow.BLL.System.ModuleType mt = new ModuleWorkFlow.BLL.System.ModuleType();
            Material material = new Material();
            //			errors = new ArrayList();
            BLL.Part part = new BLL.Part();
            string error = "";

            for (int i = 0; i < lines.Length; i++)//根據行數決定循環添加記錄數
            {
                error = "";
                bdesigninfo = new BomDetailInfo();
                sLine = lines[i];
                cells = sLine.Split('\t');

                if (cells.Length == bsi.Rows)
                {
                    bdesigninfo.BomDesignNo = dbi.Id;
                    if (!cells[bsi.PartNoRow].Trim().Equals(""))
                    {
                        if (ConvertString.ConvertToPratNo(cells[bsi.PartNoRow].Trim().ToUpper()) && ConvertString.ConvertToPartNoToG(cells[bsi.PartNoRow].Trim().ToUpper()))//通過驗證
                        {
                            bdesigninfo.PartNo = cells[bsi.PartNoRow].Trim().ToUpper();

                        }
                        else
                        {
                            error = error + Translate.translateString("電極編號只能輸入英文和數字或者或者不能單獨輸入-");
                        }
                    }
                    else
                    {
                        error = error + Translate.translateString("電極編號必須填寫");
                    }
                    bdesigninfo.PartName = cells[bsi.PartNameRow].Trim();


                    if (!cells[bsi.MaterialRow].Trim().Equals(""))
                    {
                        MaterialInfo mii = new MaterialInfo();
                        if (material.getPartMaterialByName(cells[bsi.MaterialRow].Trim()) == null)
                        {
                            MaterialInfo mi = new MaterialInfo();
                            mi.Name = cells[bsi.MaterialRow].Trim();
                            mi.TypeId = "Part";
                            mi.Price = 0;
                            mi.Density = 0;
                            material.AddMaterial(mi);

                        }
                        mii = material.getMaterialByName(cells[bsi.MaterialRow].Trim());
                        bdesigninfo.MaterialId = mii.Id;
                    }
                    else
                    {
                        error = error + Translate.translateString("材料必須填寫");
                    }
                    if (!cells[bsi.RequireCountRow].Trim().Equals(""))
                    {
                        try
                        {
                            bdesigninfo.RequireCount = Convert.ToInt32(cells[bsi.RequireCountRow].Trim());
                        }
                        catch
                        {
                            error = error + Translate.translateString("4列") + cells[bsi.RequireCountRow].Trim() + ":" + Lang.INPUT_NUMBER;
                        }
                    }
                    else
                    {
                        error = error + Translate.translateString("數量必須填寫");
                    }
                    if (bsi.IsMerchindiseRow != -1)
                    {
                        if (cells[bsi.IsMerchindiseRow].Trim().Equals("") || cells[bsi.IsMerchindiseRow].Trim().Equals("否"))
                        {
                            bdesigninfo.IsMerchindise = 0;

                            if (!cells[bsi.SpecRow].Trim().Equals(""))//不為空
                            {
                                if (this.isValid(cells[bsi.SpecRow].Trim()))//通過驗證
                                {
                                    bdesigninfo.Spec = cells[bsi.SpecRow].Trim().Replace("*", "*");
                                }
                                else
                                {
                                    error = error + Translate.translateString("規格要滿足 數字*數字*數字。");
                                }
                            }
                            else
                            {
                                error = error + "";
                            }
                        }
                        else
                        {
                            bdesigninfo.IsMerchindise = 1;
                            bdesigninfo.Spec = cells[bsi.SpecRow].Trim();
                            //sjw bug2112
                            try
                            {
                                bdesigninfo.Price = Convert.ToDouble(cells[bsi.PriceRow].Trim());
                            }
                            catch
                            {
                                bdesigninfo.Price = 0;
                            }
                        }
                    }
                    else
                    {
                        if (!cells[bsi.SpecRow].Trim().Equals(""))//不為空
                        {
                            if (this.isValid(cells[bsi.SpecRow].Trim()))//通過驗證
                            {
                                bdesigninfo.Spec = cells[bsi.SpecRow].Trim().Replace("*", "*");
                            }
                            else
                            {
                                error = error + Translate.translateString("規格要滿足 數字*數字*數字。");
                            }
                        }
                        else
                        {
                            error = error + "";
                        }
                    }
                    if (bsi.ProcessTypeRow != -1)
                    {
                        bdesigninfo.ProcessType = cells[bsi.ProcessTypeRow].Trim();
                    }
                    if (bsi.CommentRow != -1)
                    {
                        bdesigninfo.Comment = cells[bsi.CommentRow].Trim();
                    }

                    //標準工藝檢查
                    if (needStandProcess)
                    {
                        if (bsi.StandProcessRow != -1)
                        {
                            if (!cells[bsi.StandProcessRow].Trim().Equals(""))
                            {
                                WorkFlow.BLL.Standard.StandProcess standprocess = new WorkFlow.BLL.Standard.StandProcess();
                                IList stands = standprocess.GetStandProcessByName(cells[bsi.StandProcessRow].Trim());
                                if (stands.Count == 0)
                                {
                                    error = error + Translate.translateString("標準工藝編號未定義");
                                }
                                else
                                {
                                    bdesigninfo.StandProcess = cells[bsi.StandProcessRow].Trim();
                                }
                            }
                        }
                        else
                        {
                            error = error + Translate.translateString("BOM格式中沒有定義標準工藝");
                        }
                    }
                    bdesigninfo.Error = error;
                    parts.Add(bdesigninfo);
                }
                else
                {

                    bdesigninfo.Error = Translate.translateString("必須為") + bsi.Rows + Translate.translateString("列");
                    parts.Add(bdesigninfo);
                }
            }

            return parts;
        }
        //endwhd081203

   

    }
}
