using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Reporting.WinForms;
using QuanLyQuanCafe.data;

namespace QuanLyQuanCafe
{
    public partial class fHoaDon : Form
    {
        int idBill;
        public fHoaDon(int idBill  )
        {
            InitializeComponent();
            this.idBill = idBill;
        }

        private void fHoaDon_Load(object sender, EventArgs e)
        {

            hienthi(idBill);

        }
        private void hienthi(int maPhieuThue)
        {
            using (var qlks = new qlks())
            {

                String query1 = "SELECT Bill.id,DateCheckIn,idTable,name,count," +
                    "(CAST(discount AS NVARCHAR(100)) + '000') AS discount," +
                    "(CAST(totalPrice AS NVARCHAR(100)) + '000') AS totalPrice " +
                    "FROM dbo.Bill,dbo.BillInfo,food  WHERE Food.id= dbo.BillInfo.idFood and Bill.id = dbo.BillInfo.idBill AND Bill.id= " + idBill + "";

                List<hoa_don> danhsach1 = qlks.Database.SqlQuery<hoa_don>(query1).ToList();

                this.reportViewer1.LocalReport.ReportPath = "Report1.rdlc";

                var reportDataSource1 = new ReportDataSource("DataSet1", danhsach1);

                this.reportViewer1.LocalReport.DataSources.Clear();
                //this.reportViewer1.LocalReport.DataSources.Add(reportDataSource);
                this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);


                this.reportViewer1.RefreshReport();


            }
        }
    }
}
