using MySql.Data.MySqlClient;
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
    public partial class editInventory : Form
    {
        MySqlConnection con = new MySqlConnection("database = localhost; port=3306;username=root;password=;database=pharmacy");
        MySqlCommand cmd;
        MySqlDataReader read;
        public editInventory()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            new Form1().Show();
            Visible = false;
        }

        private void editInventory_Load(object sender, EventArgs e)
        {
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            Main.dgvView("select Medicine_id as 'Medicine Id', Medicine_name as 'Medicine Name',Price, Stock_avail as 'Stock Available', ExpireDate as 'Expiration Date' from medicine where medicine_name like '" + textBox1.Text + "%'", dataGridView1);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            con.Open();
            string query = "select * from medicine where medicine_id =" + int.Parse(textBox2.Text);
            cmd = new MySqlCommand(query, con);
            read = cmd.ExecuteReader();

            if (read.Read())
            {
                textBox4.Text = read.GetString("medicine_id");
                textBox5.Text = read.GetString("medicine_name");
                textBox6.Text = read.GetString("price");
                textBox7.Text = read.GetString("stock_avail");
                dateTimePicker1.Text = read.GetString("expiredate");
            }
            else
            {
                MessageBox.Show("NO RECORD FOUND");
                textBox2.Text = "";
                textBox4.Text = "";
                textBox5.Text = "";
                textBox6.Text = "";
                textBox7.Text = "";
            }
            con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("ARE YOU SURE YOU WANT TO UPDATE THIS ITEM?", "CONFIRMATION", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.Yes)
            {
                Main.saveData("update medicine set medicine_name = '" + this.textBox5.Text + "',price= '" + this.textBox6.Text + "',stock_avail = '" + this.textBox7.Text + "',expiredate = '" + this.dateTimePicker1.Text + "'");
                MessageBox.Show("UPDATE SUCCESSFULLY");
            }
            
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("ARE YOU SURE YOU WANT TO DELETE THIS ITEM?", "CONFIRMATION", MessageBoxButtons.YesNo,MessageBoxIcon.Warning);
            if(dr == DialogResult.Yes)
            {
                Main.saveData("delete from medicine where medicine_id = '" + textBox2.Text + "'");
                MessageBox.Show("DELETE SUCCESSFULLY");
            }
        }
    }
}
