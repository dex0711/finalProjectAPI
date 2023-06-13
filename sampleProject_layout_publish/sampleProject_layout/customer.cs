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
    public partial class customer : Form
    {
        MySqlConnection con = new MySqlConnection("datasource = localhost; port=3306;username=root;password=;database=pharmacy");
        public customer()
        {
            InitializeComponent();
            cbxLoadBenefits();
        }

        private void customer_Load(object sender, EventArgs e)
        {

        }
        private void cbxLoadBenefits()
        {
            try
            {
                con.Open();
                MySqlCommand command = new MySqlCommand("select Medicine_name from medicine", con);
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    comboBox1.Items.Add(reader["Medicine_name"].ToString());
                }
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
