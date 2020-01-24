using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace registers
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                fillClass();
        }
        public void fillClass()
        {
            string mainconn = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            string sqlquery = "select * from Class ";
            SqlDataAdapter sda = new SqlDataAdapter(sqlquery, sqlconn);
            sqlconn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Selectclass.DataSource = dt;
            Selectclass.DataTextField = "className";
            Selectclass.DataValueField = "className";
            Selectclass.DataBind();
            sqlconn.Close();
            sda.Dispose();
            //Add a default item at first position.
            Selectclass.Items.Insert(0, "Please select");

            //Set the default item as selected.
            Selectclass.Items[0].Selected = true;

            //Disable the default item.
            Selectclass.Items[0].Attributes["disabled"] = "disabled";

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkstudent() == true)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "UYARI!!!", "alert('Student Already Registered')", true);
            }
            else
            {
                string mainconn = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
                SqlConnection sqlconn = new SqlConnection(mainconn);
                sqlconn.Open();


                //string sqlquery = "select Id from Class where className= '" + Selectclass.SelectedItem.Text + "'";
                //SqlCommand showresult = new SqlCommand(sqlquery, sqlconn);

                //string actresult = showresult.ExecuteScalar().ToString();

                SqlCommand cmd = new SqlCommand("insert into Student values('" + txtstudent.Text + "','" + txtname.Text + "','" + txtsurname.Text + "','" + Selectclass.SelectedItem.Text + "')", sqlconn);
                cmd.ExecuteNonQuery();
                sqlconn.Close();
            }
            txtname.Text = null;
            txtsurname.Text = null;
            txtstudent.Text = null;
            Selectclass.Text = "Please select";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "UYARI!!!", "alert('Student Registered Success :) ')", true);
        }

        private Boolean checkstudent()
        {
            Boolean studentavailable = false;
            string mainconn = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            String myquery = "Select * from student where id='" + txtstudent.Text + "'";

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = sqlconn;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                studentavailable = true;

            }
            sqlconn.Close();

            return studentavailable;
        }
    }
}