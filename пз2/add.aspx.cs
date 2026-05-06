using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb; 

namespace пз2
{
    public partial class add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            // 1. Обработка загрузки файла
            string myimg = "Img\\";
            string mypath = Request.PhysicalApplicationPath;
            string myfile = FileUpload1.FileName;
            string filename = mypath + myimg + myfile;

            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(filename);
            }

            // 2. Подключение к БД
            string connStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");
            var connection = new OleDbConnection(connStr);

            // 3. SQL-запрос на добавление
            string sql = "INSERT INTO Picture (Название, IDAuthor, IDType, Цена, Год, Фото) VALUES ('" +
                         TxtName.Text + "', " + LstAuthor.SelectedValue + ", " +
                         LstType.SelectedValue + ", " + TxtPrice.Text + ", " +
                         Convert.ToUInt32(TxtYear.Text) + ", 'IMG\\" + myfile + "')";

            // 4. Выполнение запроса
            connection.Open();
            var cmd = new OleDbCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
            Label7.Text = "Картина добавлена";
        }
    }
}