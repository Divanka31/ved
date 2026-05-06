using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace пз2
{
    public partial class picture : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IDG"] != null)
                {
                    string idGood = Session["IDG"].ToString();
                    SqlDataSource1.SelectCommand = "SELECT * FROM [Q_Picture_for_Sell] WHERE IDGood = " + idGood;
                    DetailsView1.DataBind();
                }
            }
        }
    }
}