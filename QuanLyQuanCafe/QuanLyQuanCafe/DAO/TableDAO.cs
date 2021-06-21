using QuanLyQuanCafe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DAO
{
    public class TableDAO
    {
        private static TableDAO instance;

        public static TableDAO Instance
        {
            get { if (instance == null) instance = new TableDAO(); return TableDAO.instance; }
            private set { TableDAO.instance = value; }
        }

        public static int TableWidth = 80;
        public static int TableHeight = 80;

        private TableDAO() { }

        public void SwitchTable(int id1, int id2)
        {
            DataProvider.Instance.ExecuteQuery("SwitchTable @idTable1 , @idTabel2", new object[] { id1, id2 });
        }


        public bool InsertTable(string name)
        {
            string query = " INSERT INTO dbo.TableFood(name) VALUES(N'" + name + "')";


            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }
        public bool UpdateTable(string name, int id)
        {
            string query = "UPDATE dbo.TableFood SET name = N'" + name + "' WHERE id  = " + id + "";
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool DeleteTable(int id)
        {
            string query = string.Format("Delete TableFood where id = {0}", id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }
        public List<Table> LoadTableList()
        {
            List<Table> tableList = new List<Table>();

            DataTable data = DataProvider.Instance.ExecuteQuery("SELECT * FROM dbo.TableFood");

            foreach (DataRow item in data.Rows)
            {
                Table table = new Table(item);
                tableList.Add(table);
            }

            return tableList;
        }

        public List<Table> LoadTableListForSwitchTable()
        {
            List<Table> tableList = new List<Table>();

            DataTable data = DataProvider.Instance.ExecuteQuery("SELECT * FROM dbo.TableFood WHERE status = N'Trống'");

            foreach (DataRow item in data.Rows)
            {
                Table table = new Table(item);
                tableList.Add(table);
            }

            return tableList;
        }

        public Table FindTableFromId(int id)
        {
            List<Table> list = new List<Table>();

            DataTable data = DataProvider.Instance.ExecuteQuery(" SELECT * FROM dbo.TableFood WHERE id = " + id);

            foreach (DataRow item in data.Rows)
            {
                Table info = new Table(item);
                list.Add(info);
            }
            return list[0];
        }
        public List<Table> LoadTableListForGroupTable()
        {
            List<Table> tableList = new List<Table>();

            DataTable data = DataProvider.Instance.ExecuteQuery("SELECT * FROM dbo.TableFood WHERE status = N'Có người'");

            foreach (DataRow item in data.Rows)
            {
                Table table = new Table(item);
                tableList.Add(table);
            }

            return tableList;
        }
    }
}