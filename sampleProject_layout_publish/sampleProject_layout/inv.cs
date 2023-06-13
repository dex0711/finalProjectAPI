using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace giatay_GUI
{
    public partial class inv : Form
    {
        public inv()
        {
            
            InitializeComponent();
        }
        private void inv_Load(object sender, EventArgs e)
        {
            Main.dgvView("select Medicine_name as 'Medicine Name', Description, Price, Stock_avail as 'Stock Available', ExpireDate as 'Expiration Date' from Medicine", dataGridView1);
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Main.dgvView("select Medicine_name as 'Medicine Name', Description, Price, Stock_avail as 'Stock Available', ExpireDate as 'Expiration Date' from Medicine where medicine_name like'" + txtSearch.Text + "%'", dataGridView1);

            if (txtSearch.Text == "")
            {
                Main.dgvView("select Medicine_name as 'Medicine Name', Description, Price, Stock_avail as 'Stock Available', ExpireDate as 'Expiration Date' from Medicine", dataGridView1);
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            new editInventory().Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            new addItem().Show();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
