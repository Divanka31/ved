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
    public partial class guest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }

        private void BindData()
        {
            string Str_connection = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");

            // Показываем ВСЕ записи из таблицы Book (той же, куда вставляем!)
            string sqlQ = "SELECT * FROM Book ORDER BY book_date DESC";

            using (OleDbConnection conn = new OleDbConnection(Str_connection))
            {
                try
                {
                    OleDbDataAdapter adapter = new OleDbDataAdapter(sqlQ, conn);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    if (dt.Rows.Count == 0)
                    {
                        Label6.Text = "Таблица пуста";
                    }
                }
                catch (Exception ex)
                {
                    Label6.Text = "Ошибка загрузки: " + ex.Message;
                }
            }
        }

      

        protected void Button4_Click(object sender, EventArgs e)
        {
            string СтрокаПодключения = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");

            string Stext = TextBox4.Text;
            string Sgest = TextBox3.Text;

            
            string sqlQ = "INSERT INTO Book (Guest, Book_page, book_date) VALUES (?, ?, ?)";

            Label7.Text = sqlQ;  // Для отладки

            using (var Подключение = new OleDbConnection(СтрокаПодключения))
            {
                using (var Команда = new OleDbCommand(sqlQ, Подключение))
                {
                    
                    Команда.Parameters.AddWithValue("@Guest", Sgest);
                    Команда.Parameters.AddWithValue("@BookPage", Stext);
                    Команда.Parameters.AddWithValue("@Date", DateTime.Now.Date);

                    try
                    {
                        Подключение.Open();
                        int rowsAffected = Команда.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Label6.Text = "Сообщение добавлено!";
                            TextBox3.Text = "";  // Очистить поля
                            TextBox4.Text = "";
                        }
                        else
                        {
                            Label6.Text = "Ошибка: не удалось добавить запись";
                        }
                    }
                    catch (Exception ex1)
                    {
                        Label6.Text = "Ошибка: " + ex1.Message;
                        // Дополнительно: покажем внутренний exception если есть
                        if (ex1.InnerException != null)
                        {
                            Label6.Text += "<br/>Детали: " + ex1.InnerException.Message;
                        }
                    }
                }
            }
        } 

    } 

}