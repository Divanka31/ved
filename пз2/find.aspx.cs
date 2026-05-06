using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace пз2
{
    public partial class find : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IDA"] = DropDownList1.SelectedValue;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IDG"] = GridView1.SelectedValue;
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            
        }
    }
}