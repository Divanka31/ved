using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
namespace пз2
{
    public partial class edit_st : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList2.Visible = false;
            DetailsView1.Visible = false;
            Button9.Visible = false;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string crit;
                crit = "SELECT * FROM Q_Sale WHERE NameStation='" + DropDownList1.SelectedValue + "'";
                SqlDataSource2.SelectCommand = crit;
                GridView1.DataBind();
            }

            catch (Exception ex1)
            {
                //Вывод в мметку сообщения об ошибке(на странице расположена пустая метка)
                Label6.Text = ex1.Message;
                return;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IDDog"] = GridView1.SelectedValue;
            DropDownList2.Visible = true;
            DetailsView1.Visible = true;
            Button9.Visible = true;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            string connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("Web.mdb");
            var connection = new OleDbConnection(connStr);

            try
            {
                connection.Open();
            }
            catch (Exception ex)
            {
                Label6.Text = "❌ Ошибка подключения: " + ex.Message;
                connection.Close();
                return;
            }

            long DogovorID = Convert.ToInt32(Session["IDDog"]);

            string sqlQ = "UPDATE Sale SET IDStation = " + DropDownList2.SelectedValue +
                          " WHERE IDDogov = " + DogovorID;

            Label7.Text = sqlQ; // Для отладки

            var cmd = new OleDbCommand(sqlQ, connection);

            try
            {
                cmd.ExecuteNonQuery();
                Label6.Text = "✓ Статус изменён!";
            }
            catch (Exception ex)
            {
                Label6.Text = "❌ Ошибка: " + ex.Message;
            }
            finally
            {
                connection.Close();
            }
        }
    }
    
}