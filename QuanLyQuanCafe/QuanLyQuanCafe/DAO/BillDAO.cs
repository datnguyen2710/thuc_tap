using QuanLyQuanCafe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DAO
{
    public class BillDAO
    {
        private static BillDAO instance;

        public static BillDAO Instance
        {
            get { if (instance == null) instance = new BillDAO(); return BillDAO.instance; }
            private set { BillDAO.instance = value; }
        }

        private BillDAO() { }

        public DataTable GetDoanhThueTheoThang(int Nam)
        {
            return DataProvider.Instance.ExecuteQuery("SELECT MONTH(DateCheckIn) AS thang ,SUM(totalPrice) AS tongtien FROM dbo.bill WHERE YEAR(DateCheckIn) = " + Nam + " GROUP BY MONTH(DateCheckIn)");

        }

        /// <summary>
        /// Thành công: bill ID
        /// thất bại: -1
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        /// 


        public float getTongTienByThang(DateTime fromDate, DateTime toDate)
        {
            float TienThang = 0;
            try
            {
                TienThang = (float)Convert.ToDouble(DataProvider.Instance.ExecuteScalar(" SELECT SUM(totalPrice) FROM dbo.bill WHERE '" + fromDate + "'<=DateCheckIn AND DateCheckOut<= '" + toDate + "'"));

            }
            catch (Exception)
            {

            }
            return TienThang;
        }
        public Bill GetBillByIdTable(int id)
        {
            List<Bill> listBill = new List<Bill>();

            DataTable data = DataProvider.Instance.ExecuteQuery("SELECT  * FROM dbo.Bill WHERE status = 0 AND idTable = " + id);

            foreach (DataRow item in data.Rows)
            {
                Bill info = new Bill(item);
                listBill.Add(info);
            }
            return listBill[0];
        }

        public int GetUncheckBillIDByTableID(int id)
        {
            DataTable data = DataProvider.Instance.ExecuteQuery("SELECT * FROM dbo.Bill WHERE idTable = " + id + " AND status = 0");

            if (data.Rows.Count > 0)
            {
                Bill bill = new Bill(data.Rows[0]);
                return bill.ID;
            }

            return -1;
        }
        public void CheckOut(int id, int discount, float totalPrice)
        {
            string query = "UPDATE dbo.Bill SET dateCheckOut = GETDATE(), status = 1, " + "discount = " + discount + ", totalPrice = " + totalPrice + " WHERE id = " + id;
            DataProvider.Instance.ExecuteNonQuery(query);
        }
        public void InsertBill(int id)
        {
            DataProvider.Instance.ExecuteNonQuery("exec USP_InsertBill @idTable", new object[] { id });
        }

        public DataTable GetBillListByDate(DateTime checkIn, DateTime checkOut)
        {
            return DataProvider.Instance.ExecuteQuery("exec USP_GetListBillByDate @checkIn , @checkOut", new object[] { checkIn, checkOut });
        }

        public DataTable GetBillListByDateAndPage(DateTime checkIn, DateTime checkOut, int pageNum)
        {
            return DataProvider.Instance.ExecuteQuery("exec USP_GetListBillByDateAndPage @checkIn , @checkOut , @page", new object[] { checkIn, checkOut, pageNum });
        }
        public int GetNumBillListByDate(DateTime checkIn, DateTime checkOut)
        {
            return (int)DataProvider.Instance.ExecuteScalar("exec USP_GetNumBillByDate @checkIn , @checkOut", new object[] { checkIn, checkOut });
        }


        public int GetMaxIDBill()
        {
            try
            {
                return (int)DataProvider.Instance.ExecuteScalar("SELECT MAX(id) FROM dbo.Bill");
            }
            catch
            {
                return 1;
            }
        }

    }
}