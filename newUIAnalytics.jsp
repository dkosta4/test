<%-- 
    Document   : Analytics
    Created on : Jul 2017
    Author     : suneetha.d@sawridge.com
--%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Tambora Video Optimizer</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="../jsp/globalScriptFile.jsp"></jsp:include> 
        <!--<script src="../js/loadRights.js"></script>-->
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="../js/bootbox.min.js"></script>
        <link rel="stylesheet" href="../css/newUIAnalytics.css" >
    </head>
    <style>
        .multiselect-container{
            width: inherit;
        }
    </style>
    <body>
        <div>
            <iframe id="my_iframe_export" name="my_iframe_export" style="display:none;"></iframe>
        </div>
        <div class="container">
            <div id="header_id"></div>

            <div class="row">
                <div class="col-sm-1 sidebarbackground" id="sidebarContent" style="height: 100%">
                </div>
                <div class="col-sm-11" id="mainContent" style="background-color: #345D93;color:white;min-height: 922px;padding-left: 15px">
                    <div class="row mainContentRowHeight moduleHeader">
                        <div class="col-sm-6">
                            <label class="pageTitle moduleHeaderName"> Analytics </label>
                        </div>
                        <div class="pickerContainer widget col-sm-6"></div>
                    </div>

                    <div class="row mainContentRowHeight moduleSubHeader">
                        <div class="col-sm-11 horizontal" id="menu">
                            <ul class="currentLink">
                                <li id="ALL" value="ALL"  onclick="changeFiltertype('AL');"><a class="moduleSubTab-UnSelected" href="#">Overview</a></li>
                                <li id="NET-WRK" value="NET-WRK" onclick="changeFiltertype('NET-WRK');"><a class="moduleSubTab-UnSelected" href="#">Network</a></li>
                                <li id="GEO-GRPY" value="GEO-GRPY" onclick="changeFiltertype('GEO-GRPY');"><a class="moduleSubTab-UnSelected" href="#">Geography</a></li>
                                <li id="SER-TYP" value="SER-TYP" onclick="changeFiltertype('SER-TYP');"><a class="moduleSubTab-UnSelected" href="#">Service Type</a></li>
                                <li id="CUS-REP" value="CUS-REP" onclick="changeFiltertype('CUS-REP');"><a class="moduleSubTab-UnSelected" href="#">Custom Report</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-11 moduleContentDiv" style="">
                            <div id="tab-container" class="tab-container">
                                <ul class='etabs'>
                                    <li class='tab' id="totalReq_li" style="margin-right:2%;" onclick="changeTabs('totalReq_li')" selected="selected">
                                        <a  href="#totalReq" class="dataSpaceBox" >
                                            <div >
                                                <label class="dataSpaceLabel">
                                                    Total request
                                                </label>

                                                <div class="dataSpaceValue" id="totReqId">

                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class='tab' id="successReq_li" style="margin-right:2%;" onclick="changeTabs('successReq_li')">
                                        <a  href="#successReq"  class="dataSpaceBox">
                                            <div class="dataSpaceBox">
                                                <label class="dataSpaceLabel">
                                                    % Success
                                                </label>
                                                <div class="dataSpaceValue" id="totSuccessId">
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class='tab' id="avgBit_li" style="margin-right:2%;" onclick="changeTabs('avgBit_li')">
                                        <a  href="#avgBit" class="dataSpaceBox" >
                                            <div class="dataSpaceBox">
                                                <label class="dataSpaceLabel">
                                                    Data volume
                                                </label>
                                                <div class="dataSpaceValue" id="dataVolId">
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class='tab' id="QOS_li" style="margin-right:2%;" onclick="changeTabs('QOS_li')">
                                        <a  href="#QOS" class="dataSpaceBox" >
                                            <div class="dataSpaceBox">
                                                <label class="dataSpaceLabel">
                                                    Revenue
                                                </label>
                                                <div class="dataSpaceValue" id="revenueId" style="margin-left: 3.3%; height: 50px; border: medium none; width : 250px">
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul> 
                                <!--Severe Faults Tab-->
                                <div class="panel-container" style="">  
                                    <div class="tab-pane " id="totalReq" style="height: 2px;">
                                        <div class="row mainContentRowHeight" style='margin-top: 2%;'>
                                            <div class="col-sm-4 subhorizontal">
                                            </div>
                                            <div class="col-sm-4 horizontal">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane active" id="successReq"  >
                                        <div class="row mainContentRowHeight" style='margin-top: 2%;'>
                                            <div class="col-sm-4 subhorizontal">
                                            </div>
                                            <div class="col-sm-4 horizontal">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane " id="avgBit" >
                                        <div class="row mainContentRowHeight" style='margin-top: 2%;'>
                                            <div class="col-sm-4 subhorizontal">
                                            </div>
                                            <div class="col-sm-4 horizontal">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane " id="QOS"  >
                                        <div class="row mainContentRowHeight" style='margin-top: 2%;'>
                                            <div class="col-sm-4 subhorizontal">
                                            </div>
                                            <div class="col-sm-4 horizontal">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8 subhorizontal" id="linkGraph">
                                            <ul style="">
                                                <li style="float: left"><a class="currentGraph" href="#"  onclick="drawDailyGraph()" id="dayId" style="font-size: 18px">Day</a></li>
                                                <li style="float: left"><a href="#" id="weekId" onclick="drawWeekGraph();" style="font-size: 18px">Week</a></li>
                                                <li style="float: left"><a href="#" id="monthId" onclick="drawMonthGraph();" style="font-size: 18px">Month</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="droplistDropDown" style="background-color: #244264;width: 139px;margin-left: 41px;">
                                                <div type="button" class="dropdown-toggle billDetail" data-toggle="dropdown" id="overIdLable" style="cursor: pointer;margin-left: 5px;"> 
                                                    Area Graph<span class="caret" style="margin-left: 14px;"></span></div>
                                                <ul class="dropdown-menu droplistDropDown" role="menu" id="overGraphType" style="margin-left: 57px;min-width: 138px;margin-top: 0px;background-color: #192E5D;padding: 0px;">
                                                    <li><a href="#" id="areaId" value="Area" style="color: white;width: 124px;">Area Graph</a></li>
                                                    <li><a href="#" id="lineId" value="Line" style="color: white;width: 124px;">Line Graph</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="droplistDropDown" style="width: 119px;background-color: #244264;">
                                                <lable type="button" class="dropdown-toggle billDetail" data-toggle="dropdown" style="cursor: pointer;">
                                                    Export to<span class="caret" style="margin-left: 8px;"></span>
                                                </lable>
                                                <ul class="dropdown-menu droplistDropDown" id="fileExport" role="menu" style="margin-left: 16px;min-width: 117px;margin-top: 0px;background-color: #192E5D;">
                                                    <a href="#" onclick="openCommentModalPopUP1('csv')" style="color: white;margin-left: 23px;">CSV</a><br>
                                                    <a href="#" onclick="openCommentModalPopUP1('pdf')" style="color: white;margin-left: 23px;">PDF</a><br>
                                                    <a href="#" onclick="openCommentModalPopUP1('doc')" style="color: white;margin-left: 23px;">Word</a><br>
                                                    <a href="#" onclick="openCommentModalPopUP1('excel')" style="color: white;margin-left: 23px;">Excel</a>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12"  style="height: 300px;" id="chart_div"></div>
                                    </div>
                                    <label type="button" style="float: left;margin-top: 16px;" onmouseenter="call();" class="btnPrimary" data-dismiss="modal" id="btn">Plot Graph</label>
                                    <div class="row tablemargin">
                                        <div class="col-sm-12">
                                            <table id="example" class="display" width="100%" cellspacing="0" >

                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="myModalAnalytics" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="vertical-alignment-helper">
                                    <div class="modal-dialog vertical-align-center">
                                        <div class="modal-content" style="width: 650px;background-color:#345d93; height: 120px;">
                                            <div class="modal-header" style="border-bottom-color:#345d93; ">
                                                <button type="button" class="close" data-dismiss="modal">
                                                    <span aria-hidden="true">&times;</span>
                                                    <span class="sr-only">Close</span>
                                                </button>
                                                <img src="../img/icon-error-alert.png" alt=""/>
                                                <font class="errMessageMaster"><b id="errMessageMasterAnalytics">checkboxes select validation</b></font><br>
                                                <font class="errMessageSuggAction"><b id="errMessageSuggActionAnalytics" style="margin-left:55px;">You can only select a maximum of 5 checkboxes</b></font>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--for add parameter-->
                            <div id="filter-container" style="display: none">
                                <div class="row">
                                    <div class="col-xs-9 col-sm-9 col-md-9 dataSpaceLabel" id="radioDivId">
                                        <input type="radio" style="height:20px;width:20px;" name="radio" value="1" id="reportIdTot" checked > Total request &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="radio" value="2" style="height:20px;width:20px;" id="reportIdSucc"> % Success &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="radio" style="height:20px;width:20px;"value="3" id="reportIdDatavol"> Data Volume  &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="radio"style="height:20px;width:20px;" value="4" id="reportIdRev"> Revenue 
                                    </div>
                                    <!--dislay favourite-->
                                    <div class="col-xs-2 col-md-2 col-sm-2" style="margin-top: 53px;">
                                        <div class="droplistDropDown" style="float: left;margin-top: -45px;cursor: pointer;cursor: hand;width: 193px;">
                                            <lable type="button" class="dropdown-toggle billDetail" data-toggle="dropdown" id="favLab">
                                                My Favourite...<span class="caret"></span>
                                            </lable>
                                            <ul class="dropdown-menu droplistDropDown" id="favouriteDropdown" style="width: 193px;background-color: rgb(27, 50, 98);visibility: visible; overflow-y: auto; height:300px;margin-left: 15px;margin-top: -4px">
                                            </ul>
                                        </div> 
                                    </div>
                                    <!--end of display favourite-->
                                </div>
                                <div class="row"></div>
                                <div class="custRptContainer">
                                    <div class="labelFilterBy" style="padding-top:20px">
                                        <text>Filter by :</text>
                                    </div> 
                                    <div id="paramsListDiv" style="max-height:250px;">
                                        <div class="row">
                                            <div id="paramDiv" class="col-lg-12" style="margin-top:15px">
                                                <div class="col-md-3">
                                                    <select class="dropSelect" id="dropId" onchange="getParent1(this.value);">
                                                        <option value="Select" selected="selected">Select</option>
                                                        <option value="Geography">Geography</option>
                                                        <option value="Service Type">Service Type</option>
                                                        <option value="Network">Network</option>
                                                        <option value="MSISDN">MSISDN</option>
                                                    </select> 
                                                </div>

                                                <div class="col-md-3" style="display: none;" id="childSelDiv">
                                                    <select class="dropButton" id="childSel" disabled="disabled" multiple="multiple" >
                                                    </select>
                                                </div>
                                                <!--                                            <span>      </span>-->

                                                <div class="col-md-3" style="display: none;" id="msdJspId">
                                                    <input size='10' style="color: black; width: 300px;height:35px;border-radius: 3px;" type="text" placeholder="MSISDN ID" name="msISDNID" id="msdId" maxlength="15"/>
                                                </div>
                                                <div class="col-lg-3"> 
                                                    <div class="col-lg-2" style="" id="removeID"> 
                                                        <a href="#" onclick="removeParameterForJSP(this)" style="margin-top:0px;">
                                                            <span style="" id="cancelGlyp">
                                                                <img src="../img/cancel.png" alt="remove" />
                                                            </span>
                                                        </a>
                                                    </div>
                                                    <div class="col-lg-1" style="" id="plusAl"> 
                                                        <a href="#" onclick="addParameter()" id="addGlyp" >
                                                            <span>
                                                                <img src="../img/add.png" alt="Add" id="enAdd"/>
                                                                <img src="../img/add-disabled.png" alt="add" style="display: none;" id="disAdd"/>
                                                            </span>
                                                        </a>
                                                    </div> 
                                                </div> 
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 11px;" id="genId">
                                        <div id="submitButtonDiv" class="col-md-3 generateReport" style="padding: 20px;cursor:pointer;">
                                            <div class="text btnPrimary btnGenerateReport" >
                                                <span onclick="generateReport();">Generate Report</span>
                                            </div>
                                        </div>
                                        <div class="col-md-3" style="padding-left: 0px;margin-top: 40px;">
                                            <div id="addToFav" class="text addFavClass" >
                                                <span onclick="addToFav()" id="clickToFav"  style="cursor: pointer;display:none;">+ Add to My Favourites</span>
                                                <span id="wrongMsisd"  style="margin-left: -168px;"></span>
                                                <!--                                            <div id="addDivText" style="width: 40%;margin-left: 8px;">
                                                                                                <input id='addFav' style="color: black;display: none;" type="text" maxlength="20" placeholder="Maximum 20 characters"/>
                                                                                            </div>-->
                                            </div>
                                        </div>
                                        <!--                                    <div class="col-md-3" style="margin-top: 72px;">
                                                                                <div id="savFav" class="" style="margin-top: -52px;width: 150px;position: absolute;display: none;" >
                                                                                    <div class="text"  style="color: #333333;background-color: rgb(139, 184, 234);cursor: pointer;padding: 21px;">
                                                                                        <span onclick="saveFav()"><font style="margin-left: 33px;font-size: 18px;">SAVE</font></span>
                                                                                    </div>
                                                                                    <img src="../img/cancel.png" id="closeFav" alt="remove" style="margin-top: -87px; margin-left: 163px;cursor: pointer">
                                                                                </div>
                                                                            </div>-->
                                    </div>
                                </div>
                            </div>        
                            <div id="custom-container">
                                <div style="clear:both;"></div>
                                <div class="row" style="height: 15px;"></div>
                                <div class="row">
                                    <div class="col-sm-12 subhorizontal currentGraph" id="custlinkGraph" style="display: none;">
                                        <div class="col-sm-4">
                                            <ul>
                                                <li style="float: left;"><a class="currentGraph" href="#"  onclick="drawDailyGraph()" id="custdayId" style="font-size: 18px">Day</a></li>
                                                <li style="float: left;"><a href="#" id="custweekId" onclick="drawWeekGraph();" style="font-size: 18px">Week</a></li>
                                                <li style="float: left;"><a href="#" id="custmonthId" onclick="drawMonthGraph();" style="font-size: 18px">Month</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4"></div>
                                        <div class="col-sm-4" style="float:right;display: none;" id="cus_drop">
                                            <div class="col-sm-12" style="float: right;">
                                                <div class="droplistDropDown subhorizontal" style="float: left;margin-left:0px;margin-right:0px;margin-bottom: 2px;cursor: pointer; min-width: 163px;" id="graphId">
                                                    <lable type="button" class="dropdown-toggle billDetail" data-toggle="dropdown" id="graphTypeLabel" style="cursor: pointer;">
                                                        Line Graph<span class="caret"></span>
                                                    </lable>
                                                    <ul class="dropdown-menu droplistDropDown" id="graphType" role="menu" style="min-width: 162px;margin-left: 15px;margin-top: -1px;background-color: rgb(25,46,93);color: rgb(139,184,234) ">
                                                        <li id ="Line"><a href="#" style="color:white;margin-left: -40px;">Line Graph</a></li>
                                                        <li id ="Area"><a href="#" style="color:white;margin-left: -36px;">Area Graph</a></li>
                                                        <li id ="Column"><a href="#" style="color:white;margin-left: -12px;">Column Graph</a></li>
                                                    </ul>
                                                </div>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                <div class="btn-group droplistDropDown" style="margin-right: 0px;">
                                                    <lable type="button" class="dropdown-toggle billDetail" data-toggle="dropdown" style="cursor: pointer;">
                                                        Export to<span class="caret" style="margin-left: 8px;"></span>
                                                    </lable>
                                                    <ul class="dropdown-menu droplistDropDown" id="fileExport" role="menu" style="min-width: 109px;margin-left: -1px;background-color: rgb(25,46,93);color: rgb(139,184,234);">
                                                        <a href="#" style="padding-left: 11px;color:white;" onclick="openCommentModalPopUP1('csv')">CSV</a><br>
                                                        <a href="#"  style="margin-top: -26px;padding-left: 11px;color:white;" onclick="openCommentModalPopUP1('pdf')">PDF</a><br>
                                                        <a href="#"  style="margin-top: -26px;padding-left: 11px;color:white;" onclick="openCommentModalPopUP1('doc')">Word</a><br>
                                                        <a href="#"  style="margin-top: -26px;padding-left: 11px;color:white;" onclick="openCommentModalPopUP1('excel')">Excel</a>
                                                    </ul>
                                                </div>
                                            </div>


                                        </div>

                                    </div>

                                </div>
                                <div class="row" style="height: 15px;"></div>
                                <center><img src='../img/gif/loading.gif' alt='processing'  style="display: none;" id="processingpicEmsSA"></center>
                                <div class="row" id="tableId">
                                    <div class="col-sm-12"  style="height: 400px;" id="cust_chart_div"></div>
                                    <div class="col-sm-12" style="padding-right: 31px;">
                                        <table id="exampleCust" class="display" width="100%" cellspacing="0">

                                        </table>
                                    </div>
                                </div>

                                <!--div popup start-->

                                <div id="addFav_modal" class="modal fade">
                                    <div class="modal-dialog" style="">
                                        <div class="modal-content dialogBox">
                                            <div class="dialogHeader" style="border:0px; border-bottom: 1px solid #CDD7E5"> 
                                                <lable type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="clearText();"><img src="../images/modal-close.png"></lable>
                                                <h4 class="modal-title" id="ModelHeader"><b>Add to My Favourites</b></h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="row" style="margin-top: 15px;">
                                                            <div class="col-lg-4" style="">
                                                                <label class="dialogGeneralLabel">Add Favourite Name</label>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <input type="text" id="addFav" class="inpueTextstyle" placeholder="Maximum 20 characters" maxlength="20"/><br>
                                                                <div class="row">
                                                                    <img src="../img/icon-error-alert.png" alt="" class="alertErrMsgImage" style="display:none;" id="imgId"/><h6 id="errormg_fav" class="alertErrMsg"></h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dialogFooterWithButtons" style="height : 80px">
                                                <!--<div style="margin-top: 14px;">-->
                                                <lable type="button" class="btnPrimary" onclick="saveCustFav();" style="cursor: pointer;float: right;height: 40px;text-align: center;" title="save">Save</lable>
                                                <lable type="button" id="cancel" class="btnPrimary" data-dismiss="modal" onclick="clearText();" style="cursor: pointer;float: right;margin-top: 11px;text-align: center;height:40px" title="cancel">Cancel</lable>
                                                <!--</div>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--div popup end-->

                                <!--end of add parameter-->
                            </div>
                            <div id="temp-container" class="tab-container moduleHeaderName" style="display: none;text-align: center;vertical-align: middle;padding: 75px;">
                            </div>
                        </div>
                        <div id="noAccess" class="moduleHeaderName tab-container" style="display: none;text-align: center;vertical-align: middle;padding: 75px;">
                            User not authorized to access. Please contact administrator.
                        </div>
                    </div>
                </div>
                <form target="_blank" method="POST" action="" name="export">
                    <input type="hidden" name="tableData" value="" id="exportData">
                    <input type="hidden" name="filterType" value="" id="filterType">
                    <input type="hidden" name="requestType" value="" id="requestTy">
                    <input type="hidden" name="requestValue" value="" id="requestValue">
                    <input type="hidden" name="analyticsType" value="" id="analyticType">
                    <input type="hidden" name="startDate" value="" id="sdate">
                    <input type="hidden" name="endDate" value="" id="edate">
                    <input type="hidden" name="graphImage" value="" id="graphImageURL">
                    <input type="hidden" name="comment" value="" id="comment">
                    <!--<input type="hidden" name="customReportrequest" value="" id="customReportrequest">-->
                    <input type="hidden" name="filterBy" value="" id="filterBy">
                    <input type="hidden" name="filterByvalues" value="" id="filterByvalues">
                </form>
            </div>
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
            <div id="e77o7" class="modal fade">
                <div class="modal-dialog" style="opacity: 1; display: block; transform: perspective(800px) translateX(0px) scaleX(1) scaleY(1) rotateZ(0deg) translateY(0px);">
                    <div class="modal-content" style='width: 500px;height: 218px;background-color: #31578c;color: #cdd7e5;font-size: 18px;line-height: 24px;'>
                        <div class="dialogHeader">
                            <lable type="button" class="" data-dismiss="modal" aria-hidden="true" style="float: right"><img src="../images/modal-close.png"></lable>
                            <h4 class="modal-title" id="Analyticerror_heading" style="font-size: 21px;"><b></b></h4>
                        </div>
                        <div class="modal-body" style="border-top: 1px dotted #3489C2;">
                            <div class="row">
                                <span class="errorIma43"></span><div class="col-lg-12" style="margin-left: 41px;margin-top: -34px;"><p id="setanalyticErorMeassage"></p></div>  
                            </div>
                        </div>
                        <div class="">
                            <lable type="button" id="65_ok" class="btnPrimary" data-dismiss="modal" onclick="" style="cursor: pointer;cursor: hand;float: right;height: 48px;margin-top: 28px;" title="ok">Ok</lable>
                        </div>
                    </div>
                </div>
            </div>
            <input type="text" value="" hidden="" id="exportType"/>
            <div class="TamFooter">&copy; Tambora System, 2017. All Rights Reserved.</div>
        </div>
        <div class="modal fade" id="myModalFav" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
    </body>
    <script src="../js/newUIAnalytics.js" type="text/javascript"></script> 

</html>
