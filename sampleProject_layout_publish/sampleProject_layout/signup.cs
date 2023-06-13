using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace sampleProject_layout
{
    public partial class signup : Form
    {
        public signup()
        {
            InitializeComponent();
        }

        private void fName_Enter(object sender, EventArgs e)
        {
            if(tbxFname.Text == "FIRSTNAME")
            {
                tbxFname.Text = "";
                tbxFname.ForeColor = Color.Black;
            }
        }

        private void fName_Leave(object sender, EventArgs e)
        {
            if(tbxFname.Text == "")
            {
                tbxFname.Text = "FIRSTNAME";
                tbxFname.ForeColor = Color.Silver;
            }
        }

        private void lName_Enter(object sender, EventArgs e)
        {
            if (tbxLname.Text == "LASTNAME")
            {
                tbxLname.Text = "";
                tbxLname.ForeColor = Color.Black;
            }
        }

        private void lName_Leave(object sender, EventArgs e)
        {
            if (tbxLname.Text == "")
            {
                tbxLname.Text = "LASTNAME";
                tbxLname.ForeColor = Color.Silver;
            }
        }

        private void address_Enter(object sender, EventArgs e)
        {
            if (tbxContact.Text == "CONTACT NO")
            {
                tbxContact.Text = "";
                tbxContact.ForeColor = Color.Black;
            }
        }

        private void address_Leave(object sender, EventArgs e)
        {
            if (tbxContact.Text == "")
            {
                tbxContact.Text = "CONTACT NO";
                tbxContact.ForeColor = Color.Silver;
            }
        }

        private void username_Enter(object sender, EventArgs e)
        {
            if (tbxUsername.Text == "USERNAME")
            {
                tbxUsername.Text = "";
                tbxUsername.ForeColor = Color.Black;
            }
        }

        private void username_Leave(object sender, EventArgs e)
        {
            if (tbxUsername.Text == "")
            {
                tbxUsername.Text = "USERNAME";
                tbxUsername.ForeColor = Color.Silver;
            }
        }

        private void password_Enter(object sender, EventArgs e)
        {
            if (tbxPassword.Text == "PASSWORD")
            {
                tbxPassword.Text = "";
                tbxPassword.ForeColor = Color.Black;
            }
        }

        private void password_Leave(object sender, EventArgs e)
        {
            if (tbxPassword.Text == "")
            {
                tbxPassword.Text = "PASSWORD";
                tbxPassword.ForeColor = Color.Silver;
            }
        }

        private void btnSignup_Click(object sender, EventArgs e)
        {
           
        }

        private void label2_Click(object sender, EventArgs e)
        {
            new signin().Show();
            Visible = false;
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnMinimize_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void showPassword_Click(object sender, EventArgs e)
        {
            tbxPassword.UseSystemPasswordChar = false;
            hidePassword.Visible = true;
            showPassword.Visible = false;
        }

        private void hidePassword_Click(object sender, EventArgs e)
        {
            tbxPassword.UseSystemPasswordChar = true;
            showPassword.Visible = true;
            hidePassword.Visible = false;
        }

        private void tbxContact_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);
        }
    }
}
