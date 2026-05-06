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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Suser;
            long IDU;
            IDU = Convert.ToInt32(Session["IDU"]); //код пользователя
            Suser = Convert.ToString(Session["SUser"]);// имя пользователя

            if (IDU != 0)
            {
                Button1.Visible = false;//кнопка регистрация
                Button2.Visible = false;//кнопка выход
                Button3.Visible = true;//кнопка выход
                Label2.Visible = false;//метка имя
                Label3.Visible = false;//метка пароль
                TextBox1.Visible = false;//поле имя
                TextBox2.Visible = false;//поле пароль
                Label1.Text = "Привет " + Session["SUser"];
            }
            else
            {
                Button1.Visible = true;//кнопка регистрация
                Button2.Visible = true;//кнопка вход
                Button3.Visible = false;//кнопка выход
                Label2.Visible = true;//метка имя
                Label3.Visible = true;//метка пароль
                TextBox1.Visible = true;//поле имя
                TextBox2.Visible = true;//поле пароль
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("find.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("news.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("picture.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("find2.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string СтрокаПодключения = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");
            var Подключение = new OleDbConnection(СтрокаПодключения);
            try
            {
                //Открытие подключения
                Подключение.Open();
            }
            catch (Exception ex1)
            {
                //Вывод в метку сообщения об ошибке
                Label4.Text = ex1.Message;
                Подключение.Close();
                return;
            }

            string sparol, slogin;
            sparol = Convert.ToString(TextBox2.Text);
            slogin = Convert.ToString(TextBox1.Text);

            string sqlQ = "SELECT * FROM S_user WHERE NameU='" + slogin + "' AND Parol='" + sparol + "'";
            //вывод запроса в метку(только во время отладки программы)
            Label5.Text = sqlQ;

            var Команда = new OleDbCommand();
            Команда.CommandText = sqlQ;
            Команда.Connection = Подключение;
            try
            {
                //выполнение команды sql
                OleDbDataReader Чтение;
                // while
                // DateReader=Команда.ExecuteReader;
                // bool rr;
                Чтение = Команда.ExecuteReader();
                // rr = Чтение.Read;
                if (Чтение.Read() == true)
                {
                    var id = Чтение.GetValue(0);
                    Session["IDU"] = id;
                    Session["SUser"] = TextBox1.Text;
                    //или Session["SUser"] =Чтение.GetValue(1);
                    Button1.Visible = false;//кнопка регистрация
                    Button2.Visible = false;//кнопка вход
                    Button3.Visible = true;//кнопка выход
                    Label2.Visible = false;//метка имя
                    Label3.Visible = false;//метка пароль
                    TextBox1.Visible = false;//поле имя
                    TextBox2.Visible = false;//поле пароль
                    Label1.Text = "Привет " + Session["SUser"];
                }
                else
                {
                    Label1.Text = "пароль не верен";
                    Button1.Visible = true;//кнопка регистрация
                    Button2.Visible = true;//кнопка вход
                    Button3.Visible = false;//кнопка выход
                    Label2.Visible = true;//метка имя
                    Label3.Visible = true;//метка пароль
                    TextBox1.Visible = true;//поле имя
                    TextBox2.Visible = true;//поле пароль
                }
            }
            catch (Exception ex1)
            {
                //Вывод в мметку сообщения об ошибке
                Label4.Text = ex1.Message;
                Подключение.Close();
                return;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            {
               
                Session.Clear();
                Response.Redirect(Request.RawUrl);

            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("guest.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("correct.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sale_Picture.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("correct.aspx");
        }
    }
}