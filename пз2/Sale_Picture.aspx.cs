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
    public partial class Sale_Picture : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                try
                {
                    if (!IsPostBack)
                    {
                        BindGridView();
                    }
                }
                catch (Exception ex)
                {
                   
                    System.Diagnostics.Debug.WriteLine($"ОШИБКА: {ex.Message}\n{ex.StackTrace}");

                    
                }
            }
        }

        private void BindGridView()
        {
            string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");
            string sqlQ = "SELECT IDGood, Название, Типтовара, Автор FROM Picture";

            using (var conn = new OleDbConnection(connectionString))
            {
                using (var adapter = new OleDbDataAdapter(sqlQ, conn))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {


            if (GridView1.SelectedDataKey != null && GridView1.SelectedDataKey.Value != null)
            {
                Session["IDGood"] = GridView1.SelectedDataKey.Value.ToString();
            }
            else
            {
                Label14.Text = " Не удалось получить ID картины";
                return;
            }

            GridViewRow Row = GridView1.SelectedRow;
            Label11.Text = Row.Cells[2].Text;
            Label12.Text = Row.Cells[3].Text;
            Label13.Text = Row.Cells[4].Text;
            Label14.Text = Row.Cells[5].Text;
            Image1.ImageUrl = Row.Cells[8].Text;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            long IDU = 0;
            long IDG = 0;

            // Получаем ID из сессии
            if (Session["IDU"] != null)
                long.TryParse(Session["IDU"].ToString(), out IDU);

            if (Session["IDGood"] != null)
            {
                string rawVal = Session["IDGood"].ToString().Trim();
                if (rawVal == "&nbsp;" || rawVal == "") rawVal = "0";
                long.TryParse(rawVal, out IDG);
            }

            if (IDU == 0)
            {
                Label14.Text = "Необходимо зарегистрироваться";
                return;
            }

            string connectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");

            try
            {
                using (OleDbConnection conn = new OleDbConnection(connectionString))
                {
                    conn.Open();

                    // Вставка записи
                    string sqlQ = "INSERT INTO Sale (IDGood, iduser) VALUES (?, ?)";
                    using (OleDbCommand cmd = new OleDbCommand(sqlQ, conn))
                    {
                        cmd.Parameters.AddWithValue("?", IDG);
                        cmd.Parameters.AddWithValue("?", IDU);
                        cmd.ExecuteNonQuery();
                    }

                    // Получение последнего ID
                    sqlQ = "SELECT TOP 1 IDDogov FROM Sale WHERE iduser = ? ORDER BY IDDogov DESC";
                    using (OleDbCommand cmd = new OleDbCommand(sqlQ, conn))
                    {
                        cmd.Parameters.AddWithValue("?", IDU);
                        object result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            Session["IDdog"] = Convert.ToInt32(result);
                            Label14.Text = " Продано";

                            // Закрываем reader перед редиректом
                            Response.Redirect("About_Sale.aspx");
                        }
                    }
                } // using автоматически закроет соединение
            }
            catch (Exception ex)
            {
                Label14.Text = "Ошибка: " + ex.Message;
            }
        }

    }
}
