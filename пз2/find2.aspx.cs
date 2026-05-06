using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace пз2
{
    public partial class find2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(DropDownList1.SelectedValue))
                {
                    Label4.Text = "Пожалуйста, выберите автора";
                    return;
                }
                string crit = "SELECT * FROM Q_Picture_for_Sell WHERE IDAuthor = " + DropDownList1.SelectedValue;
                SqlDataSource3.SelectCommand = crit;
                GridView1.DataSource = SqlDataSource3;
                GridView1.DataBind();

                Label4.Text = "Найдено записей: " + GridView1.Rows.Count;
            }
            catch (Exception ex1)
            {
                Label4.Text = "Ошибка: " + ex1.Message;
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(DropDownList2.SelectedValue))
                {
                    Label4.Text = "Пожалуйста, выберите вид товара";
                    return;
                }
                string crit = "SELECT * FROM Q_Picture_for_Sell WHERE IDType = " + DropDownList2.SelectedValue;
                SqlDataSource3.SelectCommand = crit;
                GridView1.DataSource = SqlDataSource3;
                GridView1.DataBind();
                Label4.Text = "Найдено записей: " + GridView1.Rows.Count;
            }
            catch (Exception ex1)
            {
                Label4.Text = "Ошибка: " + ex1.Message;
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(DropDownList1.SelectedValue) || string.IsNullOrEmpty(DropDownList2.SelectedValue))
                {
                    Label4.Text = "Пожалуйста, выберите и автора, и вид товара";
                    return;
                }
                string crit = "SELECT * FROM Q_Picture_for_Sell WHERE IDAuthor = " + DropDownList1.SelectedValue
                            + " AND IDType = " + DropDownList2.SelectedValue;
                SqlDataSource3.SelectCommand = crit;
                GridView1.DataSource = SqlDataSource3;
                GridView1.DataBind();
                Label4.Text = "Найдено записей: " + GridView1.Rows.Count;
            }
            catch (Exception ex1)
            {
                Label4.Text = "Ошибка: " + ex1.Message;
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            try
            {
                string crit = "SELECT * FROM Q_Picture_for_Sell";
                SqlDataSource3.SelectCommand = crit;
                GridView1.DataSource = SqlDataSource3;
                GridView1.DataBind();
                Label4.Text = "Отображены все записи. Всего: " + GridView1.Rows.Count;
            }
            catch (Exception ex1)
            {
                Label4.Text = "Ошибка: " + ex1.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int index = GridView1.SelectedIndex;
                if (index >= 0)
                {
                    string selectedID = GridView1.DataKeys[index].Value.ToString();
                    Session["IDG"] = selectedID;  // Сохраняем в сессию
                    Response.Redirect("picture.aspx");
                }
            }
            catch (Exception ex)
            {
                Label4.Text = "Ошибка: " + ex.Message;
            }
        }
    }
   
}