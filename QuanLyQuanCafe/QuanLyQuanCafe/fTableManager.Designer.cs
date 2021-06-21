
namespace QuanLyQuanCafe
{
    partial class fTableManager
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.adminToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.thôngTinTàiKhoảnToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.thôngTinCáNhânToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.đăngXuấtToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.chứcNăngToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.thanhToánToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.thêmMónToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.panel2 = new System.Windows.Forms.Panel();
            this.lvBill = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.panel3 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.cbbGroupTable = new System.Windows.Forms.ComboBox();
            this.tbTotalPrice = new System.Windows.Forms.TextBox();
            this.cbSwitchTable = new System.Windows.Forms.ComboBox();
            this.btnChuyenBan = new System.Windows.Forms.Button();
            this.nmdiscount = new System.Windows.Forms.NumericUpDown();
            this.btnGopBan = new System.Windows.Forms.Button();
            this.btnThanhToan = new System.Windows.Forms.Button();
            this.panel4 = new System.Windows.Forms.Panel();
            this.label2 = new System.Windows.Forms.Label();
            this.nmFoodCount = new System.Windows.Forms.NumericUpDown();
            this.btThemMon = new System.Windows.Forms.Button();
            this.cbFood = new System.Windows.Forms.ComboBox();
            this.cbCategory = new System.Windows.Forms.ComboBox();
            this.flpTable = new System.Windows.Forms.FlowLayoutPanel();
            this.chuyểnBànToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gộpBànToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nmdiscount)).BeginInit();
            this.panel4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nmFoodCount)).BeginInit();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.adminToolStripMenuItem,
            this.thôngTinTàiKhoảnToolStripMenuItem,
            this.chứcNăngToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(797, 24);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // adminToolStripMenuItem
            // 
            this.adminToolStripMenuItem.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.adminToolStripMenuItem.ForeColor = System.Drawing.Color.DarkSlateGray;
            this.adminToolStripMenuItem.Name = "adminToolStripMenuItem";
            this.adminToolStripMenuItem.Size = new System.Drawing.Size(55, 20);
            this.adminToolStripMenuItem.Text = "Admin";
            this.adminToolStripMenuItem.Click += new System.EventHandler(this.adminToolStripMenuItem_Click);
            // 
            // thôngTinTàiKhoảnToolStripMenuItem
            // 
            this.thôngTinTàiKhoảnToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.thôngTinCáNhânToolStripMenuItem,
            this.đăngXuấtToolStripMenuItem});
            this.thôngTinTàiKhoảnToolStripMenuItem.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.thôngTinTàiKhoảnToolStripMenuItem.ForeColor = System.Drawing.Color.DarkSlateGray;
            this.thôngTinTàiKhoảnToolStripMenuItem.Name = "thôngTinTàiKhoảnToolStripMenuItem";
            this.thôngTinTàiKhoảnToolStripMenuItem.Size = new System.Drawing.Size(126, 20);
            this.thôngTinTàiKhoảnToolStripMenuItem.Text = "Thông tin tài khoản";
            // 
            // thôngTinCáNhânToolStripMenuItem
            // 
            this.thôngTinCáNhânToolStripMenuItem.ForeColor = System.Drawing.Color.LightSlateGray;
            this.thôngTinCáNhânToolStripMenuItem.Name = "thôngTinCáNhânToolStripMenuItem";
            this.thôngTinCáNhânToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.thôngTinCáNhânToolStripMenuItem.Text = "Thông tin cá nhân";
            this.thôngTinCáNhânToolStripMenuItem.Click += new System.EventHandler(this.thôngTinCáNhânToolStripMenuItem_Click);
            // 
            // đăngXuấtToolStripMenuItem
            // 
            this.đăngXuấtToolStripMenuItem.ForeColor = System.Drawing.Color.LightSlateGray;
            this.đăngXuấtToolStripMenuItem.Name = "đăngXuấtToolStripMenuItem";
            this.đăngXuấtToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.đăngXuấtToolStripMenuItem.Text = "Đăng xuất";
            this.đăngXuấtToolStripMenuItem.Click += new System.EventHandler(this.đăngXuấtToolStripMenuItem_Click);
            // 
            // chứcNăngToolStripMenuItem
            // 
            this.chứcNăngToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.thanhToánToolStripMenuItem,
            this.thêmMónToolStripMenuItem,
            this.chuyểnBànToolStripMenuItem,
            this.gộpBànToolStripMenuItem});
            this.chứcNăngToolStripMenuItem.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chứcNăngToolStripMenuItem.ForeColor = System.Drawing.Color.DarkSlateGray;
            this.chứcNăngToolStripMenuItem.Name = "chứcNăngToolStripMenuItem";
            this.chứcNăngToolStripMenuItem.Size = new System.Drawing.Size(81, 20);
            this.chứcNăngToolStripMenuItem.Text = "Chức năng";
            // 
            // thanhToánToolStripMenuItem
            // 
            this.thanhToánToolStripMenuItem.ForeColor = System.Drawing.Color.LightSlateGray;
            this.thanhToánToolStripMenuItem.Name = "thanhToánToolStripMenuItem";
            this.thanhToánToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.X)));
            this.thanhToánToolStripMenuItem.Size = new System.Drawing.Size(182, 22);
            this.thanhToánToolStripMenuItem.Text = "Thanh toán";
            this.thanhToánToolStripMenuItem.Click += new System.EventHandler(this.thanhToánToolStripMenuItem_Click);
            // 
            // thêmMónToolStripMenuItem
            // 
            this.thêmMónToolStripMenuItem.ForeColor = System.Drawing.Color.LightSlateGray;
            this.thêmMónToolStripMenuItem.Name = "thêmMónToolStripMenuItem";
            this.thêmMónToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.A)));
            this.thêmMónToolStripMenuItem.Size = new System.Drawing.Size(182, 22);
            this.thêmMónToolStripMenuItem.Text = "Thêm món";
            this.thêmMónToolStripMenuItem.Click += new System.EventHandler(this.thêmMónToolStripMenuItem_Click);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.lvBill);
            this.panel2.Location = new System.Drawing.Point(387, 95);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(398, 274);
            this.panel2.TabIndex = 3;
            // 
            // lvBill
            // 
            this.lvBill.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader3,
            this.columnHeader4});
            this.lvBill.GridLines = true;
            this.lvBill.HideSelection = false;
            this.lvBill.Location = new System.Drawing.Point(3, 0);
            this.lvBill.Name = "lvBill";
            this.lvBill.Size = new System.Drawing.Size(392, 268);
            this.lvBill.TabIndex = 0;
            this.lvBill.UseCompatibleStateImageBehavior = false;
            this.lvBill.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Tên món";
            this.columnHeader1.Width = 191;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "SL";
            this.columnHeader2.Width = 41;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Đơn giá";
            this.columnHeader3.Width = 73;
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Thành tiền";
            this.columnHeader4.Width = 82;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.label1);
            this.panel3.Controls.Add(this.cbbGroupTable);
            this.panel3.Controls.Add(this.tbTotalPrice);
            this.panel3.Controls.Add(this.cbSwitchTable);
            this.panel3.Controls.Add(this.btnChuyenBan);
            this.panel3.Controls.Add(this.nmdiscount);
            this.panel3.Controls.Add(this.btnGopBan);
            this.panel3.Controls.Add(this.btnThanhToan);
            this.panel3.Location = new System.Drawing.Point(387, 375);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(398, 66);
            this.panel3.TabIndex = 4;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.ForeColor = System.Drawing.Color.SaddleBrown;
            this.label1.Location = new System.Drawing.Point(209, 3);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(57, 14);
            this.label1.TabIndex = 10;
            this.label1.Text = "Giảm giá:";
            // 
            // cbbGroupTable
            // 
            this.cbbGroupTable.FormattingEnabled = true;
            this.cbbGroupTable.Location = new System.Drawing.Point(98, 3);
            this.cbbGroupTable.Name = "cbbGroupTable";
            this.cbbGroupTable.Size = new System.Drawing.Size(89, 22);
            this.cbbGroupTable.TabIndex = 9;
            // 
            // tbTotalPrice
            // 
            this.tbTotalPrice.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbTotalPrice.ForeColor = System.Drawing.Color.Red;
            this.tbTotalPrice.Location = new System.Drawing.Point(193, 45);
            this.tbTotalPrice.Name = "tbTotalPrice";
            this.tbTotalPrice.ReadOnly = true;
            this.tbTotalPrice.Size = new System.Drawing.Size(97, 21);
            this.tbTotalPrice.TabIndex = 8;
            this.tbTotalPrice.Text = "0";
            this.tbTotalPrice.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // cbSwitchTable
            // 
            this.cbSwitchTable.FormattingEnabled = true;
            this.cbSwitchTable.Location = new System.Drawing.Point(3, 3);
            this.cbSwitchTable.Name = "cbSwitchTable";
            this.cbSwitchTable.Size = new System.Drawing.Size(89, 22);
            this.cbSwitchTable.TabIndex = 7;
            // 
            // btnChuyenBan
            // 
            this.btnChuyenBan.BackColor = System.Drawing.Color.Khaki;
            this.btnChuyenBan.Location = new System.Drawing.Point(3, 32);
            this.btnChuyenBan.Name = "btnChuyenBan";
            this.btnChuyenBan.Size = new System.Drawing.Size(89, 34);
            this.btnChuyenBan.TabIndex = 6;
            this.btnChuyenBan.Text = "Chuyển bàn";
            this.btnChuyenBan.UseVisualStyleBackColor = false;
            this.btnChuyenBan.Click += new System.EventHandler(this.btnChuyenBan_Click);
            // 
            // nmdiscount
            // 
            this.nmdiscount.Location = new System.Drawing.Point(193, 20);
            this.nmdiscount.Name = "nmdiscount";
            this.nmdiscount.Size = new System.Drawing.Size(97, 20);
            this.nmdiscount.TabIndex = 5;
            this.nmdiscount.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // btnGopBan
            // 
            this.btnGopBan.BackColor = System.Drawing.Color.Khaki;
            this.btnGopBan.Location = new System.Drawing.Point(98, 32);
            this.btnGopBan.Name = "btnGopBan";
            this.btnGopBan.Size = new System.Drawing.Size(89, 34);
            this.btnGopBan.TabIndex = 4;
            this.btnGopBan.Text = "Gộp bàn";
            this.btnGopBan.UseVisualStyleBackColor = false;
            this.btnGopBan.Click += new System.EventHandler(this.btnGopBan_Click);
            // 
            // btnThanhToan
            // 
            this.btnThanhToan.BackColor = System.Drawing.Color.LightGreen;
            this.btnThanhToan.Location = new System.Drawing.Point(296, 3);
            this.btnThanhToan.Name = "btnThanhToan";
            this.btnThanhToan.Size = new System.Drawing.Size(99, 60);
            this.btnThanhToan.TabIndex = 3;
            this.btnThanhToan.Text = "Thanh toán";
            this.btnThanhToan.UseVisualStyleBackColor = false;
            this.btnThanhToan.Click += new System.EventHandler(this.btnThanhToan_Click);
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.label2);
            this.panel4.Controls.Add(this.nmFoodCount);
            this.panel4.Controls.Add(this.btThemMon);
            this.panel4.Controls.Add(this.cbFood);
            this.panel4.Controls.Add(this.cbCategory);
            this.panel4.Location = new System.Drawing.Point(387, 27);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(398, 62);
            this.panel4.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.ForeColor = System.Drawing.Color.SaddleBrown;
            this.label2.Location = new System.Drawing.Point(335, 6);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(60, 14);
            this.label2.TabIndex = 4;
            this.label2.Text = "Số lượng:";
            // 
            // nmFoodCount
            // 
            this.nmFoodCount.Location = new System.Drawing.Point(340, 23);
            this.nmFoodCount.Minimum = new decimal(new int[] {
            100,
            0,
            0,
            -2147483648});
            this.nmFoodCount.Name = "nmFoodCount";
            this.nmFoodCount.Size = new System.Drawing.Size(55, 20);
            this.nmFoodCount.TabIndex = 3;
            this.nmFoodCount.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // btThemMon
            // 
            this.btThemMon.BackColor = System.Drawing.Color.SkyBlue;
            this.btThemMon.Location = new System.Drawing.Point(223, 3);
            this.btThemMon.Name = "btThemMon";
            this.btThemMon.Size = new System.Drawing.Size(111, 50);
            this.btThemMon.TabIndex = 2;
            this.btThemMon.Text = "Thêm món";
            this.btThemMon.UseVisualStyleBackColor = false;
            this.btThemMon.Click += new System.EventHandler(this.btThemMon_Click);
            // 
            // cbFood
            // 
            this.cbFood.FormattingEnabled = true;
            this.cbFood.Location = new System.Drawing.Point(3, 31);
            this.cbFood.Name = "cbFood";
            this.cbFood.Size = new System.Drawing.Size(214, 22);
            this.cbFood.TabIndex = 1;
            // 
            // cbCategory
            // 
            this.cbCategory.FormattingEnabled = true;
            this.cbCategory.Location = new System.Drawing.Point(3, 3);
            this.cbCategory.Name = "cbCategory";
            this.cbCategory.Size = new System.Drawing.Size(214, 22);
            this.cbCategory.TabIndex = 0;
            this.cbCategory.SelectedIndexChanged += new System.EventHandler(this.cbCategory_SelectedIndexChanged);
            // 
            // flpTable
            // 
            this.flpTable.AutoScroll = true;
            this.flpTable.Location = new System.Drawing.Point(12, 30);
            this.flpTable.Name = "flpTable";
            this.flpTable.Size = new System.Drawing.Size(369, 411);
            this.flpTable.TabIndex = 6;
            // 
            // chuyểnBànToolStripMenuItem
            // 
            this.chuyểnBànToolStripMenuItem.ForeColor = System.Drawing.Color.LightSlateGray;
            this.chuyểnBànToolStripMenuItem.Name = "chuyểnBànToolStripMenuItem";
            this.chuyểnBànToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.S)));
            this.chuyểnBànToolStripMenuItem.Size = new System.Drawing.Size(182, 22);
            this.chuyểnBànToolStripMenuItem.Text = "Chuyển bàn";
            this.chuyểnBànToolStripMenuItem.Click += new System.EventHandler(this.chuyểnBànToolStripMenuItem_Click);
            // 
            // gộpBànToolStripMenuItem
            // 
            this.gộpBànToolStripMenuItem.ForeColor = System.Drawing.Color.LightSlateGray;
            this.gộpBànToolStripMenuItem.Name = "gộpBànToolStripMenuItem";
            this.gộpBànToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Z)));
            this.gộpBànToolStripMenuItem.Size = new System.Drawing.Size(182, 22);
            this.gộpBànToolStripMenuItem.Text = "Gộp bàn";
            this.gộpBànToolStripMenuItem.Click += new System.EventHandler(this.gộpBànToolStripMenuItem_Click);
            // 
            // fTableManager
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(797, 463);
            this.Controls.Add(this.flpTable);
            this.Controls.Add(this.panel4);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.menuStrip1);
            this.Font = new System.Drawing.Font("Arial", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "fTableManager";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Phần mềm quản lý quán cafe";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nmdiscount)).EndInit();
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nmFoodCount)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem adminToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem thôngTinTàiKhoảnToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem thôngTinCáNhânToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem đăngXuấtToolStripMenuItem;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.ListView lvBill;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Button btThemMon;
        private System.Windows.Forms.ComboBox cbFood;
        private System.Windows.Forms.ComboBox cbCategory;
        private System.Windows.Forms.Button btnThanhToan;
        private System.Windows.Forms.NumericUpDown nmFoodCount;
        private System.Windows.Forms.FlowLayoutPanel flpTable;
        private System.Windows.Forms.ComboBox cbSwitchTable;
        private System.Windows.Forms.Button btnChuyenBan;
        private System.Windows.Forms.NumericUpDown nmdiscount;
        private System.Windows.Forms.Button btnGopBan;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private System.Windows.Forms.TextBox tbTotalPrice;
        private System.Windows.Forms.ToolStripMenuItem chứcNăngToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem thanhToánToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem thêmMónToolStripMenuItem;
        private System.Windows.Forms.ComboBox cbbGroupTable;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ToolStripMenuItem chuyểnBànToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gộpBànToolStripMenuItem;
    }
}