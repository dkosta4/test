<%-- 
    Document   : newUIConfig
    Created on : Jul 2017
    
--%>
<!DOCTYPE html>
<html lang="en">
    <head>
                <title>Tambora Video Optimizer</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="../jsp/globalScriptFile.jsp"></jsp:include> 
        <!--<script  src="../js/loadRights.js"></script>-->
        <script type="text/javascript" src="../js/DateRangeWidgetActivityLog.js"></script>
        <!--STYLE SHEET CONFIG -->
        <link href="../css/newUIconfig.css" rel="stylesheet" type="text/css" />
        <script src="../js/bootbox.min.js"></script>
        <script src="../js/newUIconfig.js"></script>


    </head>
    <body>
        <div class="container-fluid">

            <!--load the sidebar-->
            <div id="header_id"></div>
            <div class="row">
                <div class="col-sm-1 sidebarbackground" id="sidebarContent">
                </div>
                <div class="col-sm-11" id="mainContent" style="min-height: 987px;">
                    <div class="row mainContentRowHeight moduleHeader">
                        <div class="col-sm-6">
                            <label class="pageTitle moduleHeaderName"> Configuration </label>
                        </div>
                        <!--<div class="pickerContainer widget col-sm-6"></div>-->
                    </div>
                    <div class="row mainContentRowHeight moduleSubHeader">
                        <div class="col-sm-12 horizontal" id="menu">
                            <ul class="currentLink">
                                <li id="INTER-FACE" value="INTER-FACE" onclick="changeFiltertypeGeoGraphy('INTER-FACE');"><a class="moduleSubTab-UnSelected" href="#Interfaces">Interfaces</a></li>
                                <li id="GEO-GRPHY" value="ALL"  onclick="changeFiltertypeGeoGraphy('GEO-GRPY');"><a class="moduleSubTab-UnSelected" href="#Geography">Geography</a></li>
                                <li id="USER" value="USER" onclick="changeFiltertypeGeoGraphy('USER');"><a class="moduleSubTab-UnSelected" href="#Users">Users</a></li>
                                <li id="SER-TYP1" value="SER-TYP" onclick="changeFiltertypeGeoGraphy('SER-TYP');"><a class="moduleSubTab-UnSelected" href="#Services">Services</a></li>
                                <li id="RB-AC" value="RBAC" onclick="changeFiltertypeGeoGraphy('R-BAC');"><a class="moduleSubTab-UnSelected" href="#Rbac">RBAC</a></li>
                                <li id="fault_config" value="Fault-Config" onclick="changeFiltertypeGeoGraphy('Fault-Config');"><a class="moduleSubTab-UnSelected" href="#">Fault Config</a></li>
                                <li id="ACTIVITY-LOG" value="ACTIVITY" onclick="changeFiltertypeGeoGraphy('ACTIVITY');"><a class="moduleSubTab-UnSelected" href="#Activity">Activity Log</a></li>
                            </ul>
                        </div>                         
                    </div>
                    <div class="row">
                        <div class="col-sm-12 moduleContentDiv" id="ALL_CONT" style="padding:1%;height: auto">
                            <div style="" id="GEO-GRPY_content">
                                <div >
                                    <label type="button" class="btnPrimary" id="modal_opn1" style="cursor: pointer;margin-left: 3px;margin-top: 16px;"title="add">Add</label>
                                    <label type="button" class="btnPrimary" id="deleteGeography" style="cursor: pointer;cursor: hand;margin-left: -2px;margin-top: 16px;" title="delete">Delete</label>
                                    <label type="button" class="btnPrimary" id="upload1" style="cursor: pointer;cursor: hand;margin-left: 3px;margin-top: 16px;"title="Upload">Upload</label>
                                </div>
                                <div id="errorMessage_div" style='margin-left: 246px;margin-top: 176px;display: none'>
                                    <h3 class="errMessageMaster"><img src='../img/icon-error-alert.png'/>
                                        No Geography has been configured</h3>
                                    <!--<h4 class="errMessageSuggAction" style="margin-left: 57px;margin-top: -24px;">How About adding a new geography</h4>-->
                                    <label type="button" class="btnPrimary" id="modal_opn" style="cursor: pointer;cursor: hand;margin-left: 80px;margin-top: 16px;">Add Geography</label>
                                </div>
                                <div id="table_div" class="">
                                    <!--                                    <div >
                                                                            <label type="button" class="btnPrimary" id="modal_opn1" style="cursor: pointer;margin-left: 3px;margin-top: 16px;"title="add">Add</label>
                                                                            <label type="button" class="btnPrimary" id="deleteGeography" style="cursor: pointer;cursor: hand;margin-left: -2px;margin-top: 16px;" title="delete">Delete</label>
                                                                            <label type="button" class="btnPrimary" id="upload1" style="cursor: pointer;cursor: hand;margin-left: 3px;margin-top: 16px;"title="add">Upload</label>
                                                                        </div>-->
                                    <div style="margin-top: 12px;">
                                        <table id="geographyTable" class="row-border" style="word-wrap:break-word;" width="100%" cellspacing="0">
                                        </table>
                                    </div>
                                </div>
                                <div id="processing" style="margin-left: 46%;"><img src="../img/gif/loading.gif"></div>
                                <div id="addGeography_modal" class="modal fade">
                                    <div class="modal-dialog" style="">
                                        <div class="modal-content dialogBox">
                                            <div class="dialogHeader">
                                                <lable type="button" class="close" data-dismiss="modal" aria-hidden="true" style="cursor: pointer;"><img src="../images/modal-close.png"></lable>
                                                <h4 class="modal-title" id="ModelHeader" style="margin-left:-5px;"><b>Add Geography</b></h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row" style="border:0px; border-top:1px solid #CDD7E5">
                                                    <div class="dialogSubHeader col-sm-12">
                                                        <div class="row" style="margin-top: -8px;">
                                                            <div class="dialogSubHeaderLabel col-lg-5 " style="border-right: solid 1px;padding-right: 25px;">MNO Name<h5 class="dialogBoxMno" id="mnoname"></h5></div>
                                                            <div class="dialogSubHeaderLabel col-lg-5 " style="border-left: solid 0px;margin-left: 25px;">MNO Country<h5 class="dialogBoxMno" id="contryname"></h5></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <div class="row" style="margin-top: 39px;">
                                                            <div class="col-lg-6" style="">
                                                                <label class="dialogGeneralLabel">Mobile Country Code(MCC)</label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <span class="navbar-left" style="color: black;">
                                                                    <select class="selectpicker" data-width="140px" style="cursor: pointer;cursor: hand;width: 197px;" data-size="8" id="MCC_select_field" title="MNO MCC" >
                                                                    </select>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-top: 15px;">
                                                            <div class="col-lg-6" style="">
                                                                <label class="dialogGeneralLabel">Mobile Network Code(MNC)</label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <span class="navbar-left" style="color: black;">
                                                                    <select class="selectpicker" id="MNC_select_field" style="cursor: pointer;cursor: hand;width: 197px;" data-width="140px" title="MNO MNC">
                                                                        <option>Select MNC</option>
                                                                    </select>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-top: 15px;">
                                                            <div class="col-lg-6" style="">
                                                                <label class="dialogGeneralLabel">Network Name</label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <span class="navbar-left" style="color: black;">
                                                                    <select class="selectpicker" id="network_name" style="cursor: pointer;cursor: hand;width: 197px;" data-width="140px" title="MNO MNC">
                                                                        <option>Select Network</option>
                                                                    </select>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-top: 15px;">
                                                            <div class="col-lg-6" style="">
                                                                <label class="dialogGeneralLabel">Geography Name</label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <input type="text" id="GeographyName" class="inpueTextstyle" title="Geography Name" maxlength="50"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dialogFooterWithButtons">
                                                <!--<div style="margin-top: 14px;">-->
                                                <lable type="button" id="addGeography" class="btnPrimary pull-right modalBtnHeight" data-dismiss="modal" onclick="" title="add" style="cursor: pointer;">Add</lable>
                                                <lable type="button" id="cancel" class="btnPrimary pull-right modalBtnHeight" data-dismiss="modal" onclick="" title="cancel" style="cursor: pointer;">Cancel</lable>
                                                <!--</div>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--interface contenet start here-->
                            <div id="INTER-FACE_content">
                                <!--<h3>Interface content write here only</h3>-->
                                <!--                                <div id="showerrorMessage_div" style='margin-left: 246px;margin-top: 176px;'>
                                                                    <h3 class="errMessage" style="color:white;"><img src='../img/icon-error-alert.png'/>
                                                                        No Interface has been configured </h3>
                                                                    <h4 class="errMessageSuggAction" style="margin-left: 57px;margin-top: -24px;">How About adding a new interface</h4>
                                                                    <label type="button" class="btnPrimary" id="modal_open" style="cursor: pointer;cursor: hand;margin-left: 80px;margin-top: 16px;">Add MNO Interface</label>
                                                                </div>-->
                                <input type="hidden" id="recordid" name="recordid" value="recordid"/>
                                <div>
                                    <input type="hidden" class="form-control" id="protocol"   style="width: 175px;background-color: white;margin-left:118px;margin-top: -23px;height: 29px;"/>
                                </div>
                                <label type="button" class="btnPrimary" id="addMno" style="cursor: pointer;cursor: hand;margin-top: 16px;"title="add">Add</label>
                                <label type="button" class="btnPrimary" id="upload" style="cursor: pointer;cursor: hand;margin-left: 3px;margin-top: 16px;"title="Upload">Upload</label>
                                <div id="Tablemno" style="margin-top: 5px" class="">
                                    <table id="displayTablemno" class="row-border" style="margin-top: 50px;table-layout: fixed;word-wrap:break-word;" width="100%" cellspacing="0">    
                                    </table>
                                </div>
                                <div id="showerrorMessage_div" style='margin-left: 246px;margin-top: 176px;'>
                                    <h3 class="errMessage" style="color:white;"><img src='../img/icon-error-alert.png'/>
                                        No Interface has been configured </h3>
                                    <!--<h4 class="errMessageSuggAction" style="margin-left: 57px;margin-top: -24px;">How About adding a new interface</h4>-->
                                    <label type="button" class="btnPrimary" id="modal_open" style="cursor: pointer;cursor: hand;margin-left: 80px;margin-top: 16px;">Add MNO Interface</label>
                                </div>
                            </div>
                            <!------to change upload file start here---->
                            
                            <div id="uploadDiv" class="modal fade" style="margin-top: 0px;">
                                <div class="modal-dialog">
                                    <div class="modal-content dialogBox">
                                        <div class="dialogHeader">
                                            <lable type="button" class="close" data-dismiss="modal" aria-hidden="true" style="cursor: pointer;"><img src="../images/modal-close.png"></lable>
                                            <h4 class="modal-title" id="uploadModalLable" style="margin-top: -6px;margin-left: 6px;font-size: 18px;"><b>Upload File</b></h4>
                                        </div>
                                        <div class="modal-body" style="padding: 0px 35px 10px 30px;height: auto;border-top: 1px solid #CDD7E5">
                                            <div>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="form" >
                                                            <form  name="uploadFile" class="form-validate form-horizontal" autocomplete="off" id="upload_file_form" action="" enctype="multipart/form-data">
                                                                <div class="row">
  <!--<label for="fileType" style="margin-left: 12px;margin-top: 21px; color: #CDD7E5;"><font color="#345D93"><b style="color:white">File Type</b></font></label>-->
                                                                 <label for="fileType" style="margin-left: 12px;margin-top: 21px; color: black;"><font color="#345D93"><b class="dialogGeneralLabel">File Type</b></font></label>

                                                                    <div style="margin-top: -29px;margin-left: 141px;width: 1px">
                                                                        <select autocomplete="off" id="dropDownValue" style="font-family: Roboto;font-size: 16px;margin-left: 123px;height: 29px;width: 98px;color: black;cursor: pointer;">
                                                                            <option style="margin-left: 2px;font-family: Roboto;font-size: 16px; " selected disabled>Select</option>
                                                                            <option value="csv" style="font-family: Roboto;font-size: 16px;">CSV</option>
                                                                            <option value="excel" style="font-family: Roboto;font-size: 16px;">Excel</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="row" style="border:0px">
                                                                    <label  for="fileType" style="margin-left: 12px;margin-top: 21px;"><font color="#CDD7E5"><b class="dialogGeneralLabel">Select File</b></font></label>
                                                                    <div style="margin-top: -29px;margin-left: 141px;width: 1px">
                                                                        <input id="select_file" type="file" name="name" style="margin-left: 122px; color: transparent; overflow: hidden"/>
                                                                    </div>
                                                                    <div >
                                                                        <p id="details" style="margin-left: 10px;"></p>
                                                                    </div>
                                                                </div>

                                                                <div class ="dialogFooterWithUpload" >
                                                                <button type="submit" id="selectFile" class="btnPrimary " style="border-radius: 1px; cursor: pointer;cursor: hand;float: right;height: 48px;border: mintcream; padding: 12px 20px;text-align: center;">Upload</button>
                                                                <!--<div>-->
                                                                <lable type="button" id="cancelFile" data-dismiss="modal" class="btnPrimary" style="cursor: pointer;cursor: hand;float: right;margin-top: 11px;text-align: center;height:48px">Cancel</lable>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
<!--                                        <div class="modal-footer" style="border:0px;margin-top: -70px"> 
                                        </div>-->
                                    </div>
                                </div>
                            </div>
                            
                            <!-------------------------to change style upload part end here---------------->
                            
<!--                            Add interface modal to change style start here------->
                            

                            <div id="addInterfaceModal1" class="modal fade">
                                <div class="modal-dialog">
                                    <div class="modal-content dialogBox">
                                        <div class="modal-header" style="border:0px; border-bottom: 1px solid #CDD7E5">
<!--    <lable type="button" class="close" data-dismiss="modal" aria-hidden="true"><img src="../images/close-dialog_1.png"  ></lable>-->
            <lable type="button" class="close" data-dismiss="modal" aria-hidden="true"><img src="../images/modal-close.png"></lable>


<!--              <h4 class="modal-title" id="gridModalLabel" style="margin-top: 2px ; "><b>Modify MNO Interface</b></h4>-->
                                             <h4 class="modal-title" id="gridModalLabel" style="margin-top: 2px ; font-weight: bold;color:#ffffff;"><b>Update MNO Interface</b></h4>

                                        </div>
<!--                                        <div class="modal-body" style="padding: 32px;height: 500px; margin-top:4px;">-->
                                                                                   <div class="modal-body"style="padding: 0px 35px 10px 30px;height: auto">

                                            <div>
                                                <div class="row">
                                                    <font color="#345D93" style="color:#cdd7e5;font-size: 16px;font-weight:400px;">MNO Name</font>
                                                    
                                                    <div style="" class="btn-group" id=''>
                                                        <span><b><h5 id="mno" style="margin-top: 15px;margin-left: 100px; font-size: 16px"></h5></b></span>
                                                    </div>   

                                                    <div class="row">
                                                        <div class="col-md-6" style="width: 175px;margin-left: 1px;margin-top: 8px;">
                                                            <label class="dialogGeneralLabel">PCRF Host</label>
                                                            <input type="text" class="form-control textBoxPopup" id="pcrfhost" minlength="1" maxlength="50" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6" style="width: 136px;margin-left: 1px;margin-top: 22px;">
                                                            <label class="dialogGeneralLabel">PCRF IP</label>
                                                            <input type="text" class="form-control textBoxPopup" id="pcrfip" name="ipadd" />
                                                        </div>
                                                        <div class="dropdown" style="margin-top: 23px;margin-left: 375px;">
                                                            <select id="menu1" style="margin-left: 16px;height: 28px;margin-top: 4px;cursor: pointer;">
                                                                <option value ="select" style="font-family: Roboto;font-size: 16px;">select</option>
                                                                <option value="IPV4">IPV4</option>
                                                                <option value="IPV6">IPV6</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6" style="width: 136px;margin-left: 1px;margin-top: 22px;">
                                                            <label class="dialogGeneralLabel">PCRF Port</label>
                                                            <input type="text" class="form-control textBoxPopup" id="pcrfport" maxlength="5" />
                                                        </div> 
                                                    </div>
                                                    <div class="row" >
                                                        <div class="col-lg-6" style="margin-left: 1px;margin-top: 22px;">
                                                            <label class="dialogGeneralLabel">Transport Type</label>
                                                            <div class="dropdown" style="margin-top: -25px;margin-left: 190px;">
                                                                <select id="menu3" style="width: 177px;height: 30px;cursor: pointer;">
                                                                </select>
                                                            </div>
                                                        </div> 
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-6" style="margin-left: 1px;margin-top: 22px;">
                                                            <label class="dialogGeneralLabel">Network Name</label>
                                                            <input type="text" class="form-control textBoxPopup" id="networkname1" minlength="1" maxlength="50"  />
                                                        </div>                        
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-6" style="margin-left: 1px;margin-top: 22px;">
                                                            <label class="dialogGeneralLabel">NI IP Address</label>
                                                            <input type="text" class="form-control textBoxPopup" id="ipaddress" name="ipadd" />       
                                                        </div>
                                                        <div class="dropdown" style="margin-top: 23px;margin-left: 375px;">
                                                            <select id="menu2" style="margin-left: 16px;height: 28px;margin-top: 4px;cursor: pointer;">
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            
                                            
                                            
                                            <div class="modal-footer dialogFooterWithUpload" style="margin-top: 25px;margin-left: -32px;margin-right: -32px;border:0px;width:112%;height: 82px;"> 
                                                <div><label style="float:left;font-weight: bold;color:#ffffff;padding-left: 7px;" id="label"><b>All fields are mandatory</b></label></div>
                                                <div style="float:right;width:50%;white-space: nowrap;">
                                                    <div style="width:45%;display: inline;"><label type="button" id="changeUpdate" class="btnPrimary" data-dismiss="modal" style="border-radius: 1px; cursor: pointer;cursor: hand;float: right;height: 48px;border: mintcream; padding: 12px 20px;text-align: center;"></label></div>
                                                    <div style="width:45%;display: inline;"><label type="button" id="cancelmodal" class="btnPrimary" data-dismiss="modal" style="border-radius: 1px; cursor: pointer;cursor: hand;float: right;height: 48px;border: mintcream; padding: 12px 20px;text-align: center;">Cancel</label></div>
                                                </div>

                                                <!--<lable type="button" class="btn btn-primary" data-dismiss="modal" id="changeUpdate" onclick="closeFunction()">Save</lable>-->

                                                <!--<lable type="button" class="btn btn-primary" data-dismiss="modal" onclick="closeFunction()">Close</lable>-->

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> 
<!--interface modal to change in style  end here -->
                            
                            
                            <div id="SER-TYP_content">
                                <div style="margin-top: 25px;">
                                    <table id="serviceTable" class="row-border" style="/*background: #2A538A;*/" width="100%" cellspacing="0">
                                    </table>
                                </div>
                            </div>     
                            <div id="R-BAC_content">
                                <div class="">
                                    <div class="col-sm-12" id="mainContent" style="background-color: #345D93;color:white;">
                                        <div class="row mainContentRowHeight moduleSubHeader">
                                            <div class="col-sm-12 horizontal" id="menu">
                                                <ul class="currentLink">
                                                    <li id="rbac_li" value="Role" ><a class="moduleSubTab-UnSelected" href="#Role">Role</a></li>
                                                    <li id="ubac_li" value="User" ><a class="moduleSubTab-UnSelected" href="#User">User</a></li>
                                                </ul>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12 moduleContentDiv" id="ALL_CONT" style="margin-left: 11px;">
                                                    <div id="ROLE_RIGHT">
                                                        <div id="loadRbacOrUback"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="Fault_Config_Content">
                                <div class="col-sm-12">
                                    <div id="loadFaultConfig" style="margin-left: -12px"></div>
                                </div>
                            </div>
                            <div id="user_content">
                                <div class="col-sm-12">
                                    <div id="load_user_list" hidden="true" style="margin-left: -12px"></div>
                                </div>
                            </div>
                            <div id="activity_content">
                                <div class="col-sm-12">
                                    <div id="activity_list" style="margin-left: -12px"></div>
                                </div>
                            </div>  
                    </div>
                        <div id="noAccess" class="moduleHeaderName tab-container" style="display: none;text-align: center;vertical-align: middle;padding: 75px;">
                                User not authorized to access. Please contact administrator.
                        </div>
                    </div>
            </div>
            </div>
        </div>
        <div id="alert_message" class="modal fade">
            <div class="modal-dialog" style="opacity: 1; display: block; transform: perspective(800px) translateX(0px) scaleX(1) scaleY(1) rotateZ(0deg) translateY(0px);">
                <div class="modal-content" style='width: 520px;height: 218px;background-color: #31578c;color: #cdd7e5;font-size: 18px;line-height: 24px;'>
                    <div class="dialogHeader">
                        <lable type="button" class="" data-dismiss="modal" aria-hidden="true"  style="float: right;margin-top: -7px;cursor: pointer;"><img src="../images/modal-close.png"></lable>
                        <h4 class="modal-title" id="modal_heading" style="font-size: 21px; margin-top: -10px"><b></b></h4>
                    </div>
                    <div class="modal-body" style="border-top: 1px solid #CDD7E5">
                        <div class="row">
                            <span class="addimg"></span><div class="col-lg-12" style="margin-left: 41px;margin-top: -34px;"><p id="setMeassage"></p></div>  
                        </div>
                    </div>
                    <div class="">
                        <lable type="button" id="ok_alert" class="btnPrimary" data-dismiss="modal" onclick="" style="cursor: pointer;float: right;height: 48px;margin-top: 28px; padding: 12px 20px;" title="ok">OK</lable>
                    </div>
                </div>
            </div>
        </div>
        <div id="confirDelete" class="modal fade">
            <div class="modal-dialog" style="opacity: 1; display: block; transform: perspective(800px) translateX(0px) scaleX(1) scaleY(1) rotateZ(0deg) translateY(0px);">
                <div class="modal-content" style='width: 500px;height: 218px;background-color: #31578c;color: #cdd7e5;font-size: 18px;line-height: 24px;'>
                    <div class="dialogHeader">
                        <lable type="button" class="" data-dismiss="modal" aria-hidden="true" style="float: right;"><img src="../images/modal-close.png" style="margin-top: -12px;cursor: pointer;"></lable>
                        <h4 class="" id="" style="font-size: 21px;margin-top: -7px;">Delete</h4>
                    </div>
                    <div class="modal-body" style="border-top: 1px solid #CDD7E5;">
                        <div class="row">
                            <span class=""><img id='' src='../images/modal-question.png' style='margin-left: 6px;margin-top: -12px;'></span><div class="col-lg-12" style="margin-left: 41px;margin-top: -34px;"><p id="">Are you sure to delete ?</p></div>  
                        </div>
                    </div>
                    <div class="putbuttons"></div>                   
                </div>
            </div>
        </div>
        <div id="confirmUpdate" class="modal fade">
            <div class="modal-dialog" style="opacity: 1; display: block; transform: perspective(800px) translateX(0px) scaleX(1) scaleY(1) rotateZ(0deg) translateY(0px);">
                <div class="modal-content" style='width: 500px;height: 218px;background-color: #31578c;color: #cdd7e5;font-size: 18px;line-height: 24px;'>
                    <div class="dialogHeader">
                        <lable type="button" class="" data-dismiss="modal" aria-hidden="true" style="float: right;cursor: pointer;"><img src="../images/modal-close.png" style="margin-top: -12px"></lable>
                        <h4 class="" id="" style="font-size: 21px;margin-top: -7px;">Warning</h4>
                    </div>
                    <div class="modal-body" style="border-top: 1px solid #CDD7E5;">
                        <div class="row">
                            <span class=""><img id='' src='../images/modal-question.png' style='margin-left: 6px;margin-top: -12px;'></span><div class="col-lg-12" style="margin-left: 41px;margin-top: -34px;"><p id="">Are you sure to change status?</p></div>  
                        </div>
                    </div>
                    <div class="confirmButton"></div>                   
                </div>
            </div>
        </div>
        <div class="TamFooter">&copy; Tambora System, 2017. All Rights Reserved.</div>
    </body>
    <script src="../js/geographyDetailsAd.js"></script>
    <script src="../js/serviceTypeConfig.js"></script>
    <script src="../js/mnoInterface.js"></script>
    <script  src="../js/newUpload.js"></script>
</html>
