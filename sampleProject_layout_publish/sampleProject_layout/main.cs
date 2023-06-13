using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace sampleProject_layout
{
    class main
    {
        public static void AddForm(Form f, Panel panel)
        {
            panel.Controls.Clear();
            f.Dock = DockStyle.Fill;
            f.TopLevel = false;
            panel.Controls.Add(f);
            f.Show();
        }
    }
}