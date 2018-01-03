<%-- 
    Document   : Dashboard
    Created on : Jul 3, 2017, 6:24:02 PM
    Author     : mithunk@sawridge.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Tambora Video Optimizer</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="../jsp/globalScriptFile.jsp"></jsp:include> 
        <link rel="stylesheet" href="../css/newUIDashboard.css">
    </head>
    <body>
        <div class="container-fluid" >
            <!--load the header-->
            <div id="header_id"></div>
            <div class="row" style="height: 100%">
                <div  class="col-sm-1 sidebarbackground" id="sidebarContent" style="height: 100%;position: relative">
                </div>
                <div class="col-sm-11" id="mainContent" style="background-color: #345D93;color:white;min-height: 922px;padding-left: 15px;">
                    <div class="row mainContentRowHeight moduleHeader">
                        <div class="col-sm-10">
                            <label class="pageTitle moduleHeaderName"> Dashboard </label>
                        </div>
                        <div class="btn-group" id ="" style="margin-right: 10px;">
                            <label type="button" id="reportDurationValue" class="dropdown-toggle TamDropDownMaster" data-toggle="dropdown" style="min-width: 176px;">
                                Export to
                            </label>
                            <div class="dropdown-menu TamDropDownMenu" id="reportDuration" role="menu" name="reportDuration" style="min-width: 176px;margin-left: 0px;margin-top: -6px;height: 170px;border-radius: 0px">
                                <a href="#" onclick="updateSummaryData('currentday');">CURRENT DAY</a>
                                <a href="#" onclick="updateSummaryData('previousday');">PREVIOUS DAY</a>
                                <a href="#" onclick="updateSummaryData('last7days');">LAST 7 DAYS</a>
                                <a href="#" onclick="updateSummaryData('last30days');">LAST 30 DAYS</a>
                            </div>
                        </div>
                    </div>
                    <div class="row moduleContentDiv" style="padding:5px;">
                        <div id="tab-container-div" style="" class="col-sm-6">
                            <div class="row">
                                <div class="marginDiv" id="dashboardTotalVideo_li" style="">
                                    <div>
                                        <label class="dataSpaceLabel">
                                            Total Video
                                        </label>
                                        <div style="padding-left: 10px;">
                                            <div class="first" style="text-align: center;margin-right: 5px;" id="qoeDiv1"></div>
                                            <div class="second" style="text-align: center" id="qoeDiv2"></div>
                                            <div class="clear" ></div>
                                        </div>
                                        <div id="QoE_div" style=""></div>
                                    </div>
                                </div>
                                <div class="marginDiv" id="dashboardSuccessReq_li" style="">
                                    <div>
                                        <label class="dataSpaceLabel">
                                            % Success
                                        </label>
                                        <div style="padding-left: 10px;">
                                            <div class="first" style="text-align: center;margin-right: 5px;" id="qoeDiv3"></div>
                                            <div class="second" style="text-align: center" id="qoeDiv4"></div>
                                            <div class="clear" ></div>
                                        </div>
                                        <div id="QoE_div1" style=""></div>
                                    </div>
                                </div>
                                <div class="marginDiv" id="dashboardDataVolume_li" style="">
                                    <div>
                                        <label class="dataSpaceLabel">
                                            Data Volume
                                        </label>
                                        <div style="padding-left: 10px;">
                                            <div class="first" style="text-align: center;margin-right: 5px;" id="qoeDiv5"></div>
                                            <div class="second" style="text-align: center" id="qoeDiv6"></div>
                                            <div class="clear" ></div>
                                        </div>
                                        <div id="QoE_div2" style=""></div>
                                    </div>
                                </div>
                                <div class="marginDiv" id="dashboardRevenue_li" style="">
                                    <div>
                                        <label class="dataSpaceLabel">
                                            Revenue
                                        </label>
                                        <div style="padding-left: 10px;">
                                            <div class="first" style="text-align: center;margin-right: 5px;" id="qoeDiv7"></div>
                                            <div class="second" style="text-align: center" id="qoeDiv8"></div>
                                            <div class="clear" ></div>
                                        </div>
                                        <div id="QoE_div3" style=""></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="right_tab_container" class="col-sm-6 rightcontainer" style="">
                            <div class="row" style="height: 50%;" id="right_tab_container_upper">
                                <label style="font-size: 22px;font-weight: unset;margin-left: 11px;margin-top: 12px">Data Volume Vs Revenue (Last 7 Days)</label>
                                <div id="topGeography" style=""></div>
                            </div>
                            <div class="row" style="height: 50%" id="right_tab_container_lower">
                                <div id="table_div_title" style="margin-bottom: 20px;">Top 5 Geography Revenue (Last 7 Days)</div>
                                <table id="table_div" class="display" width="100%" cellspacing="0">
                                </table>
                            </div>
                        </div>
                        <div id="noAccess" class="moduleHeaderName tab-container" style="display: none;text-align: center;vertical-align: middle;padding: 75px;">
                                User not authorized to access. Please contact administrator.
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <div class="TamFooter">&copy; Tambora System, 2017. All Rights Reserved.</div>
    </body>
    <script src="../js/loadRights.js"></script>
    <script src="../js/newUIDashBoard.js" type="text/javascript"></script> 
</html> 

