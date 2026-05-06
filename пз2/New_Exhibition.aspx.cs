using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace пз2
{
    public partial class New_Exhibition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ⚠️ Важно: код выполняется только при первой загрузке страницы
            if (!IsPostBack)
            {
                GridView1.Visible = false;
                GridView2.Visible = false;
                DropDownList1.Visible = false;
                DropDownList2.Visible = false;
                Button4.Visible = true;   // "Создать выставку"
                Button5.Visible = false; // "Просмотр картин"
            }
        }

        // 📅 Обработка календаря
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if (this.Label.Text == "Ввод начальной даты")
            {
                this.TextBox3.Text = this.Calendar1.SelectedDate.ToString("dd.MM.yyyy");
                this.Label.Text = "Ввод конечной даты";
            }
            else
            {
                this.TextBox4.Text = this.Calendar1.SelectedDate.ToString("dd.MM.yyyy");
                this.Label.Text = "Ввод начальной даты";
            }
        }

        // 🏛️ Кнопка "Создать выставку"
        protected void Button4_Click(object sender, EventArgs e)
        {
            // Используем Jet для .mdb (как в методичке). Если база .accdb, замените на ACE.OLEDB.12.0
            string connStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");

            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                try
                {
                    conn.Open();

                    string sql = "INSERT INTO EXHIBITION (Dateb, DateE, Thema, [Where]) VALUES ('" +
                                 TextBox3.Text + "', '" + TextBox4.Text + "', '" +
                                 TextBox5.Text + "', '" + TextBox6.Text + "')";

                    OleDbCommand cmd = new OleDbCommand(sql, conn);
                    cmd.ExecuteNonQuery();

                    // Получаем ID новой выставки
                    cmd.CommandText = "SELECT IDexhibition FROM EXHIBITION ORDER BY IDexhibition DESC";
                    OleDbDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["IDExh"] = reader.GetValue(0);
                    }
                    reader.Close();

                    Label10.Text = "✓ Выставка создана! ID: " + Session["IDExh"];

                    // Переключаем видимость для выбора картин
                    GridView1.Visible = true;
                    DropDownList1.Visible = true;
                    DropDownList2.Visible = true;
                    Button4.Visible = false;
                    Button5.Visible = true;
                }
                catch (Exception ex)
                {
                    Label11.Text = "❌ Ошибка создания: " + ex.Message;
                }
            }
        }

        // 🔽 Фильтр по типу (Технике создания)
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string crit = "SELECT * FROM Q_Picture_For_Sell WHERE IDType = " + DropDownList1.SelectedValue;
                SqlDataSource3.SelectCommand = crit;
                GridView1.DataBind();

                // Оставляем интерфейс в состоянии "после создания выставки"
                GridView1.Visible = true;
                DropDownList1.Visible = true;
                DropDownList2.Visible = true;
                Button4.Visible = false;
                Button5.Visible = true;
            }
            catch (Exception ex)
            {
                Label11.Text = "Ошибка фильтра: " + ex.Message;
            }
        }

        // 🔽 Фильтр по автору
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string crit = "SELECT * FROM Q_Picture_For_Sell WHERE IDAuthor = " + DropDownList2.SelectedValue;
                SqlDataSource3.SelectCommand = crit;
                GridView1.DataBind(); // ️ В вашем коде этой строки не было!

                GridView1.Visible = true;
                DropDownList1.Visible = true;
                DropDownList2.Visible = true;
                Button4.Visible = false;
                Button5.Visible = true;
            }
            catch (Exception ex)
            {
                Label11.Text = "Ошибка фильтра: " + ex.Message;
            }
        }

        // 🖼️ Выбор картины на выставку (клик по "Выбор")
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");

            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                try
                {
                    conn.Open();
                    long IDPict = Convert.ToInt64(GridView1.SelectedValue);
                    long IDExh = Convert.ToInt64(Session["IDExh"]);

                    // ️ ВНИМАНИЕ: Проверьте имя поля в вашей БД! 
                    // В методичке: IDexhibition. У вас в ошибке было: IDexhibitor. 
                    // Если в таблице Exhibition_Picture поле называется IDexhibitor, замените ниже.
                    string sql = "INSERT INTO Exhibition_Picture (IDpicture, IDexhibition) VALUES (" +
                                 IDPict + ", " + IDExh + ")";

                    OleDbCommand cmd = new OleDbCommand(sql, conn);
                    cmd.ExecuteNonQuery();

                    Label10.Text = "✓ Картина (ID: " + IDPict + ") добавлена на выставку!";
                }
                catch (Exception ex)
                {
                    Label11.Text = "❌ Ошибка добавления: " + ex.Message;
                }
            }
        }

        // 👁️ Кнопка "Просмотр картин"
        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["IDExh"] == null)
                {
                    Label11.Text = "Сначала создайте выставку!";
                    return;
                }

                long IDExh = Convert.ToInt64(Session["IDExh"]);

                // Фильтр картин на выставке
                string crit = "SELECT * FROM Q_Exhibition_Picture WHERE IDexhibition = " + IDExh;

                SqlDataSource4.SelectCommand = crit;
                GridView2.DataBind();

                // Переключаем видимость (скрываем выбор, показываем результат)
                GridView1.Visible = false;
                GridView2.Visible = true;
                DropDownList1.Visible = false;
                DropDownList2.Visible = false;
                Button4.Visible = true;
                Button5.Visible = false;
            }
            catch (Exception ex)
            {
                Label11.Text = "Ошибка просмотра: " + ex.Message;
            }
        }
    } 
    }