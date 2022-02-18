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

namespace es12_compitoStoredProcedure
{
    public partial class Form1 : Form
    {
        static readonly string CONNECTION_STRING = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Utente\Desktop\info-playground-BiancaTeleman-1-master\es12-compitoStoredProcedure\scuola.mdf;Integrated Security = True; Connect Timeout = 30";
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string sql = "cercaStudenti";

            using (SqlConnection con = new SqlConnection(CONNECTION_STRING))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    SqlParameter classe = new SqlParameter();
                    classe.Value = txtClasse.Text;
                    classe.ParameterName = "classe";
                    classe.Direction = ParameterDirection.Input;
                    classe.DbType = DbType.String;
                    cmd.Parameters.Add(classe);

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
                    MessageBox.Show("Risultato cercaStudenti: " + s);
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string sql = "cercaMinStudenti";

            using (SqlConnection con = new SqlConnection(CONNECTION_STRING))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    SqlParameter classe = new SqlParameter();
                    classe.Value = txtClasse.Text;
                    classe.ParameterName = "classe";
                    classe.Direction = ParameterDirection.Input;
                    classe.DbType = DbType.String;
                    cmd.Parameters.Add(classe);

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
                    MessageBox.Show("Risultato cercaMinStudenti: " + s);
                }
            }
        }
    }
}
