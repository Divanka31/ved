using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace пз2
{
    public partial class edit_pic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DetailsView1.Visible = false;
            Button13.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;
            Label11.Visible = false;
            FileUpload1.Visible = false;
            TextBox3.Visible = false;
            TextBox4.Visible = false;
            TextBox5.Visible = false;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            try
            {
                string crit;
                crit = "SELECT * FROM Q_Picture_for_Sell WHERE IDType= " + DropDownList2.SelectedValue;
                SqlDataSource3.SelectCommand = crit;
                GridView1.DataBind();
            }
            catch (Exception ex1)
            {
                Label7.Text = ex1.Message;
                return;
            }
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            try
            {
                string crit;
                crit = "SELECT * FROM Q_Picture_for_Sell WHERE IDAuthor= " + DropDownList1.SelectedValue;
                SqlDataSource3.SelectCommand = crit;
                GridView1.DataBind();
            }
            catch (Exception ex1)
            {
                Label7.Text = ex1.Message;
                return;
            }
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            try
            {
                string crit, crit1;
                crit1 = "IDAuthor= " + DropDownList1.SelectedValue + "AND IDType= " + DropDownList2.SelectedValue;
                crit = "SELECT * FROM Q_Picture_for_Sell WHERE " + crit1;
                SqlDataSource3.SelectCommand = crit;
                GridView1.DataBind();
            }
            catch (Exception ex1)
            {
                Label7.Text = ex1.Message;

                return;
            }
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            try
            {
                string crit;
                crit = "SELECT * FROM Q_Picture_for_Sell ";
                SqlDataSource3.SelectCommand = crit;
                GridView1.DataBind();
            }
            catch (Exception ex1)
            {
                Label6.Text = ex1.Message;

                return;
            }
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            string mypath, myfile, filename, myimg;
            myimg = "IMG\\";
            mypath = Request.PhysicalApplicationPath;
            myfile = FileUpload1.FileName;
            filename = mypath + myimg + myfile;
            Label7.Text = filename;

            if (FileUpload1.HasFile == true)
            {
                FileUpload1.SaveAs(filename);
            }
            string СтрочкаПодключения = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");
            var Подключение = new OleDbConnection(СтрочкаПодключения);
            try
            {
                Подключение.Open();
            }
            catch (Exception ex1)
            {
                Label8.Text = ex1.Message;
                Подключение.Close();
                return;
            }
            string s1, s2, sqlQ;
            s1 = "INSERT INTO Picture (Название, IDAuthor, IDType, Цена, Год, Фото) VALUES (";
            s2 = "'" + TextBox5.Text + "'," + DropDownList1.SelectedValue + "," + DropDownList2.SelectedValue + "," + TextBox3.Text + "," + Convert.ToInt32(TextBox4.Text) + ",'IMG\\" + myfile + "')";
            sqlQ = s1 + s2;
            Label8.Text = sqlQ;
            var Команда = new OleDbCommand();
            Команда.CommandText = sqlQ;
            Команда.Connection = Подключение;
            try
            {
                Команда.ExecuteNonQuery();
                Label8.Text = "Картина добавлена";
            }
            catch (Exception ex1)
            {
                Label8.Text = ex1.Message;
                Подключение.Close();
                return;
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IDGood"] = GridView1.SelectedValue;
            DetailsView1.Visible = true;
            Button13.Visible = true;
            Label8.Visible = true;
            Label9.Visible = true;
            Label10.Visible = true;
            Label11.Visible = true;
            FileUpload1.Visible = true;
            TextBox3.Visible = true;
            TextBox4.Visible = true;
            TextBox5.Visible = true;
            Button9.Visible = false;
            Button10.Visible = false;
            Button11.Visible = false;
            Button12.Visible = false;
            GridView1.Visible = false;
        }

      
    }
}