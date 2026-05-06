using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace пз2
{
    public partial class correct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        
        protected void Button4_Click(object sender, EventArgs e)
        {
            Label10.Text = "";
            string Str_connection = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");

            using (var connect = new OleDbConnection(Str_connection))
            {
                try { connect.Open(); }
                catch (Exception ex) { Label10.Text = "Ошибка БД: " + ex.Message; return; }

                string sqlQ = $"INSERT INTO S_user(NameU, Parol, Email, WebPage) VALUES('{TextBox3.Text}', '{TextBox6.Text}', '{TextBox4.Text}', '{TextBox5.Text}')";
                using (var cmd = new OleDbCommand(sqlQ, connect))
                {
                    try
                    {
                        cmd.ExecuteNonQuery();
                        Label10.Text = " Пользователь добавлен";
                        TextBox3.Text = ""; TextBox4.Text = ""; TextBox5.Text = ""; TextBox6.Text = "";
                    }
                    catch (Exception ex) { Label10.Text = "Ошибка: " + ex.Message; }
                }
            }
        }
    }
}