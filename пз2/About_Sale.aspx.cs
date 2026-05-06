using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.OleDb;

namespace пз2
{
    public partial class About_Sale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Фильтр: получаем значение IDdog из сессии
                if (Session["IDdog"] != null)
                {
                    int idDogovor = Convert.ToInt32(Session["IDdog"]);

                    // Строка подключения
                    string Str_connection = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");

                    using (OleDbConnection conn = new OleDbConnection(Str_connection))
                    {
                        conn.Open();

                      
                        string sqlQ = "SELECT * FROM Q_Sale WHERE IDDogov = ?";

                        OleDbDataAdapter adapter = new OleDbDataAdapter(sqlQ, conn);
                        adapter.SelectCommand.Parameters.AddWithValue("?", idDogovor);

                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        DetailsView1.DataSource = dt;
                        DetailsView1.DataBind();
                    }
                }
            }

        }

    }
}