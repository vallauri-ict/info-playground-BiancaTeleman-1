using Microsoft.VisualBasic;
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

namespace es11_esStoredProcedureBanche
{
    public partial class Form1 : Form
    {
        private static readonly string CONNECTION_STRING = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Classe quinta\Info\Teoria\es11-esStoredProcedureBanche\banche.mdf;Integrated Security = True; Connect Timeout = 30";

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int n = Convert.ToInt32(Interaction.InputBox("Inserisci numero"));
            using (SqlConnection con = new SqlConnection(CONNECTION_STRING))
            {
                con.Open();
                string sql = "[Procedure1]";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    SqlParameter data = new SqlParameter();
                    data.ParameterName = "numero";

                    data.Value = n;
                    data.Direction = ParameterDirection.Input;
                    data.DbType = DbType.Int32;
                    cmd.Parameters.Add(data);

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataReader reader = cmd.ExecuteReader();

                    MessageBox.Show(n.ToString());
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string com = Interaction.InputBox("Inserisci comune");
            using (SqlConnection con = new SqlConnection(CONNECTION_STRING))
            {
                con.Open();
                string sql = "[Procedure2]";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    SqlParameter data = new SqlParameter();
                    data.ParameterName = "com";

                    data.Value = com;
                    data.Direction = ParameterDirection.Input;
                    data.DbType = DbType.String;
                    cmd.Parameters.Add(data);

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataReader reader = cmd.ExecuteReader();

                    string s = "";
                    while (reader.Read())
                    {

                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            s += reader.GetValue(i) + " ";
                        }
                    }
                    MessageBox.Show(s.ToString());
                }
            }
        }
    }
}
