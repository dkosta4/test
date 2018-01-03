
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html lang="en">
    <head>
        <title>Tambora Video Optimizer</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="../jsp/globalScriptFile.jsp"></jsp:include>
        <script type="text/javascript" src="../js/DateRangeWidgetBilling.js"></script>
        <!--        <link rel="stylesheet" href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css">
        -->        <link href="../css/bootstrap-dialog.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap-dialog.js"></script>

        <script type="text/javascript" >
            var selectedSideMenuButtonId = "6"; // required to load respective page with propercss.
            var loggedInEntityName = '';
            var loggedInEntityId = '';
            var loggedInUserRole = '';

            $(document).ready(function () {

                loggedInEntityName = $.cookie('entityName');
                loggedInUserRole = $.cookie('userRole');

                if ('MNO_ADMIN' == loggedInUserRole) {
                    loggedInEntityId = $.cookie('mnoId');
                }
                if ("INTERNAL" == loggedInUserRole) {
                    loggedInEntityId = $.cookie('cdnId');
                }
                if ("MNO" == loggedInUserRole) {
                    loggedInEntityId = $.cookie('mnoId');
                }

                $('#titleHeader').html(loggedInEntityName);

                $('.pickerContainer.basic').DatePicker({mode: "single", date: new Date(), inline: true});
                $('.pickerContainer.range').DatePicker({mode: "range", date: ['2012-10-20', new Date()], inline: true, calendars: 2});
                $('.pickerContainer.tworanges').DatePicker({mode: "tworanges", date: ['2012-10-20', '2012-10-29', '2012-10-10', '2012-10-19'], inline: true, calendars: 2});
                $('.pickerContainer.widget').DateRangesWidget();
                prettyPrint();
                getSidebarMenus(); // function is required to load menu.
                $("#generateInvoice a").click().addClass("moduleSubTab-Selected");
                $("#viewInvoice a").click(function(){
                    $("#generateInvoice a").removeClass("moduleSubTab-Selected");
                    $("#viewInvoice a").addClass("moduleSubTab-Selected");
                });
                $("#generateInvoice a").click(function(){
                    $("#generateInvoice a").addClass("moduleSubTab-Selected");
                    $("#viewInvoice a").removeClass("moduleSubTab-Selected");
                });
            });
            
             setTimeout(function (){
    var contentHeight = $("#mainContent").height();
     contentHeight=contentHeight+5;
    $("#sidebarContent").css({"height": contentHeight});
    }, 1000)

        </script>
    </head>
    <body style="/*background-color: #345D93;*/">
        <div class="container-fluid">
            <!--load the header-->
            <div id="header_id"></div>
            <div class="row">
                <div class="col-sm-1 sidebarbackground" id="sidebarContent"></div>
                <div class="col-sm-11" id="mainContent" style="background-color: #345D93;color:white;min-height: 922px;">
                    <div class="row mainContentRowHeight moduleHeader" style="margin-top: 17px;">
                        <div class="col-sm-6">
                            <label class="pageTitle"> Billing Details </label>
                        </div>
                        <div class="pickerContainer widget col-sm-6"></div> <!--datepicker div -->
                    </div>
                    <div class="row mainContentRowHeight moduleSubHeader">
                        <div class="col-sm-12 horizontal" id="menu">
                            <ul class="currentLink">
                                
                                <li id="generateInvoice" value="Generate Invoice" onclick="changeFilterSubMenu('generateInvoice');"><a class="moduleSubTab-UnSelected" href="#Generate Invoicex">Generate Invoice</a></li>
                                <li id="viewInvoice" value="View Invoice"  onclick="changeFilterSubMenu('viewInvoice');"><a class="moduleSubTab-UnSelected" href="#View Invoice">View Invoice</a></li>
                            </ul>
                        </div>                         
                    </div>

                    <div class="row moduleContentDiv">
                        <label id="generateReportButton" class="btnPrimary" style="cursor: pointer;cursor: hand;" onclick="generateReport()" >Generate Report</label>
                        <!--<button id="generateReportButton" onclick="generateReport()" type="button" style="text-align: center; display: none;margin-left: 15px;" class="btn btn-primary">Generate Report</button>-->
                        <div id="errorMessageBilling_div" style='margin-left: 246px;margin-top: 63px;'>
                            <h3 class="errMessageMaster"><img src='../img/icon-error-alert.png'/>
                                No Invoice Available</h3>
                        </div>
                        <center><img src='../img/gif/loading.gif' alt='processing'  style="display: none;" id="processingpicEmsSA"></center>
                        <div id="tableContentHide">
                            <div id="tableMainWrapperDiv" class="col-lg-12" style="padding:1%;/*background-color: #2C4887*/">
                                <div id="updateTable" style="margin-top: 10px" class="">
                                    <table id="displayTable" class="row-border" style="/*background: #2A538A;*/" width="100%" cellspacing="0">
                                    </table>
                                </div>
                                <div class="btn-group dropup droplistDropDown" id ="exportToId" style="float: left;margin-right: 318px;margin-top: 8px;width:112px;">
                                    <label type="button" class="dropdown-toggle billDetail" data-toggle="dropdown" style="cursor: pointer;cursor: hand;color:#8bb8ea">
                                        Export to<span class="caret"></span>
                                    </label>
                                  <!--here changed text color on White-->
                                    <ul class="dropdown-menu droplistDropDown" id="fileExport" role="menu" style="min-width: 111px;margin-left: 0px;margin-top: 0px;border-radius: 2px;background-color: #244264;color: #8bb8ea">
                                        <a href="#" style="margin-left: 8px;color:white;"onclick="ExportFiles('CSV')">CSV</a><br>
                                        <a href="#" style="margin-left: 8px;color:white;"onclick="ExportFiles('PDF')">PDF</a><br>
                                        <a href="#" style="margin-left: 8px;color:white;"onclick="ExportFiles('XLS')">Excel</a>
                                    </ul>
                                </div>
                                <div class="" data-toggle="buttons" style="float: right;margin-top: 14px;margin-right: -3px;font-size: 18px;color: #82AFE1;">
                                    <label class="radio-inline" style="margin-right: -3px;">
                                        <input type="radio" id="allInvoiceId" name="invoiceDetail" value="1" checked="checked" style="-webkit-transform: scale(1.3, 1.3);">All Invoice
                                    </label>
                                    <label class="radio-inline" style="margin-right: -3px;">
                                        <input type="radio" id="paidInvoiceId" name="invoiceDetail" value="2" style="-webkit-transform: scale(1.3, 1.3);">Paid Invoice
                                    </label>
                                    <label class="radio-inline" style="margin-right: 10px;">
                                        <input type="radio" id="overdueInvoiceId" name="invoiceDetail" value="3" style="-webkit-transform: scale(1.3, 1.3);">Overdue Invoice
                                    </label>
                                </div>

                                <div id="itemizeddetails" class="modal fade ">
                                    <div class="modal-dialog" style="width: 978px;">
                                        <div class="modal-content dialogBox">
                                            <div class="modal-header dialogHeader">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                    <img src="../images/modal-close.png"></img>
                                                </button>
                                                <h4 class="modal-title" id="ModelHeader" style="margin-top: -7px;"><b>Billing Details</b></h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="moduleContentDiv">
                                                    <div>
                                                        <h4 style=""><b>Itemized Bill</b></h4>
                                                    </div>

                                                    <table class="table" style="/*background-color: #2A538A8*/">
                                                        <thead>
                                                            <tr>
                                                                <th class="tableHeader" style="border-bottom-color: #8CABD4; padding: 15px">Invoice No.</th>
                                                                <th class="tableHeader" style="border-bottom-color: #8CABD4;padding:15px">Date</th>
                                                                <th class="tableHeader" style="border-bottom-color: #8CABD4;padding:15px">Period</th>
                                                                <th class="tableHeader" id="tableHeader_dynamic" style="border-bottom-color: #8CABD4;padding:15px"></th>
                                                                <th class="tableHeader" style="border-bottom-color: #8CABD4;padding:15px">Payment Details</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="tableCell" style="/*background-color: #192E5D*/">
                                                            <tr>
                                                                <td id="invno"></td>
                                                                <td id="invdate"></td>
                                                                <td id="invperiod"></td>
                                                                <td id="invamt"></td>
                                                                <td id="paydetail"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div style="margin-top: 59px;">
                                                        <h4 style=""><b>Geography / Network Details</b></h4>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div id="itemizedTable" style="overflow-y: auto"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            
                                            <div class="modal-footer">
                                                <div class="btn-group dropup droplistDropDown"id ="exportToId"   style="float: left;margin-right: 1px;margin-top: 0px;width:112px;">
                                                    <label type="button" class="dropdown-toggle" data-toggle="dropdown" style="cursor: pointer;cursor: hand">
                                                        Export to<span class="caret"></span>
                                                    </label>
                                                    <ul class="dropdown-menu droplistDropDown" id="itemfileExport" role="menu" style="min-width: 111px;margin-left: -1px;margin-top: 0px;border-radius: 2px;background-color: #244264;color: #8bb8ea">
                                                        <a href="#" style="color:white;margin-left: 8px;"onclick="Exportitemized('CSV')">CSV</a><br>
                                                        <a href="#" style="color:white;margin-left: 8px;"onclick="Exportitemized('PDF')">PDF</a><br>
                                                        <a href="#" style="color:white;margin-left: 8px;"onclick="Exportitemized('XLS')">Excel</a>
                                                    </ul>
                                                </div>
                                                
<!--                                                <div class="btn-group dropup droplistDropDown" id ="exportToId" style="float: left;margin-right: 318px;margin-top: 8px;">
                                    <label type="button" class="dropdown-toggle billDetail" data-toggle="dropdown" style="cursor: pointer;cursor: hand;color:#8bb8ea">
                                        Export to<span class="caret"></span>
                                    </label>
                                  here changed text color on White
                                    <ul class="dropdown-menu droplistDropDown" id="fileExport" role="menu" style="min-width: 110px;margin-left: -1px;margin-top: 0px;border-radius: 2px;background-color: #244264;color: #8bb8ea">
                                        <a href="#" style="margin-left: 8px;color:white;"onclick="ExportFiles('CSV')">CSV</a><br>
                                        <a href="#" style="margin-left: 8px;color:white;"onclick="ExportFiles('PDF')">PDF</a><br>
                                        <a href="#" style="margin-left: 8px;color:white;"onclick="ExportFiles('XLS')">Excel</a>
                                    </ul>
                                </div>-->
                                                
                                                
                                                
                                                <div style="margin-top: 14px;">
                                                    <label type="button" id="cancel" class="droplistDropDown " data-dismiss="modal" onclick="" style="font-family:Roboto;font-weight: 700;font-size: 18px;background-color:#8bb8ea;color:black;cursor: pointer;cursor: hand">Close</label>
                                                <!--<lable type="button" id="cancelFile" data-dismiss="modal" class="btnPrimary" style="cursor: pointer;cursor: hand;float: right;margin-top: 11px;text-align: center;height:48px">Cancel</lable>-->
                                                    
                                                
                                                
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
            <div class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                <img src="../images/modal-close.png" style="">
                            </button>
                            <h4 class="modal-title">Modal title</h4>
                        </div>
                        <div class="modal-body">
                            <p>One fine body…</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" onclick="changeFilterSubMenu('viewInvoice')" class="btn btn-primary">Save changes</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </div> 
        <div id="showInvoice" class="modal fade">
            <div class="modal-dialog" style="opacity: 1; display: block; transform: perspective(800px) translateX(0px) scaleX(1) scaleY(1) rotateZ(0deg) translateY(0px);">
                <div class="modal-content" style='width: 500px;height: 218px;background-color: #31578c;color: #cdd7e5;font-size: 18px;line-height: 24px;'>
                    <div class="dialogHeader">
                        <lable type="button" class="" data-dismiss="modal" aria-hidden="true" style="float: right;cursor: pointer;"><img src="../images/modal-close.png" style="margin-top: -12px"></lable>
                        <h4 class="" id="" style="font-size: 21px;margin-top: -7px;">Success</h4>
                    </div>
<!--                    <div class="modal-body" style="border-top: 1px dotted #3489C2;">-->
                    <div class="modal-body" style="border-top: 1px solid #3489C2; border-top-color:white;">

                        
                        <div class="row">
                            <span class=""><img id='' src='../images/modal-ok.png' style='margin-left: 6px;margin-top: -12px;'></span><div class="col-lg-12" style="margin-left: 41px;margin-top: -34px;"><p id="">Bill Invoice Generated Successfully click to view</p></div>  
                        </div>
                    </div>
                    <div class="confirmButton"></div>                   
                </div>
            </div>
        </div>
        <div class="TamFooter">&copy; Tambora System, 2017. All Rights Reserved.</div>
    </body>
</html> 
<script src="../js/biillingDetails.js"></script>
<script src="../js/loadRights.js"></script>
</html>
