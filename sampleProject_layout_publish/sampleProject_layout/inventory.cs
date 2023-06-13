
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace sampleProject_layout
{
    public partial class inventory : Form
    {
        
        public inventory()
        {
            InitializeComponent();
        }

        private void btnEditProduct_Click(object sender, EventArgs e)
        {
            new editProduct().Show();
        }
    }
}
