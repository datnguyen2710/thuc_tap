using QuanLyQuanCafe.DAO;
using QuanLyQuanCafe.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using app = Microsoft.Office.Interop.Excel.Application;

namespace QuanLyQuanCafe
{
    public partial class fAdmin : Form
    {
        BindingSource foodList = new BindingSource();
        BindingSource accountList = new BindingSource();
        BindingSource categoryList = new BindingSource();
        BindingSource tableList = new BindingSource();

        public Account loginAccount;
        public fAdmin()
        {
            InitializeComponent();
            Load();
            loadChart(2021);
        }

        #region methods

        private void loadChart(int nam)
        {
            chart1.Series["Doanh Thu"].Points.Clear();
            try
            {
                DataTable data = BillDAO.Instance.GetDoanhThueTheoThang(nam);

                chart1.ChartAreas["ChartArea1"].AxisX.Title = "Tháng";
                chart1.ChartAreas["ChartArea1"].AxisY.Title = "Doanh Thu";
                chart1.ChartAreas["ChartArea1"].AxisX.Interval = 1;

                for (int i = 0; i < data.Rows.Count; i++)
                {
                    chart1.Series["Doanh Thu"].Points.AddXY(data.Rows[i]["thang"], data.Rows[i]["tongtien"]);

                }
            }
            catch (Exception)
            {


            }

        }
        List<Food> SearchFoodByName(string name)
        {
            List<Food> listFood = FoodDAO.Instance.SearchFoodByName(name);

            return listFood;
        }

        void Load()
        {
            dtgvFood.DataSource = foodList;
            dtgvAccount.DataSource = accountList;
            dtgvCategory.DataSource = categoryList;
            dtgvTable.DataSource = tableList;

            LoadDateTimePickerBill();
            LoadListBillByDate(dtpkFromDate.Value, dtpkToDate.Value);
            LoadListFood();
            LoadAccount();
            LoadCategoryIntoCombobox(cbFoodCategory);
            AddFoodBinding();
            AddAccountBinding();

            loadGrvCategory();
            AddCategoryBinding();
            loadTable();
            AddTableBinding();
            LoadTongTienTheoThang();
        }

        private void loadTable()
        {
            tableList.DataSource = TableDAO.Instance.LoadTableList();
        }

        private void loadGrvCategory()
        {
            categoryList.DataSource = CategoryDAO.Instance.GetListCategory();
        }

        void AddTableBinding()
        {
            tbTableID.DataBindings.Add(new Binding("Text", dtgvTable.DataSource, "ID", true, DataSourceUpdateMode.Never));
            txbNameTable.DataBindings.Add(new Binding("Text", dtgvTable.DataSource, "name", true, DataSourceUpdateMode.Never));
        }

        void AddCategoryBinding()
        {
            tbCategoryID.DataBindings.Add(new Binding("Text", dtgvCategory.DataSource, "ID", true, DataSourceUpdateMode.Never));
            txbNameCategory.DataBindings.Add(new Binding("Text", dtgvCategory.DataSource, "name", true, DataSourceUpdateMode.Never));
        }



        void AddAccountBinding()
        {
            tbUserName.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "UserName", true, DataSourceUpdateMode.Never));
            tbDisplayName.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "DisplayName", true, DataSourceUpdateMode.Never));
            numericUpDown1.DataBindings.Add(new Binding("Value", dtgvAccount.DataSource, "Type", true, DataSourceUpdateMode.Never));
        }

        void LoadAccount()
        {
            accountList.DataSource = AccountDAO.Instance.GetListAccount();
        }
        void LoadDateTimePickerBill()
        {
            DateTime today = DateTime.Now;
            dtpkFromDate.Value = new DateTime(today.Year, today.Month, 1);
            dtpkToDate.Value = dtpkFromDate.Value.AddMonths(1).AddDays(-1);
        }
        void LoadListBillByDate(DateTime checkIn, DateTime checkOut)
        {
            dtgvBill.DataSource = BillDAO.Instance.GetBillListByDate(checkIn, checkOut);
        }

        void AddFoodBinding()
        {
            tbFoodName.DataBindings.Add(new Binding("Text", dtgvFood.DataSource, "Name", true, DataSourceUpdateMode.Never));
            tbFoodID.DataBindings.Add(new Binding("Text", dtgvFood.DataSource, "ID", true, DataSourceUpdateMode.Never));
            nmFoodPrice.DataBindings.Add(new Binding("Value", dtgvFood.DataSource, "Price", true, DataSourceUpdateMode.Never));
        }

        void LoadCategoryIntoCombobox(ComboBox cb)
        {
            cb.DataSource = CategoryDAO.Instance.GetListCategory();
            cb.DisplayMember = "Name";
        }
        void LoadListFood()
        {
            foodList.DataSource = FoodDAO.Instance.GetListFood();
        }
        void AddAccount(string userName, string displayName, int type)
        {
            if (AccountDAO.Instance.InsertAccount(userName, displayName, type))
            {
                MessageBox.Show("Thêm tài khoản thành công!");
            }
            else
            {
                MessageBox.Show("Thêm tài khoản thất bại!");
            }

            LoadAccount();
        }

        void EditAccount(string userName, string displayName, int type)
        {
            if (AccountDAO.Instance.UpdateAccount(userName, displayName, type))
            {
                MessageBox.Show("Cập nhật tài khoản thành công");
            }
            else
            {
                MessageBox.Show("Cập nhật tài khoản thất bại");
            }

            LoadAccount();
        }

        void DeleteAccount(string userName)
        {
            if (loginAccount.UserName.Equals(userName))
            {
                MessageBox.Show("Không xóa được!");
                return;
            }
            if (AccountDAO.Instance.DeleteAccount(userName))
            {
                MessageBox.Show("Xóa tài khoản thành công!");
            }
            else
            {
                MessageBox.Show("Xóa tài khoản thất bại!");
            }

            LoadAccount();
        }

        void ResetPass(string userName)
        {
            if (AccountDAO.Instance.ResetPassword(userName))
            {
                MessageBox.Show("Đặt lại mật khẩu thành công!");
            }
            else
            {
                MessageBox.Show("Đặt lại mật khẩu thất bại!");
            }
        }
        #endregion

        #region events
        private void btAddAccount_Click(object sender, EventArgs e)
        {
            string userName = tbUserName.Text;
            string displayName = tbDisplayName.Text;
            int type = (int)numericUpDown1.Value;

            AddAccount(userName, displayName, type);
        }

        private void btDeleteAccount_Click(object sender, EventArgs e)
        {
            string userName = tbUserName.Text;

            DeleteAccount(userName);
        }

        private void btEditAccount_Click(object sender, EventArgs e)
        {
            string userName = tbUserName.Text;
            string displayName = tbDisplayName.Text;
            int type = (int)numericUpDown1.Value;

            EditAccount(userName, displayName, type);
        }


        private void btResetPassword_Click(object sender, EventArgs e)
        {
            string userName = tbUserName.Text;

            ResetPass(userName);
        }
        private void btShowAccount_Click(object sender, EventArgs e)
        {
            LoadAccount();
        }

        private void btSearchFood_Click(object sender, EventArgs e)
        {
            String name = tbSearchFoodName.Text;
            foodList.DataSource = FoodDAO.Instance.SearchFoodByName(name);
        }
        private void tbFoodID_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (dtgvFood.SelectedCells.Count > 0 && dtgvFood.SelectedCells[0].OwningRow.Cells["CategoryID"].Value != null)
                {

                    int id = (int)dtgvFood.SelectedCells[0].OwningRow.Cells["CategoryID"].Value;

                    Category cateogory = CategoryDAO.Instance.GetCategoryByID(id);

                    cbFoodCategory.SelectedItem = cateogory;

                    int index = -1;
                    int i = 0;
                    foreach (Category item in cbFoodCategory.Items)
                    {
                        if (item.ID == cateogory.ID)
                        {
                            index = i;
                            break;
                        }
                        i++;
                    }

                    cbFoodCategory.SelectedIndex = index;
                }
            }
            catch 
            { }
        }

        private void btAddFood_Click(object sender, EventArgs e)
        {
            string name = tbFoodName.Text;
            int categoryID = (cbFoodCategory.SelectedItem as Category).ID;
            float price = (float)nmFoodPrice.Value;

            if (FoodDAO.Instance.InsertFood(name, categoryID, price))
            {
                MessageBox.Show("Thêm món thành công!");
                LoadListFood();
                if (insertFood != null)
                    insertFood(this, new EventArgs());
            }
            else
            {
                MessageBox.Show("Có lỗi khi thêm món!");
            }
        }

        private void btEditFood_Click(object sender, EventArgs e)
        {
            string name = tbFoodName.Text;
            int categoryID = (cbFoodCategory.SelectedItem as Category).ID;
            float price = (float)nmFoodPrice.Value;
            int id = Convert.ToInt32(tbFoodID.Text);

            if (FoodDAO.Instance.UpdateFood(id, name, categoryID, price))
            {
                MessageBox.Show("Sửa món thành công!");
                LoadListFood();
                if (updateFood != null)
                    updateFood(this, new EventArgs());
            }
            else
            {
                MessageBox.Show("Có lỗi khi sửa món!");
            }
        }

        private void btDeleteFood_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(tbFoodID.Text);

            if (FoodDAO.Instance.DeleteFood(id))
            {
                MessageBox.Show("Xóa món thành công!");
                LoadListFood();
                if (deleteFood != null)
                    deleteFood(this, new EventArgs());
            }
            else
            {
                MessageBox.Show("Có lỗi khi xóa món!");
            }
        }
        private void btShowFood_Click(object sender, EventArgs e)
        {
            LoadListFood();
        }

        private void btViewBill_Click(object sender, EventArgs e)
        {
            LoadListBillByDate(dtpkFromDate.Value, dtpkToDate.Value);
            LoadTongTienTheoThang();
        }
         void LoadTongTienTheoThang()
        {
            txbTongTien.Text = BillDAO.Instance.getTongTienByThang(dtpkFromDate.Value, dtpkToDate.Value).ToString();

        }

        private event EventHandler insertFood;
        public event EventHandler InsertFood
        {
            add { insertFood += value; }
            remove { insertFood -= value; }
        }

        private event EventHandler deleteFood;
        public event EventHandler DeleteFood
        {
            add { deleteFood += value; }
            remove { deleteFood -= value; }
        }

        private event EventHandler updateFood;
        public event EventHandler UpdateFood
        {
            add { updateFood += value; }
            remove { updateFood -= value; }
        }



        #endregion

        private void tbSearchFoodName_TextChanged(object sender, EventArgs e)
        {
            String name = tbSearchFoodName.Text;
            foodList.DataSource = FoodDAO.Instance.SearchFoodByName(name);
        }

        private void btFirstBillPage_Click(object sender, EventArgs e)
        {
            tbPageBill.Text = "1";
        }

        private void btLastBillPage_Click(object sender, EventArgs e)
        {
            int sumRecord = BillDAO.Instance.GetNumBillListByDate(dtpkFromDate.Value, dtpkToDate.Value);

            int lastPage = sumRecord / 10;

            if (sumRecord % 10 != 0)
                lastPage++;

            tbPageBill.Text = lastPage.ToString();
        }

        private void tbPageBill_TextChanged(object sender, EventArgs e)
        {
            dtgvBill.DataSource = BillDAO.Instance.GetBillListByDateAndPage(dtpkFromDate.Value, dtpkToDate.Value, Convert.ToInt32(tbPageBill.Text));
        }

        private void btPreviousBillPage_Click(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(tbPageBill.Text);

            if (page > 1)
                page--;

            tbPageBill.Text = page.ToString();
        }

        private void btNextBillPage_Click(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(tbPageBill.Text);
            int sumRecord = BillDAO.Instance.GetNumBillListByDate(dtpkFromDate.Value, dtpkToDate.Value);

            if (page < sumRecord)
                page++;

            tbPageBill.Text = page.ToString();
        }

        private void btXuatExcel_Click(object sender, EventArgs e)
        {
            SaveFileDialog openDia = new SaveFileDialog();
            openDia.InitialDirectory = "C:\\";
            openDia.Filter = "file excel | *.xlsx";
            if (openDia.ShowDialog() == DialogResult.OK)
            {
                app obj = new app();
                obj.Application.Workbooks.Add(Type.Missing);
                obj.Columns.ColumnWidth = 18;
                obj.StandardFontSize = 13;
                Console.WriteLine(dtgvBill.RowCount);
                obj.Cells[1, 1] = "Quản lý quán cà phê";
                obj.Cells[2, 1] = "Lê Văn Việt, Quận 9, tp.Hồ Chí Minh";
                obj.Cells[3, 1] = "Số điện thoại: 0398608924";
                obj.Cells[5, 4] = "THÔNG TIN HÓA ĐƠN TRONG THÁNG";
                obj.Rows[1].Font.Bold = true;
                obj.Rows[2].Font.Bold = true;
                obj.Rows[3].Font.Bold = true;
                obj.Rows[5].Font.Bold = true;
                obj.Rows[6].Font.Bold = true;
                if (dtgvBill.Rows.Count > 0)
                {
                    for (int i = 1; i < dtgvBill.Columns.Count + 1; i++)
                    {
                        obj.Cells[6, i] = dtgvBill.Columns[i - 1].HeaderText;
                    }
                    for (int i = 0; i < dtgvBill.Rows.Count; i++)
                    {
                        for (int j = 0; j < dtgvBill.Columns.Count; j++)
                        {
                            if (dtgvBill.Rows[i].Cells[j].Value != null)
                            {
                                obj.Cells[7 + i, j + 1] = dtgvBill.Rows[i].Cells[j].Value.ToString();
                            }
                            else
                            {
                                obj.Cells[i + 7, j + 1] = "";
                            }
                        }
                    }
                    obj.ActiveWorkbook.SaveCopyAs(openDia.FileName);
                    obj.ActiveWorkbook.Saved = true;
                    MessageBox.Show("Thành công!");
                }
            }
        }

        private void btAddCategory_Click(object sender, EventArgs e)
        {

            String name = txbNameCategory.Text;
            int id = Convert.ToInt32(tbCategoryID.Text);
            if (CategoryDAO.Instance.InsertCategory(name))
            {
                MessageBox.Show("Thêm danh mục thành công!");
            }
            else
            {
                MessageBox.Show("Thêm danh mục thất bại!");
            }

            loadGrvCategory();
        }

        private void btDeleteCategory_Click(object sender, EventArgs e)
        {
            String name = txbNameCategory.Text;
            int id = Convert.ToInt32(tbCategoryID.Text);
            if (CategoryDAO.Instance.DeleteAccount(id))
            {
                MessageBox.Show("Xóa danh mục thành công!");
            }
            else
            {
                MessageBox.Show("Xóa danh mục thất bại!");
            }

            loadGrvCategory();

        }

        private void btEditCategory_Click(object sender, EventArgs e)
        {
            String name = txbNameCategory.Text;
            int id = Convert.ToInt32(tbCategoryID.Text);
            if (CategoryDAO.Instance.UpdateCategory(name,id))
            {
                MessageBox.Show("Sửa danh mục thành công!");
            }
            else
            {
                MessageBox.Show("Sửa danh mục thất bại!");
            }

            loadGrvCategory();
        }

  

        private void btAddTable_Click(object sender, EventArgs e)
        {
            String name = txbNameTable.Text;

            int id = Convert.ToInt32(tbTableID.Text);

            if (TableDAO.Instance.InsertTable(name))
            {
                MessageBox.Show("Thêm Bàn thành công!");
            }
            else
            {
                MessageBox.Show("Thêm Bàn thất bại!");
            }

            loadTable();
        }

        private void btDeleteTable_Click(object sender, EventArgs e)
        {
            String name = txbNameTable.Text;

            int id = Convert.ToInt32(tbTableID.Text); ;
            if (TableDAO.Instance.DeleteTable(id))
            {
                MessageBox.Show("Xóa bàn thành công!");
            }
            else
            {
                MessageBox.Show("Xóa bàn thất bại!");
            }

            loadTable();
        }

        private void btEditTable_Click(object sender, EventArgs e)
        {
            String name = txbNameTable.Text;

            int id = Convert.ToInt32(tbTableID.Text);
            if (TableDAO.Instance.UpdateTable(name, id))
            {
                MessageBox.Show("Sửa Bàn thành công!");
            }
            else
            {
                MessageBox.Show("Sửa Bàn thất bại!");
            }

            loadTable();
        }

        private void cbbNam_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbbNam.SelectedIndex != -1)
            {
                int nam = Convert.ToInt32(cbbNam.SelectedItem.ToString());
                loadChart(nam);
            }
        }


    }
}