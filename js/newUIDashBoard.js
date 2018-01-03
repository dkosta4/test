/*
 Document   : newUIDashBaord js file
 File Renamed on : Sep 13, 2017, 4:00:02 PM
 
 Author     : mithunk@sawridge.com
 */

var selectedSideMenuButtonId = "1";
var loggedInEntityName = '';
var loggedInEntityId = '';
var loggedInUserRole = '';
var sessionId = $.cookie('jSessionId');
$(document).ready(function () {
//load the header
    $("#header_id").load('../jsp/header.jsp');
    loggedInEntityName = $.cookie('entityName');
    loggedInUserRole = $.cookie('userRole');
    if ('MNO_ADMIN' == loggedInUserRole) {
        loggedInEntityId = $.cookie('mnoId');
    }
    if ("INTERNAL" == loggedInUserRole) {
        loggedInEntityId = $.cookie('cdnId');
    }
    if ("MAINTENANCE_USER" == loggedInUserRole) {
        loggedInEntityId = $.cookie('mnoId');
    }

//Setting looged in username as title
    $('#titleHeader').html(loggedInEntityName);
    //selecting report duration last7days - default scenario
    $('#reportDurationValue').html('LAST 7 DAYS &nbsp; <img align=right src="../images/droplist-downarrow.png" >');
    updateSummaryData('last7days');
    getGraphDataAndDraw();
    //create side bar menu
    getSidebarMenus();
//        $('#tab-container').easytabs({
//            animate: true,
//            animationSpeed: 500,
//            panelActiveClass: "active-content-div",
//            collapsedByDefault: true,
//            deferRender: true,
//            updateHash: false
//        });
    if(respKeys.messageDesc!==undefined){
         $("#tab-container-div").addClass("hidden");
        $("#right_tab_container").addClass("hidden");
        $('#noAccess').show();
        
//        setTimeout(function () {
            var sidebarHeight = $("#sidebarContent").height();
//            alert(sidebarHeight);
            if (sidebarHeight > 425) {
                $("#mainContent").css({"minHeight": sidebarHeight + "px"});
            } else{
                $("#mainContent").css({"minHeight": "419px"});
                $("#sidebarContent").css({"minHeight": "419px"});
            }
//        }, 1000);
        return;
    }
//    if(respKeys.size()===0){
//        alert("size 0");
//    }
    setTimeout(function () {
        var contentHeight = $("#mainContent").height();
        contentHeight = contentHeight + 5;
        $("#sidebarContent").css({"height": contentHeight});
    }, 800)

});
function submitsidebarMenu(appId) {

    submitForm('internal', appId);
}

function getChartOptions()
{
    var options = {
        title: '', titleTextStyle: {color: 'white'},
        isStacked: 'true',
        //backgroundColor: '#29326D',
        backgroundColor: {fill: '#192e5d'}, //#2C4887
        width: 260,
        height: 80,
        hAxis: {textStyle: {color: 'transparent'}, baslineColor: 'transparent'},
        vAxis: {gridlines: {color: 'transparent'}, textStyle: {color: 'transparent'}},
        legend: 'none',
        colors: ['white', '#004422', '#29326D'],
        focusTarget: 'category',
        series: [
            {color: 'white', visibleInLegend: false}

        ],
        is3D: true
                //chartArea:{backgroundColor: 'yellow', stroke: '#333'}
    };
    return options;
}


function getGraphDataAndDraw() {
    google.load("visualization", "1", {packages: ["corechart", "bar"]});
    google.charts.load('current', {'packages': ['corechart', 'table']});
    google.charts.load('current', {'packages': ['table']});
    var options = getChartOptions();
    google.setOnLoadCallback(drawCombo);
    google.charts.setOnLoadCallback(drawTotalVideoChart);
    google.charts.setOnLoadCallback(drawPercentageSuccessChart);
    google.charts.setOnLoadCallback(drawDataVolumeChart);
    google.charts.setOnLoadCallback(drawRevenueChart);
    google.charts.setOnLoadCallback(drawTable);
    //draw firstchart QoE
    function drawTotalVideoChart() {

        $.ajax({
            url: baseURL + 'account/masterReportControllertest/dashboardReport',
            method: 'get',
            data: {reportDuration: 'last7days', reportType: '7daysgraph_requestcount', mnoID: loggedInEntityId, jsessionId:sessionId},
            dataType: 'json',
            cache: false,
            async: false,
            success: function (response) {
                console.log(response);
                var finalTotalVideo = new Array();
                data = response;
                console.log(" before conversion  drawTotalVideoChart", JSON.stringify(data));
                var key = data.length - 1;
                finalTotalVideo.push(data[0]);
                for (var i = 1; i < data.length - 1; i++)
                {
                    var totalVideo = [];
                    totalVideo.push(data[i][0]);
                    data[i][1] = parseFloat(data[i][1]);
                    var temptotalVideo = {};
                    temptotalVideo.v = data[i][1];
                    if (data[key][0] == 0) {
                        temptotalVideo.f = data[i][1];
                    } else {
                        temptotalVideo.f = data[i][1] + data[key][0];
                    }
                    totalVideo.push(temptotalVideo);
//                    alert(JSON.stringify(totalVideo) + " ------------------ ");
                    finalTotalVideo.push(totalVideo);
                }

//                alert(JSON.stringify(finalTotalVideo) + " =================== >");
                console.log(" after conversion  drawTotalVideoChart", JSON.stringify(finalTotalVideo));
                data = google.visualization.arrayToDataTable(finalTotalVideo);
                var chart = new google.visualization.AreaChart(document.getElementById('QoE_div'));
                chart.draw(data, options);
            },
            error: function (xhr, textStatus, errorThrown) {
            }
        });
    }

    function drawPercentageSuccessChart() {

        $.ajax({
            url: baseURL + 'account/masterReportControllertest/dashboardReport',
            method: 'get',
            data: {reportDuration: 'last7days', reportType: '7daysgraph_success', mnoID: loggedInEntityId,jsessionId:sessionId},
            dataType: 'json',
            cache: false,
            async: false,
            success: function (response) {
                console.log(response);
                var drawPercentageSuccess = new Array();
                data = response;
                var key = data.length - 1;
                drawPercentageSuccess.push(data[0]);
                console.log(" before conversion  ", data);
                for (var i = 1; i < data.length - 1; i++)
                {
                    var percentageSuccess = [];
                    percentageSuccess.push(data[i][0]);
                    data[i][1] = parseFloat(data[i][1]);
                    var tempSuccess = {};
                    tempSuccess.v = data[i][1];
                    tempSuccess.f = data[i][1] + "%";
                    percentageSuccess.push(tempSuccess);
                    drawPercentageSuccess.push(percentageSuccess);
                }
                console.log(" after conversion  ", data);
                data = google.visualization.arrayToDataTable(drawPercentageSuccess);
                var chart1 = new google.visualization.AreaChart(document.getElementById('QoE_div1'));
                chart1.draw(data, options);
            },
            error: function (xhr, textStatus, errorThrown) {
                //
            }
        });
    }

    function drawDataVolumeChart() {

        $.ajax({
            url: baseURL + 'account/masterReportControllertest/dashboardReport',
            method: 'get',
            data: {reportDuration: 'last7days', reportType: '7daysgraph_dv', mnoID: loggedInEntityId, jsessionId:sessionId},
            dataType: 'json',
            cache: false,
            async: false,
            success: function (response) {
                console.log(response);
                var drawDataVolumeChart = new Array();
                data = response;
                console.log(" before conversion  ", data);
                var key = data.length - 1;
                drawDataVolumeChart.push(data[0]);
                for (var i = 1; i < data.length - 1; i++)
                {
                    var dataVolumeChart = [];
                    dataVolumeChart.push(data[i][0]);
                    data[i][1] = parseFloat(data[i][1]);
                    var tempVolumeChart = {};
                    tempVolumeChart.v = data[i][1];
                    if (data[key][0] == 0) {
                        tempVolumeChart.f = data[i][1];
                    } else {
                        tempVolumeChart.f = data[i][1] + data[key][0];
                    }
                    dataVolumeChart.push(tempVolumeChart);
                    drawDataVolumeChart.push(dataVolumeChart);
                }
                data.splice(-1, 1);
                console.log(" after conversion  ", data);
                data = google.visualization.arrayToDataTable(drawDataVolumeChart);
                var chart2 = new google.visualization.AreaChart(document.getElementById('QoE_div2'));
                chart2.draw(data, options);
            },
            error: function (xhr, textStatus, errorThrown) {
                //
            }
        });
    }

    function drawRevenueChart() {

        $.ajax({
            url: baseURL + 'account/masterReportControllertest/dashboardReport',
            method: 'get',
            data: {reportDuration: 'last7days', reportType: '7daysgraph_rv', mnoID: loggedInEntityId, jsessionId:sessionId},
            dataType: 'json',
            cache: false,
            async: false,
            success: function (response) {
                console.log(response);
                var drawRevenueChart = new Array();
                data = response;
                console.log(" before conversion  ", data);
                var key = data.length - 1;
                drawRevenueChart.push(data[0]);
                for (var i = 1; i < data.length - 1; i++)
                {
                    var RevenueChart = [];
                    RevenueChart.push(data[i][0]);
                    data[i][1] = parseFloat(data[i][1]);
                    var tempRevenueChart = {};
                    tempRevenueChart.v = data[i][1];
                    if (data[key][0] == 0) {
                        tempRevenueChart.f = data[i][1];
                    } else {
                        tempRevenueChart.f = data[i][1] + data[key][0];
                    }
                    RevenueChart.push(tempRevenueChart);
                    drawRevenueChart.push(RevenueChart);
                }
//                data.splice(-1, 1);
                console.log(" after conversion  ", data);
                data = google.visualization.arrayToDataTable(drawRevenueChart);
                var chart3 = new google.visualization.AreaChart(document.getElementById('QoE_div3'));
                chart3.draw(data, options);
            },
            error: function (xhr, textStatus, errorThrown) {
            }
        });
    }

    function drawQoE1Chart() {

        $.ajax({
            url: baseURL + 'account/masterReportControllertest/dashboardReport',
            method: 'get',
            data: {reportDuration: 'previousday', reportType: '7daysgraph_requestcount', mnoID: loggedInEntityId, jsessionId:sessionId},
            dataType: 'json',
            cache: false,
            async: false,
            success: function (response) {
                console.log(response);
                data = response;
                console.log(" before conversion  ", data);
                for (var i = 1; i < data.length; i++)
                {
                    for (var j = 1; j < data[i].length; j++)
                    {
                        data[i][j] = parseFloat(data[i][j]);
                    }
                }
                data.splice(-1, 1);
                console.log(" after conversion  ", data);
                data = google.visualization.arrayToDataTable(data);
                var chart4 = new google.visualization.AreaChart(document.getElementById('QoE_div4'));
                chart4.draw(data, options);
            },
            error: function (xhr, textStatus, errorThrown) {
                //
            }
        });
    }

    function drawQoE2Chart() {

        $.ajax({
            url: baseURL + 'account/masterReportControllertest/dashboardReport',
            method: 'get',
            data: {reportDuration: 'previousday', reportType: '7daysgraph_requestcount', mnoID: loggedInEntityId, jsessionId:sessionId},
            dataType: 'json',
            cache: false,
            async: false,
            success: function (response) {
                console.log(response);
                data = google.visualization.arrayToDataTable(response);
                var chart = new google.visualization.AreaChart(document.getElementById('QoE_div5'));
                chart.draw(data, options);
            },
            error: function (xhr, textStatus, errorThrown) {
                //
            }
        });
    }



    function drawCombo() {

        getDualGraph();
    }

}


function  drawDualGraph(dataRows)
{

    var colorPallette = ['#273746', '#707B7C', '#dc7633', '#f1c40f', '#1e8449', '#2874a6', '#6c3483', '#922b21'];
    var data = new google.visualization.DataTable();
    data.addColumn('number', 'Day');
    data.addColumn('number', 'Data Volume');
    data.addColumn('number', 'Revenue');
    var modifiedData = new Array();
    var ticksArr = new Array();
    var dvticksArr = new Array();
    var rticksArr = new Array();
    for (var i = 0; i < (dataRows.length); i++)
    {
        var dataPoint = dataRows[i];
        var tempArr = new Array();
        var date = getDateFromString(dataPoint[0]);
        var dayOfDate = getDayOfDate(date);
        var startingElement = {};
        var startingElementarr = {};
        DtlrTo1 = dataPoint[0].split("-")
        var Tyyyy = DtlrTo1[0];
        var Tmm = DtlrTo1[1];
        var Tdd = DtlrTo1[2];
        var selfrmDate1 = new Date(Tyyyy + ',' + Tmm + ',' + Tdd);
        var month = selfrmDate1.toString().substring(4, 7);
        var day = selfrmDate1.toString().substring(8, 10);
        var yy = selfrmDate1.toString().substring(10, 15);
        startingElement.v = i;
        startingElementarr.v = i;
        startingElement.f = day + " " + month + " " + yy;
        startingElementarr.f = month + "  " + day + " , " + yy;
        ticksArr.push(startingElement);
        tempArr.push(startingElementarr);
        var dvElement = {};
        dvElement.v = dataPoint[1];
        if (dataPoint[1] !== 0) {
            dvElement.f = DtVolConsolidate(dataPoint[1]);
        } else
        {
            dvElement.f = '0';
        }

        // tempArr.push(dvElement);

        var rElement = {};
        rElement.v = dataPoint[2];
        if (dataPoint[2] !== 0) {
            rElement.f = getKMB(dataPoint[2], 3);
        } else
        {
            rElement.f = '0';
        }
        dvticksArr.push(dvElement);
        tempArr.push(dvElement);
        rticksArr.push(rElement);
        tempArr.push(rElement);
        modifiedData.push(tempArr);
    }
    
    data.addRows(modifiedData);
    // alert(JSON.stringify(ticksArr))
    var options = {
        height: 280,
//        title: ' Data Volume Vs Revenue (Last 7 Days)', titleTextStyle: {color: 'white', bold: false, fontSize: 22},
        seriesType: 'bars',
        aggregationTarget: 'category',
        series: {
            0: {type: 'bar', color: '#B87A00', targetAxisIndex: 0},
            1: {type: 'area', color: '#DBB84F', targetAxisIndex: 1, lineWidth: '5', areaOpacity: '0.04'},
        },
        vAxes: {
            0: {
                viewWindow: {
                    min: 0.001
                },
                titleTextStyle: {color: 'white'},
                title: 'Data Volume',
                ticks: dvticksArr

            },
            1: {baselineColor: 'white',
                viewWindow: {
                    min: 0.001
                },
                //format:'short'
                titleTextStyle: {color: 'white'},
                title: 'Revenue',
                ticks: rticksArr
            }
        },
        vAxis: {
            textStyle: {color: 'white'},
            minValue: -4,
            baselineColor: 'white',
            gridlines: {color: 'transparent', count: 7}

        },
        hAxis: {
            slantedText: true,
            slantedTextAngle: 16,
            textStyle: {color: 'white'},
            baselineColor: 'white',
            minValue: -0.7,
            allowContainerBoundaryTextCufoff: true,
            baseline: -0.6,
            titleTextStyle: {color: 'white'},
            gridline: {color: 'white', count: 7},
            ticks: ticksArr,
            format: 'dd MMM yyyy',
            //minorGridlines: {count: 0},

        },
        areaOpacity: '0.05',
        bar: {groupWidth: '40%'},
        backgroundColor: '#192e5d',
        legend: {position: 'bottom', textStyle: {color: 'white', fontSize: 12}, maxLines: 3, alignment: 'start'},
//        explorer: {axis: 'horizontal'},
        explorer: {actions: ['dragToZoom', 'rightClickToReset']},
        focusTarget: 'category',
        curveType: 'none'


    };
    
    var chart = new google.visualization.ComboChart(document.getElementById('topGeography'));
    chart.draw(data, options);
//    $("text:contains(" + options.title + ")").attr({'x':'10', 'y':'20'});
}

function drawTable() {

    $.ajax({
        url: baseURL + 'account/masterReportControllertest/dashboardReport',
        method: 'get',
        data: {reportDuration: 'last7days', reportType: 'top5', mnoID: loggedInEntityId, jsessionId:sessionId},
        dataType: 'json',
        cache: false,
        async: false,
        success: function (response) {
            console.log(response);
            $('#table_div').DataTable({
                data: response.slice(1, response.length),
                columns: [
                    {title: "Geography Name"},
                    {title: "Revenue (In $)"}

                ],
                'columnDefs': [
                    {'visible': false, "targets": 2, "defaultContent": ""},
                    {"className": "dt-center", "targets": "_all"},
                    {
                        'targets': 2,
                        'searchable': false,
                        'orderable': false,
                        'visible': false,
                        'className': 'dt-body-center',
                        'render': function (data, type, full, meta) {
                        }
                    }],
                order: [[1, 'desc']],
                "bDestroy": true,
                "paging": false,
                "ordering": true,
                "info": false,
                scrollY: '50vh',
                scrollCollapse: true,
                searching: false
            });
            $('#table_div_wrapper th').addClass('tableHeader');
            $('#table_div_wrapper td').addClass('tableCell');
        },
        error: function (xhr, textStatus, errorThrown) {
            //
        }
    });
}

function updateSummaryData(reportDuration)
{
    if (reportDuration == "last7days") {
        $('#reportDurationValue').html('LAST 7 DAYS &nbsp; <img align=right src="../images/droplist-downarrow.png" >');
    }
    if (reportDuration == "previousday") {
        $('#reportDurationValue').html('PREVIOUS DAY &nbsp; <img align=right src="../images/droplist-downarrow.png" >');
    }
    if (reportDuration == "last30days") {
        $('#reportDurationValue').html('LAST 30 DAYS &nbsp; <img align=right src="../images/droplist-downarrow.png" >');
    }
//    var reportDuration = $('#reportDuration').val(val);
    if (reportDuration == "currentday") {
        $('#reportDurationValue').html('CURRENT DAY &nbsp; <img align=right src="../images/droplist-downarrow.png" >');
        $('#qoeDiv2').hide();
        $('#qoeDiv4').hide();
        $('#qoeDiv6').hide();
        $('#qoeDiv8').hide();
    } else {
        $('#qoeDiv2').show();
        $('#qoeDiv4').show();
        $('#qoeDiv6').show();
        $('#qoeDiv8').show();
    }

    $.ajax({
        url: baseURL + 'account/masterReportControllertest/dashboardReport',
        method: 'get',
        data: {reportDuration: reportDuration, reportType: 'summary', mnoID: loggedInEntityId, jsessionId:sessionId},
        dataType: 'json',
        cache: false,
        async: false,
        success: function (response) {
            console.log(response + " response widget");
            if (response[1][0] == "") {
                $('#qoeDiv1').html('0');
            } else {
                $('#qoeDiv1').html(response[1][0]);
                $('#qoeDiv1').prop("title",$('#reportDurationValue').text());
                $('#qoeDiv2').html("(" + response[1][1] + ")");
                if($('#reportDurationValue').text().indexOf('LAST')==0)
                    $('#qoeDiv2').prop("title",'LAST TO ' + $('#reportDurationValue').text());
                else
                    $('#qoeDiv2').prop("title",'DAY BEFORE ' + $('#reportDurationValue').text());
            }

            if (response[1][1] == "") {
                $('#qoeDiv1').title("(0)");
                $('#qoeDiv1').prop("title",$('#reportDurationValue').text());
                $('#qoeDiv2').html("(0)");
                if($('#reportDurationValue').text().indexOf('LAST')==0)
                    $('#qoeDiv2').prop("title",'LAST TO ' + $('#reportDurationValue').text());
                else
                    $('#qoeDiv2').prop("title",'DAY BEFORE ' + $('#reportDurationValue').text());
            } else {
                $('#qoeDiv1').html(response[1][0]);
                $('#qoeDiv1').prop("title",$('#reportDurationValue').text());
                $('#qoeDiv2').html("(" + response[1][1] + ")");
                if($('#reportDurationValue').text().indexOf('LAST')==0)
                    $('#qoeDiv2').prop("title",'LAST TO ' + $('#reportDurationValue').text());
                else
                    $('#qoeDiv2').prop("title",'DAY BEFORE ' + $('#reportDurationValue').text());
            }

            if (response[1][2] == '0') {
                $('#qoeDiv3').html("0%");
            } else {
                $('#qoeDiv3').html(response[1][2] + "%");
                $('#qoeDiv3').prop("title",$('#reportDurationValue').text());
                $('#qoeDiv4').html("(" + response[1][3] + "%)");
                if($('#reportDurationValue').text().indexOf('LAST')==0)
                    $('#qoeDiv4').prop("title",'LAST TO ' + $('#reportDurationValue').text());
                else
                    $('#qoeDiv4').prop("title",'DAY BEFORE ' + $('#reportDurationValue').text());
            }

            if (response[1][3] == "") {
                $('#qoeDiv4').html("(0%)");
            } else {
                $('#qoeDiv3').html(response[1][2] + "%");
                $('#qoeDiv3').prop("title",$('#reportDurationValue').text());
                $('#qoeDiv4').html("(" + response[1][3] + "%)");
                if($('#reportDurationValue').text().indexOf('LAST')==0)
                    $('#qoeDiv4').prop("title",'LAST TO ' + $('#reportDurationValue').text());
                else
                    $('#qoeDiv4').prop("title",'DAY BEFORE ' + $('#reportDurationValue').text());
            }

            if (response[1][4] == "") {
                $('#qoeDiv5').html('0');
            } else {
                $('#qoeDiv5').html(response[1][4]);
                $('#qoeDiv5').prop("title",$('#reportDurationValue').text());
                $('#qoeDiv6').html("(" + response[1][5] + ")");
                if($('#reportDurationValue').text().indexOf('LAST')==0)
                    $('#qoeDiv6').prop("title",'LAST TO ' + $('#reportDurationValue').text());
                else
                    $('#qoeDiv6').prop("title",'DAY BEFORE ' + $('#reportDurationValue').text());
            }

            if (response[1][5] == "") {
                $('#qoeDiv6').html("(0)");
            } else {
                $('#qoeDiv5').html(response[1][4]);
                $('#qoeDiv5').prop("title",$('#reportDurationValue').text());
                $('#qoeDiv6').html("(" + response[1][5] + ")");
                if($('#reportDurationValue').text().indexOf('LAST')==0)
                    $('#qoeDiv6').prop("title",'LAST TO ' + $('#reportDurationValue').text());
                else
                    $('#qoeDiv6').prop("title",'DAY BEFORE ' + $('#reportDurationValue').text());
            }

            if (response[1][6] == "") {
                $('#qoeDiv7').html('0');
            } else {
                $('#qoeDiv7').html(response[1][6]);
                $('#qoeDiv7').prop("title",$('#reportDurationValue').text());
                $('#qoeDiv8').html("(" + response[1][7] + ")");
                if($('#reportDurationValue').text().indexOf('LAST')==0)
                    $('#qoeDiv8').prop("title",'LAST TO ' + $('#reportDurationValue').text());
                else
                    $('#qoeDiv8').prop("title",'DAY BEFORE ' + $('#reportDurationValue').text());
            }

            if (response[1][7] == "") {
                $('#qoeDiv8').html("(0)");
            } else {
                $('#qoeDiv7').html(response[1][6]);
                $('#qoeDiv7').prop("title",$('#reportDurationValue').text());
                $('#qoeDiv8').html("(" + response[1][7] + ")");
                if($('#reportDurationValue').text().indexOf('LAST')==0)
                    $('#qoeDiv8').prop("title",'LAST TO ' + $('#reportDurationValue').text());
                else
                    $('#qoeDiv8').prop("title",'DAY BEFORE ' + $('#reportDurationValue').text());
            }

        },
        error: function (xhr, textStatus, errorThrown) {
        }
    });
}

function getDualGraph()
{
    $.ajax({
        url: baseURL + 'account/masterReportControllertest/dashboardReport',
        method: 'get',
        data: {reportDuration: 'last7days', reportType: 'dualGraph', mnoID: loggedInEntityId, jsessionId:sessionId},
        dataType: 'json',
        cache: false,
        async: false,
        success: function (response) {
            console.log("dual graph -------------------------------------------------- "+response);
            response = response.splice(1);
            drawDualGraph(response); // splice(index) function wil take the array from given index
        },
        error: function (xhr, textStatus, errorThrown) {
        }
    });
}

function getDateFromString(dateString)
{
    var yearMonthDatArr = dateString.toString().split('-')
    var tempYear = parseInt(yearMonthDatArr[0]);
    var tempMonth = parseInt(yearMonthDatArr[1]);
    var tempDate = parseInt(yearMonthDatArr[2]);
    var date = new Date();
    date.setFullYear(tempYear);
    date.setMonth(tempMonth - 1);
    date.setDate(tempDate);
    return date;
}

function getDayOfDate(date)
{
    var dayInt = date.getDay();
    var dayString;
    switch (dayInt)
    {
        case 0:
            dayString = "Sun";
            break;
        case 1:
            dayString = "Mon";
            break;
        case 2:
            dayString = "Tue";
            break;
        case 3:
            dayString = "Wed";
            break;
        case 4:
            dayString = "Thu";
            break;
        case 5:
            dayString = "Fri";
            break;
        case 6:
            dayString = "Sat";
            break;
    }

    return dayString;
}

function DtVolConsolidate(value)
{
    var log1024 = Math.log(1000);
    this.scaleSuffix = [
        "MB", "GB", "TB", "PB", "EB", "ZB", "YB"
    ];
    if (value > 1) {
        var valueBytes = value;
        var valueKB = valueBytes / 1024;
        var scaleSuffix;
        var scaledValue;
        if (1 < valueKB && valueKB < 1000)
        {
            scaleSuffix = "KB";
            scaledValue = valueKB;
        } else if (valueKB < 1)
        {
            scaleSuffix = "BY";
            scaledValue = valueBytes;
        } else
        {
            value = valueKB / 1000; //Converting KB to MB
            var scale = Math.floor(Math.log(value) / log1024);
            scaleSuffix = this.scaleSuffix[scale];
            scaledValue = value / Math.pow(1000, scale);
        }
        return Math.round(scaledValue * 100) / 100 + " " + scaleSuffix;
    } else {
        return value;
    }
}

function getKMB(val, df) {
    var convertedVal = '';
    if (val / (1000 * 1000 * 1000 * 1000) > 1) {
        convertedVal = parseFloat(val / (1000 * 1000 * 1000 * 1000)).toFixed(df) + " T";
    } else if (val / (1000 * 1000 * 1000) > 1) {
        convertedVal = parseFloat(val / (1000 * 1000 * 1000)).toFixed(df) + " B";
    } else if (val / (1000 * 1000) > 1) {
        convertedVal = parseFloat(val / (1000 * 1000)).toFixed(df) + " M";
    } else if (val / (1000) > 1) {
        convertedVal = parseFloat(val / (1000)).toFixed(df) + " K";
    } else {
        convertedVal = val > 0 ? parseFloat(val).toFixed(df) : "0";
    }
    return convertedVal;
}
