using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        ///Trigger method for poccessing user comments, account creation and mebership
        ///enrollment into website news letter
        
        //declare variables 
        int customerID = 0;
        string errorMessag = "";

        if (Page.IsValid)
        {
            //check to see if user exists and store the results
            customerID = getUserID(email.Text, ref errorMessag);

            //if not Add them
            if (customerID == 0)
            {
                addUser(ref errorMessag);
                //get the new cutomer's ID
                customerID = getUserID(email.Text, ref errorMessag);
            }

            //add comment if applicable
            if (comments.Text != "")
            {
                addComment(customerID, ref errorMessag);
            }

            //if no errors logged report success
            if (errorMessag == "")
            {
                errorMessag = "Success!";
            }

            //display errors if any.
            lblError.Text = errorMessag;
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        firstName.Text = "";
        lastName.Text = "";
        email.Text = "";
        comments.Text = "";
        newsLetter.Checked = true;
        lblError.Text = "";
    }

    public void addUser(ref string error)
    {
        ///This method accepts an error string passed by reference 
        ///Its perpose is to add a new user to the database by way of 
        ///a stored procedure
        ///
        // Declare objects
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        // Initialize connection
        conn = new SqlConnection(
                "Server=localhost\\sqldev01;Database=project1;User Id=projectAdmin; Password=Pa$$w0rd;");
        // Create command
        comm = new SqlCommand(
           "EXECUTE SP_Add_New_User @first,@last,@email,@isCurrent", conn);

        // Add parameter
        comm.Parameters.Add("@first", System.Data.SqlDbType.Text);
        comm.Parameters["@first"].Value = firstName.Text;
        comm.Parameters.Add("@last", System.Data.SqlDbType.Text);
        comm.Parameters["@last"].Value = lastName.Text;
        comm.Parameters.Add("@email", System.Data.SqlDbType.Text);
        comm.Parameters["@email"].Value = email.Text;
        comm.Parameters.Add("@isCurrent", System.Data.SqlDbType.Bit);
        comm.Parameters["@isCurrent"].Value = Convert.ToInt32(newsLetter.Checked);//should produce 1 if true 0 if false.

        try
        {
            // Open the connection
            conn.Open();
            // Execute the command
            reader = comm.ExecuteReader();

            // Close the reader and the connection
            reader.Close();
        }
        catch (SqlException e)
        {
            //display error message
            error = "source: " + e.Source;
            error += "\n" + "Number: " + e.Number.ToString();
            error += "\n" + "Message: " + e.Message;
            error += "\n" + "Class: " + e.Class.ToString();
            error += "\n" + "Procedure: " + e.Procedure.ToString();
            error += "\n" + "Line Number: " + e.LineNumber.ToString();
            error += "\n" + "Server: " + e.Server.ToString();
        }
        finally
        {
            //close the connection
            conn.Close();
        }
    }

    public void addComment(int customerID, ref string error)
    {
        ///This method accepts an error string passed by reference 
        ///Its perpose is to add a new user to the database by way of 
        ///a stored procedure
        ///
        // Declare objects
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        // Initialize connection
        conn = new SqlConnection(
                "Server=localhost\\sqldev01;Database=project1;User Id=projectAdmin; Password=Pa$$w0rd;");
        // Create command
        comm = new SqlCommand(
           "EXECUTE SP_Add_Comment @customerID, @customerComment", conn);

        // Add parameter
        comm.Parameters.Add("@customerID", System.Data.SqlDbType.Int);
        comm.Parameters["@customerID"].Value = customerID;
        comm.Parameters.Add("@customerComment", System.Data.SqlDbType.Text);
        comm.Parameters["@customerComment"].Value = comments.Text;

        try
        {
            // Open the connection
            conn.Open();
            // Execute the command
            reader = comm.ExecuteReader();

            // Close the reader and the connection
            reader.Close();
        }
        catch (SqlException e)
        {
            //display error message
            error += "source: " + e.Source;
            error += "\n" + "Number: " + e.Number.ToString();
            error += "\n" + "Message: " + e.Message;
            error += "\n" + "Class: " + e.Class.ToString();
            error += "\n" + "Procedure: " + e.Procedure.ToString();
            error += "\n" + "Line Number: " + e.LineNumber.ToString();
            error += "\n" + "Server: " + e.Server.ToString();
        }
        finally
        {
            //close the connection
            conn.Close();
        }
    }


    public int getUserID(string emailAddress, ref string error )
    {
        ///This method accecpts an emall address String and uses an SQL connection to a  
        ///stored procedure (SP_Get_User_ID) 
        ///returns a user ID as INT and accepts a string for error passed as reference
        ///returns 0 if no user is found.

        //declare variables 
        int userID = 0;

        //declare objects
        SqlConnection conn;
        SqlCommand comm;

        //Initialize connection
        conn = new SqlConnection(
        "Server=localhost\\sqldev01;Database=project1;User Id=projectAdmin; Password=Pa$$w0rd;");

        //create Command
        comm = new SqlCommand(
            "EXECUTE SP_Get_User_ID @email" , conn);

        //add parameters
        comm.Parameters.Add("@email", System.Data.SqlDbType.Text);
        comm.Parameters["@email"].Value = email.Text;

        try
        {
            //open connection
            conn.Open();

            //retrun value
            userID = (Int32)comm.ExecuteScalar();

        }
        catch(SqlException e)
        {
            //display error message
            error = "source: " + e.Source;
            error += "\n" + "Number: " + e.Number.ToString();
            error += "\n" + "Message: " + e.Message;
            error += "\n" + "Class: " + e.Class.ToString();
            error += "\n" + "Procedure: " + e.Procedure.ToString();
            error += "\n" + "Line Number: " + e.LineNumber.ToString();
            error += "\n" + "Server: " + e.Server.ToString();
        }
        catch(NullReferenceException e)
        {
            //if the serch retuns null set user ID to 0
            userID = 0;
        }
        finally
        {
            //close the connection
            conn.Close();
        }
        return userID;
    }
}