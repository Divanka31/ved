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

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string crit;
                // Формируем запрос с фильтром по типу
                crit = "SELECT * FROM Q_picture_Sell WHERE IDType = " + DropDownList2.SelectedValue;

                SqlDataSource3.SelectCommand = crit;
                GridView1.DataBind();

                Label10.Text = "Фильтр по типу применён";
            }
            catch (Exception ex)
            {
                Label10.Text = "Ошибка: " + ex.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string crit;
                // Формируем запрос с фильтром по автору
                crit = "SELECT * FROM Q_picture_Sell WHERE IDAuthor = " + DropDownList1.SelectedValue;

                SqlDataSource3.SelectCommand = crit;
                GridView1.DataBind();

                Label10.Text = "Фильтр по автору применён";
            }
            catch (Exception ex)
            {
                Label10.Text = "Ошибка: " + ex.Message;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                string crit, crit1;
                // Формируем комбинированный фильтр
                crit1 = "IDAuthor = " + DropDownList1.SelectedValue +
                        " AND IDType = " + DropDownList2.SelectedValue;

                crit = "SELECT * FROM Q_picture_Sell WHERE " + crit1;

                SqlDataSource3.SelectCommand = crit;
                GridView1.DataBind();

                Label10.Text = "Комбинированный фильтр применён";
            }
            catch (Exception ex)
            {
                Label10.Text = "Ошибка: " + ex.Message;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                string crit;
                // Показываем все картины без фильтра
                crit = "SELECT * FROM Q_picture_Sell";

                SqlDataSource3.SelectCommand = crit;
                GridView1.DataBind();

                Label10.Text = "Фильтры сброшены";
            }
            catch (Exception ex)
            {
                Label10.Text = "Ошибка: " + ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                // Сохраняем ID выбранной картины в сессию
                Session["IDGood"] = GridView1.SelectedValue;

                // Здесь можно добавить вывод информации о выбранной картине
                Label3.Text = "✓ Выбрана картина ID: " + GridView1.SelectedValue.ToString();
            }
            catch (Exception ex)
            {
                Label3.Text = "❌ Ошибка выбора: " + ex.Message;
            }
        }

        // Метод загрузки деталей картины
        private void LoadPictureDetails(int idGood)
        {
            try
            {
                string connStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");
                using (OleDbConnection conn = new OleDbConnection(connStr))
                {
                    conn.Open();
                    string sql = "SELECT * FROM Q_picture_Sell WHERE IDGood = " + idGood;
                    OleDbCommand cmd = new OleDbCommand(sql, conn);
                    OleDbDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblID.Text = reader["IDGood"].ToString();
                        lblTitle.Text = reader["Название"].ToString();
                        lblAuthor.Text = reader["Автор"].ToString(); // или "Фамилия"
                        lblType.Text = reader["Типтовара"].ToString();
                        lblPrice.Text = reader["Цена"].ToString();
                        lblSold.Text = reader["Продано"].ToString();

                        // Если есть изображение
                        if (reader["Фото"] != DBNull.Value)
                        {
                            // imgPicture.ImageUrl = reader["Фото"].ToString();
                        }
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                Label3.Text = "Ошибка загрузки данных: " + ex.Message;
            }
        }

        // Метод загрузки деталей картины
        private void LoadPictureDetails(long id)
        {
            string connStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("Web.mdb");

            using (var connection = new OleDbConnection(connStr))
            {
                connection.Open();

                string sql = "SELECT * FROM Q_picture_Sell WHERE IDGood = " + id;
                var cmd = new OleDbCommand(sql, connection);

                using (var reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        lblID.Text = reader["IDGood"].ToString();
                        lblTitle.Text = reader["Название"].ToString();
                        lblAuthor.Text = reader["Автор"].ToString();
                        lblType.Text = reader["Типтовара"].ToString();
                        lblPrice.Text = reader["Цена"].ToString();
                        lblSold.Text = reader["Продано"].ToString();

                        // Отображение изображения
                        string imgPath = reader["Фото"].ToString();
                        imgPicture.ImageUrl = imgPath;
                    }
                }
            }
        }
    }
}