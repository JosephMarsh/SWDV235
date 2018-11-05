<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Contact Me</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
    <div class="container">
        <header>
            <img src="img/integrated-circuit.png" alt="banner" id="banner" />
            <!--image file from publicdomainpictures.net-->
        </header>
        <nav>
            <ul>
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="Tools.aspx">Tools</a></li>
                <li><a href="gallery.html">Project Gallery</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="Contact.aspx">Contact Me</a></li>
            </ul>
        </nav>
        <main>
            <h1>Contact Me</h1>
            <p>
                Use the form below to send me a message. You can tell me about tools you'd like me to add, 
                complain or let me know that I'm doing a good job. 
            </p>
            <form name="contact" id="contact_form" method="post" runat="server" >
                <fieldset>
                    <fieldset>
                        <label for="firstName">First Name</label>
                        <asp:TextBox ID="firstName" placeholder="First"  runat="server"></asp:TextBox>

                        <label for="lastName">Last Name</label>
                        <asp:TextBox ID="lastName" placeholder="Last" runat="server"></asp:TextBox>
                    
                        <label for="email">Email</label>
                        <asp:TextBox ID="email" placeholder="address@place.com" runat="server"></asp:TextBox>

                        <p> 
                            <!--First name  error messages -->
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" 
                                cssclass="error_text" 
                                runat="server" 
                                ErrorMessage="First Name is Required <br/>" 
                                ControlToValidate="firstName" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <!--Last name  error messages -->
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator2" 
                                cssclass="error_text" 
                                runat="server" 
                                ErrorMessage="Last Name is Required <br/>" 
                                ControlToValidate="lastName" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <!--email address error messages -->
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator3" 
                                cssclass="error_text" 
                                runat="server" 
                                ErrorMessage="Last Name is Required <br/>" 
                                ControlToValidate="email" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <!--SQL connection error messages -->
                            <asp:Label ID="lblError" cssclass="error_text" runat="server"></asp:Label>
                        </p>
                    </fieldset>
                    <fieldset>
                        <legend>Optional</legend>
                        <!-- No Validation by design -->
                        <label for="comment">Comments:</label>
                        <asp:TextBox TextMode="MultiLine" ID="comments" Rows="3" Columns="25" runat="server" ></asp:TextBox>

                        <br />
                        <label for="newsLetter">register for news letter:</label>
                        <asp:CheckBox ID="newsLetter" CssClass="newsLetter" Checked="true" runat="server" />
                    </fieldset>
                    <br />
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /> 
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CausesValidation="false" />

                </fieldset>
            </form>
            
        </main>
        <footer>
            <div id="social">
                <table>
                    <caption>Follow Me</caption>
                    <tr>
                        <td><a href="https://www.facebook.com/joseph.marsh.1840" target="_blank"><img alt="Facebook Icon" src="icons/facebook.png" /></a></td>
                        <td><a href="https://monsterousoperandi.deviantart.com/" target="_blank"><img alt="Deviant Art Icon" src="icons/deviantart.png" /></a></td>
                        <td><a href="https://github.com/JosephMarsh" target="_blank"><img alt="Git Hub Icon" src="icons/github.png" /></a></td>
                        <td><a href="https://www.linkedin.com/in/joseph-marsh-67996173/" target="_blank"><img alt="Linkedin Icon" src="icons/linkedin.png" /></a></td>
                    </tr>
                </table>
            </div>
        </footer>
    </div><!--end container-->
</body>
</html>