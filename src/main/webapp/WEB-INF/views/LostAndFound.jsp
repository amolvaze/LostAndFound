<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">

<head>

   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="resources/css/plugins/morris.css" rel="stylesheet">
    <link rel="stylesheet"
	href="//cdn.datatables.net/1.10.5/css/jquery.dataTables.min.css">
    <!-- Custom Fonts -->
    <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>    
    <script src="resources/js/maps.js"></script> 
       <!-- jQuery -->
    <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
 <!--    <script src="resources/js/plugins/morris/raphael.min.js"></script>
    <script src="resources/js/plugins/morris/morris.min.js"></script>
    <script src="resources/js/plugins/morris/morris-data.js"></script> -->
    <script
	src="//cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js"></script>
   
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<script>
var lostObj;
var foundObj;
$(document).ready(function() {
	
	lostItems();
	//foundItems();
	console.log("Hello");
});
function showlostForm(){
	clearValues();
	$('#lostForm').modal('show');
}
function showfoundForm(){
	clearValues();
	$('#foundForm').modal('show');
}
function updateLostItem(){
	clearValues();
	$('#updateLostForm').modal('show');
	loadLostValues();
}
function updateFoundItem(){
	clearValues();
	$('#updateFoundForm').modal('show');
	loadFoundValues();
}
function loadLostValues(){
	//alert(lostObj);
	
	$("#lostitemId").append("<option>-Select-</option>");
	var name=$("#username").text();
	for(var i=0;i<lostObj.length;i++)
		{
		if(name==lostObj[i].name){
		$("#lostitemId").append("<option>"+lostObj[i].itemId+"</option>");
		}
		}
}
function loadFoundValues(){
	//alert(lostObj);
	
	var url = 'viewFoundItem';
$.ajax({
	url : url,
	type : 'GET',
	crossDomain : true,
	success : function(data) {
		var object = JSON.parse(data);
		 foundObj=object;

			$("#founditemId").append("<option>-Select-</option>");
			var name=$("#username").text();
			for(var i=0;i<foundObj.length;i++)
				{
				if(name==foundObj[i].name){
				$("#founditemId").append("<option>"+foundObj[i].itemId+"</option>");
				}
				}
	}
	});
}
function changeLost(){
	var select=$("#lostitemId option:selected").text();
	for(var i=0;i<lostObj.length;i++)
	{
	if(select==lostObj[i].itemId){
		$("#lostitemName").val(lostObj[i].itemName);
		$("#lostitemDescription").val(lostObj[i].itemDesc);
		$("#lostitemLocation").val(lostObj[i].userLocation);
	}
	}
}
function changeFound(){
	var select=$("#founditemId option:selected").text();
	
	for(var i=0;i<foundObj.length;i++)
	{
	if(select==foundObj[i].itemId){
		$("#updatefounditemName").val(foundObj[i].itemName);
		$("#updatefounditemDescription").val(foundObj[i].itemDesc);
		$("#updatefounditemLocation").val(foundObj[i].userLocation);
	}
	}
}
function updateLost(){
	$('#updateLostForm').modal('hide');
	var user = $("#userid").html();
	var id=$("#lostitemId option:selected").text();
	var name = $("#lostitemName").val();
	var description = $("#lostitemDescription").val();
	var location = $("#lostitemLocation").val();
	var url = 'updateLost?userid=' + user + '&id='+id+'&name=' + name
	+ '&description=' + description + '&location=' + location;

$
	.ajax({
		url : url,
		type : 'POST',
		crossDomain : true,
		success : function(data) {
		
			//location.reload();
			lostItems();

		},
		error : function() {
			alert(url);
		}
	});
}
function updateFound(){
	$('#updateFoundForm').modal('hide');
	var user = $("#userid").html();
	var id=$("#founditemId option:selected").text();
	var name = $("#updatefounditemName").val();
	var description = $("#updatefounditemDescription").val();
	var location = $("#updatefounditemLocation").val();
	var url = 'updateFound?userid=' + user + '&id='+id+'&name=' + name
	+ '&description=' + description + '&location=' + location;

$
	.ajax({
		url : url,
		type : 'POST',
		crossDomain : true,
		success : function(data) {
		
			//location.reload();
			foundItems();

		},
		error : function() {
			alert(url);
		}
	});
}
function insertValues() {
	$('#lostForm').modal('hide');
	var user = $("#userid").html();
	var name = $("#itemName").val();
	var description = $("#itemDescription").val();
	var location = $("#itemLocation").val();
	//alert(name+""+description+""+location);
	var url = 'insertValues?userid=' + user + '&name=' + name
			+ '&description=' + description + '&location=' + location;

	$
			.ajax({
				url : url,
				type : 'POST',
				crossDomain : true,
				success : function(data) {
				
					//location.reload();
					lostItems();

				},
				error : function() {
					alert(url);
				}
			});
}
function insertfoundValues() {
	$('#foundForm').modal('hide');
	var user = $("#userid").html();
	var name = $("#founditemName").val();
	var description = $("#founditemDescription").val();
	var location = $("#founditemLocation").val();
	//alert(name+""+description+""+location);
	var url = 'insertFoundValues?userid=' + user + '&name=' + name
			+ '&description=' + description + '&location=' + location;

	$
			.ajax({
				url : url,
				type : 'POST',
				crossDomain : true,
				success : function(data) {
				
					//location.reload();
					foundItems();

				},
				error : function() {
					alert(url);
				}
			});
}
function lostItems()
{
	$("#lost").empty();
	$("#lost").text("Lost Items");
var url = 'viewItem';
$.ajax({
	url : url,
	type : 'GET',
	crossDomain : true,
	success : function(data) {
		console.log(data);
		var obj = JSON.parse(data);
		//location.reload();
		/* for(var i=0;i<obj.length;i++)
			{
			 $("#viewTable").append("<tr><td>"+obj[i].itemId+"</td><td>"+obj[i].itemName+"</td><td>"+obj[i].itemDesc+"</td><td>"+obj[i].userLocation+"</td></tr>");
			}
		        "itemName": "Phone",
		"itemId": 1,
		"itemDesc": "Apple 5s white color ",
		"userLocation": "ECSS"
		 */
		 lostObj=obj;
		if ($.fn.dataTable.isDataTable('#mainDisplayLost')) {
			console.log("Deleting existing table mainDisplayLost");
			$("#mainDisplayLost").dataTable().fnDestroy();
		}
		 $('#mainDisplayLost').dataTable({
			"data" : obj,
			"aoColumns" : [ {
				"mData" : "itemName",
				"sTitle" : "Item"
			},{
				"mData" : "itemDesc",
				"sTitle" : "Description"
			}, {
				"mData" : "userLocation",
				"sTitle" : "Location"
			}, {
				"mData" : "name",
				"sTitle" : "Contact Name"
			}, {
				"mData" : "contact",
				"sTitle" : "Contact Number"
			}
	    	]
		}); 
	},
	error : function() {
		alert(url);
	}
	
});

}
function foundItems()
{
	$("#lost").empty();
	$("#lost").text("Found Items");
var url = 'viewFoundItem';
$.ajax({
	url : url,
	type : 'GET',
	crossDomain : true,
	success : function(data) {
		console.log(data);
		var object = JSON.parse(data);
		 //foundObj=object;
		//location.reload();
		/* for(var i=0;i<obj.length;i++)
			{
			 $("#viewTable").append("<tr><td>"+obj[i].itemId+"</td><td>"+obj[i].itemName+"</td><td>"+obj[i].itemDesc+"</td><td>"+obj[i].userLocation+"</td></tr>");
			}
		        "itemName": "Phone",
		"itemId": 1,
		"itemDesc": "Apple 5s white color ",
		"userLocation": "ECSS"
		 */
		if ($.fn.dataTable.isDataTable('#mainDisplayLost')) {
			console.log("Deleting existing table mainDisplayFound");
			$("#mainDisplayLost").dataTable().fnDestroy();
		}
		 $('#mainDisplayLost').dataTable({
			"data" : object,
			"aoColumns" : [ {
				"mData" : "itemName",
				"sTitle" : "Item"
			},{
				"mData" : "itemDesc",
				"sTitle" : "Description"
			}, {
				"mData" : "userLocation",
				"sTitle" : "Location"
			}, {
				"mData" : "name",
				"sTitle" : "Contact Name"
			}, {
				"mData" : "contact",
				"sTitle" : "Contact Number"
			}
	    	]
		}); 
	},
	error : function() {
		alert(url);
	}
});
}
function clearValues(){
	$("#itemName").val("");
	$("#itemDescription").val("");
	$("#itemLocation").val("");

	$("#founditemName").val("");
	$("#founditemDescription").val("");
	$("#founditemLocation").val("");

	$("#lostitemId").empty();
	$("#lostitemName").val("");
	$("#lostitemDescription").val("");
	$("#lostitemLocation").val("");

	$("#founditemId").empty();
	$("#updatefounditemName").val("");
	$("#updatefounditemDescription").val("");
	$("#updatefounditemLocation").val("");
}
</script>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Lost And Found</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
               
      
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${name}<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="#" onclick="lostItems();">View Lost Items</a>
                    </li>
                    <li>
                        <a href="#" onclick="foundItems();">View Found Items</a>
                    </li>
                    <li>
                        <a href="#" onclick="showlostForm();">Lost Item?</a>
                    </li>
            
                    <li>
                        <a href="#" onclick="showfoundForm();">Found Item?</a>
                    </li>
                    <li>
                        <a href="#" onclick="updateLostItem();">Update Lost Item</a>
                    </li>
                    <li>
                        <a href="#" onclick="updateFoundItem();">Update Found Item</a>
                    </li>
               
        
                   
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- /.row -->


                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading" id="lost">
                                <h3 class="panel-title">Lost Items</h3>
                            </div>
                            <div class="panel-body">
                               <!--  <div id="morris-area-chart"></div> -->
                               <div id="lostItems">
                               <table id="mainDisplayLost">
                               
                               
                               </table>
                              </div>
                            </div>
                        </div>
                    </div>
           

	<div class="modal fade" id="lostForm" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Lost Item</h4>
				</div>
				<div class="modal-body">
				
<div class='row'>
<div class='col-lg-3'>
<label  >Item Name: </label></div><div class='col-lg-3'><input  id='itemName' class='form-control' style='width:400px;'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'>
<div class='col-lg-3'><label>Description: </label></div><div class='col-lg-3'><input style='width:400px;' id='itemDescription' class='form-control'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'>
<div class='col-lg-3'><label>Location: </label></div><div class='col-lg-3'><input  id='itemLocation' style='width:400px;' class='form-control'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'><div class='col-lg-3 col-lg-offset-3'><button class='btn btn-primary' id='insert' onclick='insertValues();'>Submit</button></div></div>
		
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="foundForm" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Found Item</h4>
				</div>
				<div class="modal-body">
				
<div class='row'>
<div class='col-lg-3'>
<label  >Item Name: </label></div><div class='col-lg-3'><input  id='founditemName' class='form-control' style='width:400px;'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'>
<div class='col-lg-3'><label>Description: </label></div><div class='col-lg-3'><input style='width:400px;' id='founditemDescription' class='form-control'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'>
<div class='col-lg-3'><label>Location: </label></div><div class='col-lg-3'><input  id='founditemLocation' style='width:400px;' class='form-control'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'><div class='col-lg-3 col-lg-offset-3'><button class='btn btn-primary' id='insert' onclick='insertfoundValues();'>Submit</button></div></div>
		
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="updateLostForm" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Found Item</h4>
				</div>
				<div class="modal-body">
<div class='row'>
<div class='col-lg-3'>
<label>Item ID: </label></div><div class='col-lg-3'><select class='dropdown' id='lostitemId' style='width:400px;' onchange='changeLost();'></select></div></div>
<div class='row' style='height:20px;'></div>				
<div class='row'>
<div class='col-lg-3'>
<label  >Item Name: </label></div><div class='col-lg-3'><input  id='lostitemName' class='form-control' style='width:400px;'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'>
<div class='col-lg-3'><label>Description: </label></div><div class='col-lg-3'><input style='width:400px;' id='lostitemDescription' class='form-control'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'>
<div class='col-lg-3'><label>Location: </label></div><div class='col-lg-3'><input  id='lostitemLocation' style='width:400px;' class='form-control'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'><div class='col-lg-3 col-lg-offset-3'><button class='btn btn-primary' id='insert' onclick='updateLost();'>Update</button></div></div>
		
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="updateFoundForm" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Found Item</h4>
				</div>
				<div class="modal-body">
<div class='row'>
<div class='col-lg-3'>
<label>Item ID: </label></div><div class='col-lg-3'><select class='dropdown' id='founditemId' style='width:400px;' onchange='changeFound();'></select></div></div>
<div class='row' style='height:20px;'></div>				
<div class='row'>
<div class='col-lg-3'>
<label  >Item Name: </label></div><div class='col-lg-3'><input  id='updatefounditemName' class='form-control' style='width:400px;'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'>
<div class='col-lg-3'><label>Description: </label></div><div class='col-lg-3'><input style='width:400px;' id='updatefounditemDescription' class='form-control'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'>
<div class='col-lg-3'><label>Location: </label></div><div class='col-lg-3'><input  id='updatefounditemLocation' style='width:400px;' class='form-control'/></div></div>
<div class='row' style='height:20px;'></div>
<div class='row'><div class='col-lg-3 col-lg-offset-3'><button class='btn btn-primary' id='insert' onclick='updateFound();'>Update</button></div></div>
		
			</div>
		</div>
	</div>
</div>

<div id="userid" style="visible: none;">${user}</div>
<div id="username" style="visible:none;">${name}</div>
</body>

</html>
