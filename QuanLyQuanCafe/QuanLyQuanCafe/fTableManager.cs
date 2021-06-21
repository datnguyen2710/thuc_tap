using QuanLyQuanCafe.DAO;
using QuanLyQuanCafe.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;
using System.Windows.Forms;
using Menu = QuanLyQuanCafe.DTO.Menu;

namespace QuanLyQuanCafe
{
    public partial class fTableManager : Form
    {
        private Account loginAccount;

        public Account LoginAccount
        {
            get { return loginAccount; }
            set { loginAccount = value; ChangeAccount(loginAccount.Type); }
        }
        public fTableManager(Account acc)
        {
            InitializeComponent();

            this.LoginAccount = acc;

            LoadTable();
            LoadCategory();
            LoadTableListForSwitchTable(cbSwitchTable);
            LoadTableListForGroupTable(cbbGroupTable);
        }

        #region Method

        void ChangeAccount(int type)
        {
            adminToolStripMenuItem.Enabled = type == 1;
            thôngTinTàiKhoảnToolStripMenuItem.Text += " (" + LoginAccount.DisplayName + ")";
        }
        void LoadCategory()
        {
            List<Category> listCategory = CategoryDAO.Instance.GetListCategory();
            cbCategory.DataSource = listCategory;
            cbCategory.DisplayMember = "Name";
        }

        void LoadFoodListByCategoryID(int id)
        {
            List<Food> listFood = FoodDAO.Instance.GetFoodByCategoryID(id);
            cbFood.DataSource = listFood;
            cbFood.DisplayMember = "Name";
        }
        void LoadTable()
        {
            flpTable.Controls.Clear();

            List<Table> tableList = TableDAO.Instance.LoadTableList();

            foreach (Table item in tableList)
            {
                Button btn = new Button() { Width = TableDAO.TableWidth, Height = TableDAO.TableHeight };
                btn.Text = item.Name + Environment.NewLine + item.Status;
                btn.Click += btn_Click;
                btn.Tag = item;

                switch (item.Status)
                {
                    case "Trống":
                        btn.BackColor = Color.Aqua;
                        break;
                    default:
                        btn.BackColor = Color.LightPink;
                        break;
                }

                flpTable.Controls.Add(btn);
            }
        }

        void ShowBill(int id)
        {
            lvBill.Items.Clear();
            List<QuanLyQuanCafe.DTO.Menu> listBillInfo = MenuDAO.Instance.GetListMenuByTable(id);
            float totalPrice = 0;
            foreach (QuanLyQuanCafe.DTO.Menu item in listBillInfo)
            {
                ListViewItem lvItem = new ListViewItem(item.FoodName.ToString());
                lvItem.SubItems.Add(item.Count.ToString());
                lvItem.SubItems.Add(item.Price.ToString());
                lvItem.SubItems.Add(item.TotalPrice.ToString());
                totalPrice += item.TotalPrice;
                lvBill.Items.Add(lvItem);
            }
            CultureInfo culture = new CultureInfo("vi-VN");

            //Thread.CurrentThread.CurrentCulture = culture;

            tbTotalPrice.Text = totalPrice.ToString("c", culture);

        }

        void LoadTableListForSwitchTable(ComboBox cb)
        {
            cb.DataSource = TableDAO.Instance.LoadTableListForSwitchTable();
            cb.DisplayMember = "Name";
        }
        void LoadTableListForGroupTable(ComboBox cb)
        {
            cb.DataSource = TableDAO.Instance.LoadTableListForGroupTable();
            cb.DisplayMember = "Name";
        }


        #endregion


        #region Events
        private void thanhToánToolStripMenuItem_Click(object sender, EventArgs e)
        {
            btnThanhToan_Click(this, new EventArgs());
        }

        private void thêmMónToolStripMenuItem_Click(object sender, EventArgs e)
        {
            btThemMon_Click(this, new EventArgs());
        }
        private void chuyểnBànToolStripMenuItem_Click(object sender, EventArgs e)
        {
            btnChuyenBan_Click(this, new EventArgs());
        }

        private void gộpBànToolStripMenuItem_Click(object sender, EventArgs e)
        {
            btnGopBan_Click(this, new EventArgs());
        }
        void btn_Click(object sender, EventArgs e)
        {
            int tableID = ((sender as Button).Tag as Table).ID;
            lvBill.Tag = (sender as Button).Tag;
            ShowBill(tableID);
        }
        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void thôngTinCáNhânToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fAccountProfile f = new fAccountProfile(LoginAccount);
            f.UpdateAccount += f_UpdateAccount;
            f.ShowDialog();
        }

        void f_UpdateAccount(object sender, AccountEvent e)
        {
            thôngTinTàiKhoảnToolStripMenuItem.Text = "Thông tin tài khoản (" + e.Acc.DisplayName + ")";
        }

        private void adminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fAdmin f = new fAdmin();
            f.loginAccount = LoginAccount;
            f.InsertFood += f_InsertFood;
            f.DeleteFood += f_DeleteFood;
            f.UpdateFood += f_UpdateFood;
            f.ShowDialog();
        }

        void f_UpdateFood(object sender, EventArgs e)
        {
            LoadFoodListByCategoryID((cbCategory.SelectedItem as Category).ID);
            if (lvBill.Tag != null)
                ShowBill((lvBill.Tag as Table).ID);
        }

        void f_DeleteFood(object sender, EventArgs e)
        {
            LoadFoodListByCategoryID((cbCategory.SelectedItem as Category).ID);
            if (lvBill.Tag != null)
                ShowBill((lvBill.Tag as Table).ID);
            LoadTable();
        }

        void f_InsertFood(object sender, EventArgs e)
        {
            LoadFoodListByCategoryID((cbCategory.SelectedItem as Category).ID);
            if (lvBill.Tag != null)
                ShowBill((lvBill.Tag as Table).ID);
        }

        private void cbCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = 0;

            ComboBox cb = sender as ComboBox;

            if (cb.SelectedItem == null)
                return;

            Category selected = cb.SelectedItem as Category;
            id = selected.ID;

            LoadFoodListByCategoryID(id);
        }

        private void btThemMon_Click(object sender, EventArgs e)
        {
            Table table = lvBill.Tag as Table;

            if (table == null)
            {
                MessageBox.Show("Hãy chọn bàn!");
                return;
            }

            int idBill = BillDAO.Instance.GetUncheckBillIDByTableID(table.ID);
            int foodID = (cbFood.SelectedItem as Food).ID;
            int count = (int)nmFoodCount.Value;

            if (idBill == -1)
            {
                BillDAO.Instance.InsertBill(table.ID);

                BillInfoDAO.Instance.InsertBillInfo(BillDAO.Instance.GetMaxIDBill(), foodID, count);

             
            }
            else
            {
                BillInfoDAO.Instance.InsertBillInfo(idBill, foodID, count);
            }
            LoadTable();
            LoadCategory();
            LoadTableListForSwitchTable(cbSwitchTable);
            LoadTableListForGroupTable(cbbGroupTable);

            ShowBill(table.ID);

        }
        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            Table table = lvBill.Tag as Table;

            int idBill = BillDAO.Instance.GetUncheckBillIDByTableID(table.ID);
            int discount = (int)nmdiscount.Value;

            double totalPrice = Convert.ToDouble(tbTotalPrice.Text.Split(',')[0]);
            double finalTotalPrice = totalPrice - (totalPrice / 100) * discount;

            if (idBill != -1)
            {
                if (MessageBox.Show(string.Format("Bạn có chắc thanh toán hóa đơn cho {0}\nTổng tiền - (Tổng tiền / 100) x Giảm giá\n=> {1} - ({1} / 100) x {2} = {3}", table.Name, totalPrice, discount, finalTotalPrice), "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    BillDAO.Instance.CheckOut(idBill, discount, (float)finalTotalPrice);
                    ShowBill(table.ID);

                    LoadTable();
                    fHoaDon f = new fHoaDon(idBill);
                    f.ShowDialog();
                }
            }
        }
        private void btnChuyenBan_Click(object sender, EventArgs e)
        {

            if (lvBill.Tag != null)
            {


                int id1 = (lvBill.Tag as Table).ID;
                int id2 = (cbSwitchTable.SelectedItem as Table).ID;
                Table table = TableDAO.Instance.FindTableFromId(id1);
                if ((table.Status.Contains("Có người") && id1 != id2))
                {
         
                    if (MessageBox.Show(string.Format("Bạn có thật sự muốn chuyển bàn {0} qua bàn {1}", (lvBill.Tag as Table).Name, (cbSwitchTable.SelectedItem as Table).Name), "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                    {
                        TableDAO.Instance.SwitchTable(id1, id2);

                        LoadTable();
                        LoadTableListForSwitchTable(cbSwitchTable);
                        LoadTableListForGroupTable(cbbGroupTable);
                        lvBill.Controls.Clear();
                    }
                }
                else
                {
                    MessageBox.Show("Vui lòng chọn bàn có người để chuyển!");
                }
            }
           
        }
        #endregion

        private void btnGopBan_Click(object sender, EventArgs e)
        {

            Table tb1 = lvBill.Tag as Table;
            Table tb2 = cbbGroupTable.SelectedItem as Table;
            int id1 = (lvBill.Tag as Table).ID;
            int id2 = (cbbGroupTable.SelectedItem as Table).ID;

            Table table = TableDAO.Instance.FindTableFromId(id1);

            if (!table.Status.Contains("Trống") && !tb2.Status.Contains("Trống"))
            {

                if (id1 != id2)
                {
                    if (MessageBox.Show(string.Format("Bạn có thật sự muốn gộp {0} với {1}?", tb1.Name, tb2.Name), "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                    {

                        Bill b1 = BillDAO.Instance.GetBillByIdTable(id1);

                        Bill b2 = BillDAO.Instance.GetBillByIdTable(id2);

                        List<BillInfo> listBillInfor1 = BillInfoDAO.Instance.GetListBillInfo(b1.ID);

                        for (int i = 0; i < listBillInfor1.Count; i++)
                        {
                            BillInfoDAO.Instance.InsertBillInfo(b2.ID, listBillInfor1[i].FoodID, listBillInfor1[i].Count);

                        }
                        DataProvider.Instance.ExecuteNonQuery("DELETE dbo.Bill WHERE id =" + b1.ID + "");
                        DataProvider.Instance.ExecuteNonQuery("UPDATE dbo.TableFood SET status = N'Trống' WHERE id= " + id1 + "");
                        DataProvider.Instance.ExecuteNonQuery("delete dbo.billinfo where idbill =" + b1.ID + "");
                        LoadTable();
                        LoadTableListForSwitchTable(cbSwitchTable);
                        LoadTableListForGroupTable(cbbGroupTable);
                        lvBill.Controls.Clear();
                    }

                }
                else
                {
                    MessageBox.Show("Vui lòng chọn 2 bàn khác nhau để gộp!");
                }
            }
            else
            {
                MessageBox.Show("Vui lòng chọn 2 bàn có người để gộp!");
            }

        }        
    }
}


