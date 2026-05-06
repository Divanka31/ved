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
            GridView1.Visible = false;
            GridView2.Visible = false;
            DropDownList1.Visible = false;
            DropDownList2.Visible = false;
            Button9.Visible = true;
            Button10.Visible = false;
        }

        // 📅 Обработка календаря
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if (this.Label6.Text == "Ввод начальной даты")
            {
                this.TextBox3.Text = Convert.ToString(String.Format("{0:d}", this.Calendar1.SelectedDate));
                this.Label6.Text = "Ввод конечной даты";
            }
            else
            {
                this.TextBox4.Text = Convert.ToString(String.Format("{0:d}", this.Calendar1.SelectedDate));
                this.Label6.Text = "Ввод начальной даты";
            }
        }

        // 🏛️ Кнопка "Создать выставку"
        protected void Button9_Click(object sender, EventArgs e)
        {
            string СтрокаПодключения = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");
            var Подключение = new OleDbConnection(СтрокаПодключения);
            try
            {
                Подключение.Open();
            }
            catch (Exception ex1)
            {
                Label11.Text = ex1.Message;
                Подключение.Close();
                return;
            }

            string d1, d2, t, m;
            d1 = Convert.ToString(TextBox3.Text);
            d2 = Convert.ToString(TextBox4.Text);
            t = Convert.ToString(TextBox5.Text);
            m = Convert.ToString(TextBox6.Text);

            string sqlQ;
            sqlQ = "INSERT INTO EXHIBITION (Dateb, DateE,Thema,[Where]) VALUES ('" + d1 + "','" + d2 + "','" + t + "','" + m + "')";

            Label12.Text = sqlQ;
            var Команда = new OleDbCommand();
            Команда.CommandText = sqlQ;
            Команда.Connection = Подключение;
            try
            {
                Команда.ExecuteNonQuery();
                Label12.Text = "Выставка создана, выберите картины";

                GridView1.Visible = true;
                GridView2.Visible = false;
                DropDownList1.Visible = true;
                DropDownList2.Visible = true;
                Button9.Visible = false;
                Button10.Visible = true;
            }
            catch (Exception ex1)
            {
                Label11.Text = ex1.Message;
                Подключение.Close();
                return;
            }
            sqlQ = "SELECT IDexhibition FROM [EXHIBITION] ORDER BY IDexhibition DESC";
            Label12.Text = sqlQ;
            Команда.CommandText = sqlQ;
            Команда.Connection = Подключение;
            try
            {
                OleDbDataReader Чтение;
                Чтение = Команда.ExecuteReader();
                if (Чтение.Read() == true)
                {
                    var id = Чтение.GetValue(0);
                    Session["IDExh"] = id;
                    Label12.Text = Convert.ToString(id);
                }
            }
            catch (Exception ex1)
            {
                Label11.Text = ex1.Message;
                Подключение.Close();
                return;
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string crit;
                crit = "SELECT * FROM Q_Picture_For_Sell WHERE IDType= " + DropDownList1.SelectedValue;
                SqlDataSource3.SelectCommand = crit;
                GridView1.DataBind();

                GridView1.Visible = true;
                GridView2.Visible = false;
                DropDownList1.Visible = true;
                DropDownList2.Visible = true;
                Button9.Visible = false;
                Button10.Visible = true;
            }
            catch (Exception ex1)
            {
                Label11.Text = ex1.Message;
                return;
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string crit;
                crit = "SELECT * FROM Q_Picture_For_Sell WHERE IDAuthor= " + DropDownList2.SelectedValue;
                SqlDataSource3.SelectCommand = crit;
                GridView1.Visible = true;
                GridView2.Visible = false;
                DropDownList1.Visible = true;
                DropDownList2.Visible = true;
                Button9.Visible = false;
                Button10.Visible = true;
            }
            catch (Exception ex1)
            {
                Label11.Text = ex1.Message;
                return;
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string СтрокаПодключения = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");
            var Подключение = new OleDbConnection(СтрокаПодключения);
            try
            {
                Подключение.Open();
            }
            catch (Exception ex1)
            {
                Label11.Text = ex1.Message;
                Подключение.Close();
                return;
            }
            String sqlQ;
            long IDPict, IDExh;
            IDPict = Convert.ToUInt32(GridView1.SelectedValue);
            IDExh = Convert.ToUInt32(Session["IDExh"]);

            sqlQ = "INSERT INTO [Exhibition_Picture](IDpicture, IDexhibition) VALUES (" + IDPict + "," + IDExh + ")";

            Label12.Text = sqlQ;
            var Команда = new OleDbCommand();
            Команда.CommandText = sqlQ;
            Команда.Connection = Подключение;

            try
            {
                Команда.ExecuteNonQuery();
                Label12.Text = "Картина добавлена";

                GridView1.Visible = true;
                GridView2.Visible = false;
                DropDownList1.Visible = true;
                DropDownList2.Visible = true;
                Button9.Visible = false;
                Button10.Visible = true;
            }
            catch (Exception ex1)
            {
                Label11.Text = ex1.Message;
                Подключение.Close();
                return;
            }
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            long IDExh;

            IDExh = Convert.ToUInt32(Session["IDExh"]);
            string crit;
            crit = "SELECT * FROM [Q_Exhibition_Picture] WHERE IDexhibition=" + IDExh;
            SqlDataSource4.SelectCommand = crit;
            GridView2.DataBind();

            GridView1.Visible = false;
            GridView2.Visible = true;
            DropDownList1.Visible = false;
            DropDownList2.Visible = false;
            Button9.Visible = true;
            Button10.Visible = false;
        }
    } 
    }