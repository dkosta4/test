<style type="text/css">
    #mno_user_table td {
        border-top: 1px;
    }
</style>
<html lang="en">
    <head>
        <link href="../css/newUIconfig.css" rel="stylesheet" type="text/css" />
    </head>
</html>
<div class="row">
    <div class="col-sm-12">
        <!--<section class="">-->
        <center>
            <h4>
                <strong class="alert-success"><b class="navbar-default"><p id="result"></p></b></strong>
                <strong class="alert-danger"><b class="navbar-default"><p id="fails"></p></b></strong>
            </h4>
        </center>        
        <label type="button" id="mno_add_user_btn" value="Add" onclick="javascript:loadMNOUserFile();"  title="add MNO user" class="btnPrimary" style="cursor: pointer;">Add</label>
         <label type="button" class="btnPrimary" id="upload2" style="cursor: pointer;cursor: hand;margin-left: 3px;margin-top: 16px;"title="Upload">Upload</label>
        <table id="mno_user_table" class="display" width="100%"></table>

        <!--</section>-->

    </div>
</div>

<!-- Add MNO User Modal -->
<div class="modal" id="add_mno_user_model" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content dialogBox">
<!--            <div class="dialogHeader">
                <button  class="close btn btnPrimary" data-dismiss="modal">
                    <img id="u6_img" class="img " src="../images/close-dialog.png">
                </button>
                <h4 class="modal-title label_color" id="au_h3_add_mno_user">Add Mno User</h4>
            </div>-->
            <div class="dialogHeader" style="border:0px; border-bottom: 1px solid #CDD7E5">
                <lable type="button" class="close" data-dismiss="modal" aria-hidden="true"><img id="u6_img" src="../images/modal-close.png"></lable>
                <h4 class="modal-title" id="ModelHeader" style="margin-left:-5px;"><b>Add Mno User</b></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        
                        <div class="row" style="margin-top: 15px;">
                            <div class="col-lg-6" style="">
                                <label class="dialogGeneralLabel">Display Name</label>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" id="strUserName" class="inpueTextstyle"  placeholder="Name" name="userName" maxlength="50" onblur="checkInputField('userName')"/>
                            </div>
                        </div>
                        
                        <div class="row" style="margin-top: 15px;">
                            <div class="col-lg-6" style="">
                                <label class="dialogGeneralLabel">Login-ID </label>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" id="strLoginId" class="inpueTextstyle" placeholder="Login-ID" name="loginId" maxlength="50" onblur="checkInputField('loginId')" />
                            </div>
                        </div>
                        
                        <div class="row" style="margin-top: 15px;">
                            <div class="col-lg-6" style="">
                                <label class="dialogGeneralLabel">E-Mail</label>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" id="strEmail" class="inpueTextstyle" placeholder="Email Id" name="email" maxlength="50" onblur="checkInputField('email')"/>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 15px;">
                            <div class="col-lg-6" style="">
                                <label class="dialogGeneralLabel">Phone No </label>
                            </div>
                            <div class="col-lg-2">
                                <span class="navbar-left" style="color: black;">
<!--                                    <select class="selectpicker" data-width="140px" style="cursor: pointer;cursor: hand;width: 174px;" data-size="8" id="isd_code" name="phoneNo" maxlength="5" >
                                    </select>-->
                                
                                <input list="phoneNo" id="isd_code" name="phoneNo" type="text" maxlength="5"
                                       placeholder="Code" title="Country Code" style="width: 100%;color: #000;cursor: pointer;height: 28px;border: ivory;background-color: #EDEDED;" >
                                        <datalist id="phoneNo">
                                            <select class="selectpicker" style="color: #726c6c;cursor: pointer;" name="countrycode" id="countrycode">
                                            </select>
                                        </datalist>
                                </span>
                            </div>
                            <div class="col-lg-3" style="margin-left: -22px;">
                                <span class="navbar-left" style="color: black;">
                                    <input type="text" class="inpueTextstyle" placeholder="phone no" id="phone_no" name="phone_no" style="width: 100%;" maxlength="9" onblur="checkInputField('phoneNo')">
                                </span>
                            </div>
                        </div>
                        
                        <div class="row" style="margin-top: 15px;">
                            <div class="col-lg-6" style="">
                                <label class="dialogGeneralLabel">Select Role</label>
                            </div>
                            <div class="col-lg-6">
                                <span class="navbar-left" style="color: black;">
<!--                                    <select class="selectpicker" id="MNC_select_field" style="cursor: pointer;cursor: hand;width: 174px; color: #726c6c" data-width="140px" title="MNO MNC">
                                        <option>Select MNC</option>
                                    </select>-->
                                    <select class="selectpicker" id="mno_user_role_id" name="userRoleId" style="color: #000;cursor: pointer;width: 200px;">
                                        <!--<option>Select Role</option>-->
                                    </select>
                                </span>
                            </div>
                        </div>
                        
                        
                        
<!--                        <div class="form" >
                            <form class="form-validate form-horizontal " id="register_form" action="" name="addMNOUser">
                                <center>
                                    <h4>
                                        <strong class="alert-success"><b class="navbar-default"><p id="result"></p></b></strong>
                                        <strong class="alert-danger"><b class="navbar-default"><p id="fails"></p></b></strong>
                                    </h4>
                                </center>   
                                <div class="form-group ">
                                    <label for="strUserName" class="control-label col-sm-4 label_color" id="mno_form_display_name">Display Name  </label>
                                    <div class="col-sm-7">
                                        <input class=" form-control  round-input" id="strUserName" name="userName" type="text" placeholder="Name"/>
                                    </div>                                                
                                </div>
                                 Login Id----------------------
                                <div class="form-group ">
                                    <label for="strLoginId" class="control-label col-sm-4 label_color" id="mno_form_login_id">Login-ID  </label>
                                    <div class="col-sm-7">
                                        <input class=" form-control  round-input" id="strLoginId" name="loginId" type="text" placeholder="User-ID"/>
                                        <span id="failse1"></span>
                                    </div>                                                
                                </div>
                                ------Email-----
                                <div class="form-group">
                                    <label for="strEmail" class="control-label col-sm-4 label_color" id="mno_form_e_mail">E-Mail  </label>
                                    <div class="col-sm-7">
                                        <input type="text" id="strEmail" class="form-control  round-input" placeholder="Email Id" name="email"/>
                                        <span id="failse2"></span>
                                    </div>
                                </div>
                                ---------Phone--------

                                <div class="form-group" >
                                    <label for="phoneNumber" class="control-label col-sm-4 label_color" id="mno_form_phone_no">Phone No  </label>
                                    <div class="col-sm-2">
                                        <input list="phoneNo" class=" form-control  round-input" id="isd_code" name="phoneNo" type="text" maxlength="5"
                                               placeholder="Country Code" required>
                                        <datalist id="phoneNo">
                                            <select name="countrycode" id="countrycode">
                                            </select>
                                        </datalist>
                                    </div>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control  round-input" placeholder="phone no" id="phone_no" name="phone_no" maxlength="9">
                                    </div>
                                </div>

                                ------------UserRole---------------

                                <div class="form-group " id="select_role1">
                                    <label for="strUserRole" class="control-label col-sm-4 label_color" id="mno_select_user_role" >Select Role  </label>
                                    <div class="col-sm-8">
                                        <select class="select_box_css" id="mno_user_role_id" name="userRoleId" style="color: #726c6c;">
                                        </select>
                                    </div>
                                </div> 
                            </form>
                        </div>-->

                    </div>

                </div>
            </div>
            <div class="dialogFooterWithButtons">
                <label id="au_form_mno_add" type="button" class="btnPrimary pull-right modalBtnHeight" onclick="addMNOUser()" style="cursor: pointer;">Add</label>
                <label id="cancel" type="button" class="btnPrimary pull-right modalBtnHeight" data-dismiss="modal" style="cursor: pointer;">Cancel</label>
            </div>
        </div>

    </div>
</div>

<!-- Update MNO User Modal -->
<div class="modal " id="update_mno_user_model" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content dialogBox">
<!--            <div class="dialogHeader">
                <button  class="close btn btnPrimary" data-dismiss="modal">
                    <img id="u6_img" class="img " src="../images/close-dialog.png">
                </button>
                <h4 class="modal-title label_color">Update User</h4>
            </div>-->
            <div class="dialogHeader" style="border:0px; border-bottom: 1px solid #CDD7E5">
                <lable type="button" class="close" data-dismiss="modal" aria-hidden="true"><img src="../images/modal-close.png"></lable>
                <h4 class="modal-title" id="ModelHeader" style="margin-left:-5px;"><b>Update User</b></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        
                        <div class="row" style="margin-top: 15px;">
                            <div class="col-lg-6" style="">
                                <label class="dialogGeneralLabel">Display Name</label>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" id="update_strUserName" class="inpueTextstyle"  placeholder="Name" name="userName" maxlength="50" onchange="checkUpdateInputField('userName')"/>
                            </div>
                        </div>
                        
                        
                        <div class="row" style="margin-top: 15px;">
                            <div class="col-lg-6" style="">
                                <label class="dialogGeneralLabel">E-Mail</label>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" id="update_strEmail" class="inpueTextstyle" placeholder="Email Id" name="email" maxlength="50" onchange="checkUpdateInputField('email')"/>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 15px;">
                            <div class="col-lg-6" style="">
                                <label class="dialogGeneralLabel">Phone No </label>
                            </div>
                            <div class="col-lg-2">
                                <span class="navbar-left" style="color: black;">
<!--                                    <select class="selectpicker" data-width="140px" style="cursor: pointer;cursor: hand;width: 174px;" data-size="8" id="isd_code" name="phoneNo" maxlength="5" >
                                    </select>-->
                                
                                <input list="phoneNo" id="update_isd_code" name="phoneNo" type="text" maxlength="5"
                                       placeholder="Code" title="Country Code" style="width: 100%;color: #000;cursor: pointer;height: 28px;background-color: #EDEDED;border: ivory;" >
                                        <datalist id="phoneNo">
                                            <select class="selectpicker" style="color: #726c6c;cursor: pointer;" name="countrycode" id="update_countrycode">
                                            </select>
                                        </datalist>
                                </span>
                            </div>
                            <div class="col-lg-3" style="margin-left: -22px;">
                                <span class="navbar-left" style="color: black;">
                                    <input type="text" class="inpueTextstyle" placeholder="phone no" id="update_phone_no" name="phone_no" style="width: 100%;" maxlength="9" onchange="checkUpdateInputField('phoneNo')">
                                </span>
                            </div>
                        </div>
                        
                        <div class="row" style="margin-top: 15px;">
                            <div class="col-lg-6" style="">
                                <label class="dialogGeneralLabel">Status</label>
                            </div>
                            <div class="col-lg-6">
                                <span class="navbar-left" style="color: black;">
                                    <select class="selectpicker" id="update_strAccountStatus" name="accountStatus" style="color: #000;cursor: pointer;width: 200px;">
                                    </select>
                                </span>
                            </div>
                        </div>
                        
                        
                        
<!--                        <center>
                            <h4>
                                <strong class="alert-danger"><b class="navbar-default"><p id="fails"></p></b></strong>
                            </h4>
                        </center>-->
<!--                        <div class="form" >                                        
                            <form class="form-validate form-horizontal " id="update_user_form" action="" name="updateMNOUser">
                                <div class="form-group ">
                                    <label for="strUserName" class="control-label col-sm-4 label_color" id="uu_form_name">Name </label>
                                    <div class="col-sm-7">
                                        <input class=" form-control round-input" id="update_strUserName" name="userName" type="text" placeholder="Name"/>
                                    </div>                                                
                                </div>
                                <div class="form-group">
                                    <label for="strEmail" class="control-label col-sm-4 label_color" uu_form_e_mail>E-Mail </label>
                                    <div class="col-sm-7">
                                        <input type="text" id="update_strEmail" class="form-control round-input" placeholder="strEmail" name="email_id">
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <label for="phoneNumber" class="control-label col-sm-4 label_color" uu_form_phone_no>Phone No </label>
                                    <div class="col-sm-2">
                                        <input list="phoneNo" class=" form-control round-input" id="update_isd_code" name="phoneNo" type="text" maxlength="5"
                                               placeholder="Country Code" required>
                                        <datalist id="update_phoneNo">
                                            <select name="countrycode" id="update_countrycode">
                                            </select>
                                        </datalist>
                                    </div>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control round-input" placeholder="phone no" id="update_phone_no" name="phone_no" maxlength="9">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="strAccountStatus" class="control-label col-sm-4 label_color" uu_form_change_status>Status </label>
                                    <div class="col-sm-7">
                                        <select id="update_strAccountStatus"  class="round-input" name="accountStatus" style="color: #726c6c;width: 90px;">
                                        </select>
                                    </div>
                                </div>

                                                                <div class="form-group " id="update_select_role1">
                                                                    <label for="strUserRole" class="control-label col-sm-4 label_color" id="au_modify_user_role"style="font-weight:">UserRole </label>
                                
                                                                    <div class="col-sm-7">
                                                                        <select class=" round-input" id="update_select_role" name="userRoleId" style="color: #726c6c; width: 90px;">
                                                                        </select>
                                                                    </div>
                                                                </div> 
                            </form>
                        </div>-->
                    </div>
                </div>
            </div>
            <div class="dialogFooterWithButtons">
                <label class="btnPrimary pull-right modalBtnHeight" type="button" id="uu_form_update_btn" onclick="updateMnoUser()" >Update</label>
                <label id="cancel" type="button" class="btnPrimary pull-right modalBtnHeight" data-dismiss="modal">Cancel</label>
            </div>
        </div>

    </div>
</div>
<!--<script src="../js/jquery.validate.min.js"></script>-->
<script src="../js/mno_user_form_validator.js"></script>
<script src="../js/mno_user_list.js"></script>
<script src="../js/add_user.js"></script>
<script src="../js/update_user.js"></script>
<script  src="../js/loadRights.js"></script>
  
