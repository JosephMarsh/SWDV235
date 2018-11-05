﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tools.aspx.cs" Inherits="Tools" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Tools</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />


    <!--Jquery UI old-->
    <!--<script type="text/javascript" src="scripts/notWrittenByMe/jquery.js"></script>
    <script type="text/javascript" src="scripts/notWrittenByMe/jquery-ui.js"></script>-->
    <!--Jquery UI new-->
    <script src="jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
    <script src="jquery-ui-1.12.1.custom/jquery-ui.js"></script>


    <link rel="stylesheet" href="jquery-ui-1.12.1.custom/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="css\style.css" />
    
    <style>
    table {
        border: 1px solid black;
        border-collapse: collapse;
        margin-bottom: 1em;
    }
    td, th {
        border: 1px solid black;
        padding: .2em .5em .2em .5em;
        text-align: left;
    }
    </style>
    <script>
        

    </script>
    <!--Ship Builder tool-->
    <script src="scripts/shipBuilder.js"></script>
    <!--HP and SP calc tool-->
    <script src="scripts/solarianSpHpCalc.js"></script>
</head>
<body>
    <div class="container">
        <header>
            <img src="img/lunette-dobservation-.png" alt="observation logo" id="banner" />
            <!--image file from publicdomainpictures.net-->
        </header>
        <nav>
            <div class="div-border">
                <ul>
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="Tools.aspx">Tools</a></li>
                <li><a href="gallery.html">Project Gallery</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="Contact.aspx">Contact Me</a></li>
                </ul>
            </div>
        </nav>
        <main>
            <div class="fillControler">
                <div id="tabsCtrl">
                    <ul>
                        <li><a href="#tab1">SP HP Calculator</a></li>
                        <li><a href="#tab2">Starship Tool</a></li>
                    </ul>
                    <h1 style="margin-left: .5em;">The Starfinder Tool box</h1>
                    <p style="margin-left: .5em;">
                        This Site is currently a work in progress but will feature a variety or
                        tools to help you in your Starfinder games.  Its an ambitious goal so I
                        don’t expect to finish or have everything implemented in-time for the
                        end of the five week course but I should have several useful tools
                        completed that use the power of java script and the versatility of
                        web design to bring my Ideas to life.
                    </p>
                    <br />
                    <div id="tab1" class="tab">

                        <div class="tool" id="sp_Hp_calc">
                            <h2>Starfinder HP and SP calculator</h2>
                            <p>
                                This tool is used to quickly calculate
                                the HP and SP for any class in Starfinder
                            </p>
                            <h5>Update:</h5>
                            <p>
                                This tool is now usefull for all core classes
                            </p>
                            <form name="Solarian_SP_HP_Calc">
                                <fieldset>
                                    <legend>Inputs</legend>
                                    <label for="level">Charactor Level: </label>
                                    <input type="text" id="level" placeholder=" 1 -> 20" />
                                    <label for="conMod">Con Mod: </label>
                                    <input type="text" id="conMod" placeholder=" -2 -> 5" />
                                    <label for="raceHp">Race HP: </label>
                                    <input type="text" id="raceHp" placeholder=" 2 -> 7" />
                                    <label for="class_select">Select Class</label>
                                    <select name="class_select" id="class_select">
                                        <option value="7">Solarian</option>
                                        <option value="6">Envoy</option>
                                        <option value="6">Mechanic</option>
                                        <option value="6">Mystic</option>
                                        <option value="6">Operative</option>
                                        <option value="7">Soldier</option>
                                        <option value="5">Technomancer</option>
                                    </select>
                                    <p id="error-tab1" style="color:red; font-size:1em; border-left:1.5em;"></p>
                                </fieldset>
                                <fieldset>
                                    <legend>Totals</legend>
                                    <label for="sp">Stamina Points: </label>
                                    <input type="text" id="sp" disabled />
                                    <label for="hp">Hit Points: </label>
                                    <input type="text" id="hp" disabled />
                                </fieldset><br>
                                <label>&nbsp;</label>
                                <input onclick="processEntries();" type="button" class="ui-button ui-corner-all ui-widget"
                                       id="calculate" value="Calculate SP + HP" />
                                <label>&nbsp;</label>
                                <input type="button" class="ui-button ui-corner-all ui-widget"
                                       id="clear" value="Clear Entries" /><br>
                            </form><!--end Solarian_SP_HP_Calc form-->
                        </div><!--end sp_Hp_calc"-->

                    </div><!--end Tab 1-->
                    <div id="tab2" class="tab" style="height: auto;">
                        <div class="tool2" id="ship_Bulder">
                            <div class="tool2">
                                <h2> Starship Building Tool</h2>
                                <p class="tool2">
                                    This is a tool that is a work in progress.  I plan on creating
                                    a table of inputs where you can track the build point cost as
                                    well as the power consumption of each piece of ship equipment
                                    for easy budgeting when creating or upgrading a ship in Starfinder.
                                    It will feature an easy drop down menu for selecting your reactor
                                    and a second progress bar to visually track your remaining
                                    power assets.
                                </p>
                                <p class="tool2">
                                    Right now, its still a usfull widget.
                                </p>
                                <br />
                                <form name="starship_Building_Tool" class="tool2">
                                    <fieldset id="ship_Status" class="tool2">
                                        <legend class="tool2">Status</legend>

                                        <legend class="tool2">
                                            Build Points:
                                            <span id="bpDisplay" class="tool2 error_text"></span>
                                        </legend>
                                        <!--Build point Progress Bar-->
                                        <div id="buildPointProgress" class="ui-progressbar-value ui-corner-left ui-widget-header tool2">
                                            <!--myProgress-->
                                            <div id="buildPointBar" class="tool2 ui-progressbar-value ui-corner-left ui-widget-header">0</div><!--myBar-->
                                        </div>
                                        <legend class="tool2">
                                            Power Core:
                                            <span id="pcDisplay" class="tool2 error_text"></span>
                                        </legend>
                                        <!--Build point Progress Bar-->
                                        <div id="powerPointProgress" class="ui-progressbar-value ui-corner-left ui-widget-header tool2">
                                            <!--myProgress-->
                                            <div id="powerPointBar" class="tool2 ui-progressbar-value ui-corner-left ui-widget-header">0</div><!--myBar-->
                                        </div>

                                    </fieldset>

                                    <fieldset id="field_step1" class="tool2">
                                        <legend class="tool2">Inputs</legend>
                                        <label class="tool2" for="tier">Ship Tier</label>
                                        <input class="tool2" type="text" id="tier" placeholder="1/4 -> 20" />
                                        <label class="tool2" for="spentPoints">Spent BP</label>
                                        <input class="tool2" type="text" id="spentPoints" disabled />
                                        <label class="tool2" for="powerCore">Power Core</label>
                                        <select id="powerCore_Select" class="tool2" name="powerCore">
                                            <optgroup label="Tiny Ships">
                                                <option value="1">Micron Light 50 (4BP)</option>
                                                <option value="2">Micron Heavy 70 (6BP)</option>
                                                <option value="3">Micron Ultra 80 (8BP)</option>
                                                <option value="4">Arcus Light 75 (7BP)</option>
                                                <option value="5">Pulse Brown 90 (9BP)</option>
                                                <option value="6">Pulse Black 120 (12BP)</option>
                                                <option value="7">Pulse White 140 (14BP)</option>
                                                <option value="8">Pulse Gray 100 (10BP)</option>
                                                <option value="9">Arcus Heavy 130 (13BP)</option>
                                                <option value="10">Pulse Green 150 (15BP)</option>
                                                <option value="11">Pulse Red 175 (17BP)</option>
                                                <option value="12">Pulse Blue 200 (20BP)</option>
                                            </optgroup>
                                            <optgroup label="Small Ships">
                                                <option value="4">Arcus Light 75 (7BP)</option>
                                                <option value="5">Pulse Brown 90 (9BP)</option>
                                                <option value="6">Pulse Black 120 (12BP)</option>
                                                <option value="7">Pulse White 140 (14BP)</option>
                                                <option value="8">Pulse Gray 100 (10BP)</option>
                                                <option value="9">Arcus Heavy 130 (13BP)</option>
                                                <option value="10">Pulse Green 150 (15BP)</option>
                                                <option value="11">Pulse Red 175 (17BP)</option>
                                                <option value="12">Pulse Blue 200 (20BP)</option>
                                                <option value="13">Pulse Blue 200 (20BP)</option>
                                                <option value="14">Pulse Blue 200 (20BP)</option>
                                                <option value="15">Pulse Blue 200 (20BP)</option>
                                                <option value="16">Pulse Blue 200 (20BP)</option>
                                            </optgroup>
                                            <optgroup label="Medium Ship">
                                                <option value="8">Pulse Gray 100 (10BP)</option>
                                                <option value="9">Arcus Heavy 130 (13BP)</option>
                                                <option value="10">Pulse Green 150 (15BP)</option>
                                                <option value="11">Pulse Red 175 (17BP)</option>
                                                <option value="12">Pulse Blue 200 (20BP)</option>
                                                <option value="16">Pulse Prismatic (30BP)</option>
                                            </optgroup>
                                        </select>
                                    </fieldset>
                                </form><!--end starship_Building_Tool-->
                                <p>
                                    <button onclick=" shipUpdate(); return false;" class="ui-button ui-corner-all ui-widget tool2">Update</button>
                                    <button onclick=" newRow(); return false;" class="ui-button ui-corner-all ui-widget tool2">Add Part</button>
                                </p>
                                <fieldset>
                                    <legend>Ship Parts and Eqipment List</legend>
                                    <table id="myTable" class="tool2">
                                        <thead>
                                            <!--row 1-->
                                            <tr>
                                                <th class="tool2">Part Name</th>
                                                <th class="tool2">BP Cost</th>
                                                <th class="tool2">PC Cost</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!--row 2-->
                                            <tr>
                                                <td class="tool2"><input type="text" id="part1" class="tool2 tool2TableInput" /></td>
                                                <td class="tool2"><input type="text" id="bp1" class="tool2 tool2Number tool2TableInput spentBP" /></td>
                                                <td class="tool2"><input type="text" id="pc1" class="tool2 tool2Number tool2TableInput spentCP" /></td>
                                            </tr>
                                            <!--Row 3-->
                                            <tr>
                                                <td class="tool2"><input type="text" id="part2" class="tool2 tool2TableInput" /></td>
                                                <td class="tool2"><input type="text" id="bp2" class="tool2 tool2Number tool2TableInput spentBP" /></td>
                                                <td class="tool2"><input type="text" id="pc1" class="tool2 tool2Number tool2TableInput spentCP" /></td>
                                            </tr>
                                            <!--row 4-->
                                            <tr>
                                                <td class="tool2"><input type="text" id="part3" class="tool2 tool2TableInput" /></td>
                                                <td class="tool2"><input type="text" id="bp3" class="tool2 tool2Number tool2TableInput spentBP" /></td>
                                                <td class="tool2"><input type="text" id="pc1" class="tool2 tool2Number tool2TableInput spentCP" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </fieldset>
                            </div>
                        </div><!--End ship_Bulder-->
                    </div><!--end tab2-->
                </div><!--end tabsCtrl-->
            </div><!--end fill Controller-->

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