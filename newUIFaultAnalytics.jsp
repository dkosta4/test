<%-- 
    Document   : newUIFaultAnalytics
    Created on : Jul 2017
    Author     : yashoda.k@sawridge.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tambora Video Optimizer</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <jsp:include page="../jsp/globalScriptFile.jsp"></jsp:include> 

        <!--call flow-->


        <script type="text/javascript"  src="../js/bootstrap-clockpicker.js"></script>
        <!--<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables_themeroller.css">-->
        <link rel="stylesheet" href="../css/newUIFaultAnalytics.css" >
        <link rel="stylesheet" href="../css/bootstrap-clockpicker.css" >
        <link rel="stylesheet" href="../css/bootstrap-select.css" >
    </head>
    <body>
        <div class="container">
            <!--load the header-->
            <div id="header_id"></div>
            <div class="row">
                <div class="col-sm-1 sidebarbackground" id="sidebarContent">
                </div>
                <div class="col-sm-11 " id="mainContent" style="background-color: #345D93;color:white;min-height: 922px;">
                    <div class="row mainContentRowHeight moduleHeader">
                        <div class="col-sm-6" id="pageTitle">
                            <label class="pageTitle pageTitle moduleHeaderName" id="pageTitleName"> Overview </label>
                        </div>
                        <div class="pickerContainer widget col-sm-6" id="picker"></div>
                    </div>
                    <div class="row mainContentRowHeight moduleSubHeader">
                        <div class="col-sm-12 horizontal" id="menu">
                            <ul class="currentLink">
                                <li id="ALL" value="Overview"><a class="moduleSubTab-Selected analyticActive" href="#">Overview</a></li>
                                <li id="Custom" value="Custom Report"><a class="moduleSubTab-UnSelected" href="#">Custom Report</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-sm-12 moduleContentDiv" id="customContainer">
                            <!--<center><img src='../img/gif/loading.gif' alt='processing'  style="display: none;" id="processingpicEmsSA"></center>-->
                            <!--Severe Faults Tab-->
                            <div class="panel-container" style="" id="panelCont">  
                                <!--for add parameter-->
                                <div id="divContentMain">
                                    <div id="errorMessage_div_Cust" style='margin-left: 246px;display:none;'>
                                        <h3 class="errMessageMaster"><img src='../img/icon-error-alert.png'/>
                                            No data found</h3>
                                    </div>
                                    <div id="filterDrop">
                                        <div class=" col-lg-12 pull-left" title="Filter BY" style="margin-left:53px;margin-top: 10px;color: #cdd7e5;font-family: '';font-size: 19px;font-weight: 400;">
                                            <text>Filter by</text>
                                        </div> 
                                        <div id="paramsListDiv" style="max-height:350px;">
                                            <div class="row">
                                                <div id="paramDiv" class="col-lg-12" style="margin-bottom:8px;">
                                                    <!--<div class="col-md-1"></div>-->
                                                    <div class="col-md-4" style="margin-left: 69px;">
                                                        <select  class="selectDrop" id="dropId" onchange="getParent1(this.value)" style="cursor:pointer;">
                                                            <option selected="selected">Select</option>
                                                            <option value="Fault Category">Fault Category</option>
                                                            <option value="Fault Code">Fault Code</option>
                                                            <option value="Geography">Geography</option>
                                                            <option value="Service Type">Service Type</option>
                                                            <option value="Network">Network</option>
                                                        </select> 
                                                    </div>
                                                    <div class="col-md-3" style="margin-left: -100px;display: none;" id="childSelDiv">
                                                        <select class="selectDrop" id="childSel" multiple="multiple">
                                                        </select> 
                                                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                    <a href="#" onclick="removeParameterForJSP(this)" id="cancelGlyp" style="margin-top:0px;margin-left:-127px">
                                                        <span>
                                                            <img src="../img/cancel.png" alt="remove" />
                                                        </span>
                                                    </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                    <a href="#" onclick="addParameter()" id="addGlyp"  style="margin-left:-41px;">
                                                        <span>
                                                            <img src="../img/add.png" alt="add" id="enAdd"/>
                                                            <img src="../img/add-disabled.png" alt="add" style="display: none;" id="disAdd"/>
                                                        </span>
                                                    </a>

                                                    <div class="btn-group droplistDropDown "  style="float: left;margin-left: 997px;margin-top: -45px;width: 193px;">
                                                        <lable type="button" class="dropdown-toggle" data-toggle="dropdown" style="cursor: pointer" id="favLab">
                                                            My Favourite...<span class="caret"></span>
                                                        </lable>
                                                        <ul class="dropdown-menu droplistDropDown scrollable-menu" id="favouriteDropdown" style="width: 193px;background-color: rgb(27, 50, 98);visibility: visible; overflow-y: auto; height:300px;">

                                                        </ul>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>

                                        <div id="submitButtonDiv" class="form-actions text-center">
                                            <label onclick="GenerateReport()" class="btnPrimary" style="cursor:pointer;margin-right: 868px;height: 60px;width: 217px;"><h4>Generate Report</h4></label>
                                        </div>
                                        <div class="form-actions text-center" style="margin-top: -53px;margin-left: -235px;">
                                            <div id="addToFav" class="text" style="color: #8bb8ea;font-family: 'Roboto';font-size: 18px;font-style: normal;font-weight: 400;">
                                                <p>
                                                    <span onclick="addToFav()" id="clickToFav" style="cursor:pointer;display: none;">+ Add to My Favorites</span>
                                                </p>
                                                <input id='addFav' style="color:  black;display: none;" type="text"/>
                                                <div id="savFav" class="form-actions text-center" style="margin-top: -57px;margin-left: 873px;width: 100px;height: 60px;font-size: 18px;border: medium none;background-color: rgb(139, 184, 234);font-family: 'Arial';position: absolute;display: none;" >
                                                    <div class="text"  style="top:20px;transform-origin: 106.5px 10px 0px;color: #333333;font-family: 'Arial';font-style: normal;font-weight: 400;line-height: normal;text-align: center;font-size: 18px;margin-top: 20px;cursor: pointer;">
                                                        <p>
                                                            <span onclick="addFaultFavourites()">SAVE</span>
                                                        </p>
                                                        <span>
                                                            <img src="../img/cancel.png" id="closeFav" alt="remove" style="margin-top:-34px;margin-left:125px;cursor: pointer">
                                                        </span>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--<center><img src='../img/gif/loading.gif' alt='processing'  style="display: none;" id="processingpicEmsSA"></center>-->
                                    <!--load custom chart-->
                                    <div class="tab-pane " id="totalReq1" name="div4">

                                        <div class="row" style='margin-top: 32px;margin-bottom: 50px;'>

                                            <div class="row" style="margin-bottom: 18px;margin-top: 15px;">
                                                <!--                                                <div class="col-sm-12 subhorizontal" class="currentGraph" id="dayWeekMonGraph2" style="margin-left: 20px;margin-bottom: -32px;">
                                                                                                    <ul>
                                                                                                        <li style="float: left;"><a class="currentGraph" href="#"  onclick="drawDailyGraph()" id="custdayId" style="font-size: 18px">Day</a></li>
                                                                                                        <li style="float: left;"><a href="#" id="custweekId" onclick="drawWeekGraph();" style="font-size: 18px">Week</a></li>
                                                                                                        <li style="float: left;"><a href="#" id="custmonthId" onclick="drawMonthGraph();" style="font-size: 18px">Month</a></li>
                                                                                                    </ul>
                                                                                                </div> -->
                                                <div class="btn-group droplistDropDown" style="float: right;margin-right: 58px;cursor: pointer;margin-bottom:-48px;">
                                                    <lable type="button" class="dropdown-toggle billDetail" data-toggle="dropdown">
                                                        Export to<span class="caret"></span>
                                                    </lable>
                                                    <ul class="dropdown-menu droplistDropDown" id="fileExport2" role="menu" style="min-width: 102px;background-color: #192E5D;">
                                                        <a href="#" onclick="ExportFiles('XLS')">Excel</a><br>
                                                        <a href="#" onclick="ExportFiles('CSV')">CSV</a><br>
                                                        <a href="#" onclick="ExportFiles('PDF')">PDF</a>
                                                    </ul>
                                                </div>

                                                <div class="btn-group droplistDropDown" style="float: right;margin-top: 0px;margin-right: 175px;height: 44px;width: 173px;">
                                                    <label type="button" class="dropdown-toggle" data-toggle="dropdown" style="cursor: pointer;font-weight: 400;margin-left: 20px;" id="graphTypeLabelCust">
                                                        Line Graph<span class="caret" style="margin-left: 9px;"></span>
                                                    </label>
                                                    <ul class="dropdown-menu droplistDropDown" id="graphTypeCust" role="menu" style="width: 173px;background-color: rgb(25,46,93);color: rgb(139,184,234); ">
                                                        <li><a href="#" onclick="">Line Graph</a></li>
                                                        <li><a href="#" onclick="">Area Graph</a></li>
                                                        <li><a href="#" onclick="">Bar Graph</a></li>
                                                        <li><a href="#" onclick="">Column Graph</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-sm-12"  style="height: 300px;width: 99%;" id="chart_div2">
                                            </div>

                                            <div class="row" id="div_for_table2" style="margin-left: -19px;">
                                                <div class="col-sm-12">
                                                    <table id="example2" class="display" style="table-layout: fixed;word-wrap:break-word;" width="96%" cellspacing="0">
                                                        <thead> 
                                                            <tr>
                                                                <th>Fault Category</th>
                                                                <th>Count</th>
                                                                <!--<th>Total</th>-->
                                                            </tr>
                                                        </thead>
                                                        <tbody></tbody>
                                                    </table>

                                                    <div style="display:none">    
                                                        <table id="detailsTable">
                                                            <thead > 
                                                                <tr class="tableHeader">
                                                                    <th></th>
                                                                    <th>Month</th>
                                                                    <th>Count</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody></tbody>
                                                        </table>
                                                    </div>
                                                    <div style="display:none">    
                                                        <table id="detailsTableDay">
                                                            <thead > 
                                                                <tr class="tableHeader">
                                                                    <th></th>
                                                                    <th>Day</th>
                                                                    <th>Count</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody></tbody>
                                                        </table>
                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                        <!--end of load custom chart-->
                                    </div>
                                    <!--end of add parameter-->
                                    <div id="overViewTab">
                                        <div id="errorMessage_div" style='margin-left: 246px;display:none;'>
                                            <h3 class="errMessageMaster"><img src='../img/icon-error-alert.png'/>
                                                No data found</h3>
                                        </div>
                                        <div class="tab-pane " id="totalReq" name="div4">

                                            <div class="row mainContentRowHeight" style='margin-top: 1%;'>

                                                <div class="row" style="margin-bottom: 42px;">
                                                    <!--<div class="col-sm-12 subhorizontal currentGraph" id="custlinkGraph" >-->
                                                        <div class="col-sm-12" >
                                                        <div class="col-sm-4 subhorizontal currentGraph" id="custlinkGraph">
                                                            <ul>
                                                                <li style="float: left;"><a class="currentGraph" href="#"  onclick="drawDailyGraph()" id="custdayId" style="font-size: 18px">Day</a></li>
                                                                <li style="float: left;"><a href="#" id="custweekId" onclick="drawWeekGraph();" style="font-size: 18px">Week</a></li>
                                                                <li style="float: left;"><a href="#" id="custmonthId" onclick="drawMonthGraph();" style="font-size: 18px">Month</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-sm-4"></div>
                                                        <div class="col-sm-4">
                                                            <div class="col-sm-12" style="float: right;">
                                                                <div  class="btn-group droplistDropDown" style="float: right;margin-right: 58px;cursor: pointer;margin-bottom:-48px;">
                                                                    <lable type="button" class="dropdown-toggle billDetail" data-toggle="dropdown">
                                                                        Export to <span class="caret"></span>
                                                                    </lable>
                                                                    <ul class="dropdown-menu droplistDropDown" id="fileExport" role="menu" style="min-width: 108px;background-color: #192E5D;">
                                                                       <a href="#" onclick="openCommentModalPopUP1('csv')" style="color: white;margin-left: 10px;">CSV</a><br>
                                                                    <a href="#" onclick="openCommentModalPopUP1('pdf')" style="color: white;margin-left: 10px;">PDF</a><br>
                                                                    <a href="#" onclick="openCommentModalPopUP1('doc')" style="color: white;margin-left: 10px;">Word</a><br>
                                                                    <a href="#" onclick="openCommentModalPopUP1('excel')" style="color: white;margin-left: 10px;">Excel</a>
                                                                    </ul>
                                                                </div>
                                                                <div class="btn-group droplistDropDown" style="float: right;margin-top: 0px;margin-right: 175px;height: 44px;width: 173px;">
                                                                    <label type="button" class="dropdown-toggle" data-toggle="dropdown" style="cursor: pointer;font-weight: 400;margin-left:20px;" id="graphTypeLabel">Line Graph<span class="caret" style="margin-left: 9px;"></span></label>
                                                                    <ul class="dropdown-menu droplistDropDown" id="graphType" role="menu" style="width: 173px;background-color: rgb(25,46,93);color: rgb(139,184,234); ">
                                                                        <li><a href="#" onclick="">Line Graph</a></li>
                                                                        <li><a href="#" onclick="">Area Graph</a></li>
                                                                        <!--<li><a href="#" onclick="">Bar Graph</a></li>-->
                                                                        <!--<li><a href="#" onclick="">Column Graph</a></li>-->
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                    
                                                </div>
                                                <center><img src='../img/gif/loading.gif' alt='processing'  style="display: none;" id="processingpicEmsSA"></center>
                                                <div class="col-sm-12"  style="height: 300px;width: 99%;left:8px;" id="chart_div">
                                                </div>
                                                <table id="example" class="display" width="96%" cellspacing="0" style="display: none;">
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <label id="callFlowTitle" style="display: none;margin-top: 13px;margin-left: 22px;font-size: 18px;color: #CCCCCC;"></label>
                                    <div id="mainWrapper" style="" name="div3">    
                                        <div id="mainHeaderPanelDiv" style="margin-left: auto;margin-right: auto;margin-top: 14px;" class="fixed-top">
                                            <div id="headerPanelDiv" class="fixed-top" style="background-color: rgb(70, 107, 159);"></div>
                                            <div id="sequenceDiagramWrapper" style="overflow-y: auto; position: inherit; background-color: rgb(228, 228, 228);"></div>
                                            <img id="dummyImage">
                                        </div>         
                                    </div> 
                                    <div class="modal fade" id="faultFav" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="vertical-alignment-helper">
                                            <div class="modal-dialog vertical-align-center">
                                                <div class="modal-content" style="width: 650px;background-color:#345d93; height: 70px;">
                                                    <div class="modal-header" style="border-bottom-color:#345d93; ">
                                                        <button type="button" class="close" data-dismiss="modal">
                                                            <span aria-hidden="true">&times;</span>
                                                            <span class="sr-only">Close</span>
                                                        </button>
                                                        <font class="errMessageSuggAction"><b id="errMessageSuggActionFav">You can only select a maximum of 5 checkboxes</b></font>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
            </div>
            <div id="faultCateMod" class="modal fade ">
                <div class="modal-dialog" style="width: 978px;">
                    <div class="modal-content dialogBox">
                        <div class="modal-header dialogHeader">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="ModelHeader" style="margin-top: -7px;"><b>Fault Analytics Details</b></h4>
                        </div>
                        <div class="modal-body">
                            <div class="moduleContentDiv">
                                <div  class="col-lg-12">
                                    <div class="col-lg-6">
                                        <h4 style=""><b>SELECT TIME</b></h4>
                                    </div>
                                    <div class="col-lg-6">
                                        <span class="navbar-left" style="color: black;">
                                            <select data-width="140px" class="selectpicker" data-size="5" id="select_hour" title="SELECT HOUR" onchange="webServiceForCustom();" >
                                            </select>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12" id="tableBefCallFlow">
                                        <table id="example3"  width="100%"  style="display: none;overflow-y: auto">
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group dropup droplistDropDown" style="float: left;margin-right: 1px;margin-top: 0px;">
                                <label type="button" class="dropdown-toggle" data-toggle="dropdown" style="cursor: pointer;cursor: hand">
                                    Export to<span class="caret"></span>
                                </label>
                                <ul class="dropdown-menu droplistDropDown" id="itemfileExport" role="menu" style="min-width: 139px;margin-left: -1px;margin-bottom: 0px;border-radius: 0px;background-color: #335C91;">
                                    <a href="#" onclick="Exportitemized('CSV')">CSV</a><br>
                                    <a href="#" onclick="Exportitemized('PDF')">PDF</a><br>
                                    <a href="#" onclick="Exportitemized('XLS')">Excel</a>
                                </ul>
                            </div>
                            <div style="margin-top: 14px;">
                                <label type="button" id="cancel" class="droplistDropDown" data-dismiss="modal" onclick="" style="cursor: pointer;cursor: hand">Close</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <form target="_blank" method="POST" action="" name="export">
                    <input type="hidden" name="tableData" value="" id="exportData">
                    <input type="hidden" name="filterType" value="" id="filterType">
<!--                    <input type="hidden" name="requestType" value="" id="requestTy">
                    <input type="hidden" name="requestValue" value="" id="requestValue">-->
                    <input type="hidden" name="analyticsType" value="" id="analyticType">
                    <input type="hidden" name="startDate" value="" id="sdate">
                    <input type="hidden" name="endDate" value="" id="edate">
                    <input type="hidden" name="graphImage" value="" id="graphImageURL">
                    <input type="hidden" name="comment" value="" id="comment">
                    <!--<input type="hidden" name="customReportrequest" value="" id="customReportrequest">-->
                    <input type="hidden" name="filterBy" value="" id="filterBy">
                    <input type="hidden" name="filterByvalues" value="" id="filterByvalues">
                </form>
             <!--Export comment modal-->
            <div class="modal fade" id="commentForPDFModal1"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="width: 60%" >
                    <div class="dialogBox" >
                        <div class="modal-header ">
                            <lable type="button" class="" data-dismiss="modal" aria-hidden="true" style="float: right" onclick="removeText()"><img src="../images/modal-close.png"></lable>
                            <h4 class="modal-title"><img id='imgAlert' src='../images/modal-info.png' style='margin-left: -8px;'>Please Write Your Comments</h4>
                        </div>
                        <div class="modal-body" style="text-transform: initial;">
                            <textarea placeholder="Enter Your Comments" style="background-color: #EDEDED;border: ivory;max-height: 200px; max-width: 100%;min-height: 50px;min-width: 100%;color: black"  id="co66368" ></textarea>    
                        </div>
                        <div class="modal-footer">
                            <lable data-dismiss="modal" id="commentForPDFSubmitBtn1" class="btnPrimary" type="button" style="cursor: pointer;cursor: hand;">Confirm</lable>
                        </div>
                    </div>
                </div>
            </div>
             <input type="text" value="" hidden="" id="exportType"/>
            <div class="TamFooter">&copy; Tambora System, 2017. All Rights Reserved. <a href="#">Terms of Use</a>.</div>
        </div>
    </body>
    <script src="../js/newUIFaultAnalytics.js" type="text/javascript"></script> 
    <script src="../js/loadRights.js"></script>
    <script src="../js/bootstrap-select.js"></script>
    <script src="../js/callFlow.js"></script>
    <script src="../js/bootbox.min.js"></script>
</html>
