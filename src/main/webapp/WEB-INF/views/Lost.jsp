<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.css">
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.5/css/jquery.dataTables.min.css">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="//cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>


	function lostItem() { //alert("Hello");
		$("#mainDisplay").empty();
		$("#mainDisplay")
				.append(
						"<div class='row'><div class='col-lg-3'><label  >Item Name: </label></div><div class='col-lg-3'><input  id='itemName' class='form-control' style='width:400px;'/></div></div><div class='row' style='height:20px;'></div><div class='row'><div class='col-lg-3'><label>Description: </label></div><div class='col-lg-3'><input style='width:400px;' id='itemDescription' class='form-control'/></div></div><div class='row' style='height:20px;'></div><div class='row'><div class='col-lg-3'><label>Location: </label></div><div class='col-lg-3'><input  id='itemLocation' style='width:400px;' class='form-control'/></div></div><div class='row' style='height:20px;'></div><div class='row'><div class='col-lg-3 col-lg-offset-3'><button class='btn btn-primary' id='insert' onclick='insertValues();'>Submit</button></div></div>");
	}
	function viewItem() { //alert("Hello");
		$("#mainDisplay").empty();
		//alert("Hello");
		/*  $("#mainDisplay").append("<table class='table' id='viewTable'><tr><th>Item ID</th><th>Item Name</th><th>Item Description</th><th>Location</th></tr></table>");
		 */
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
				if ($.fn.dataTable.isDataTable('#mainDisplay')) {
					console.log("Deleting existing table");
					$("#mainDisplay").dataTable().fnDestroy();
				}
				 $('#mainDisplay').dataTable({
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
	//$("#mainDisplay").append("<div class='row'><div class='col-lg-3'><label  >Item Name: </label></div><div class='col-lg-3'><input  id='itemName' class='form-control' style='width:400px;'/></div></div><div class='row' style='height:20px;'></div><div class='row'><div class='col-lg-3'><label>Description: </label></div><div class='col-lg-3'><input style='height:100px;width:400px;' id='itemDescription' class='form-control'/></div></div><div class='row' style='height:20px;'></div><div class='row'><div class='col-lg-3'><label>Location: </label></div><div class='col-lg-3'><input  id='itemLocation' style='width:400px;' class='form-control'/></div></div><div class='row' style='height:20px;'></div><div class='row'><div class='col-lg-3 col-lg-offset-3'><button class='btn btn-primary' id='insert' onclick='insertValues();'>Submit</button></div></div>");

	function insertValues() {

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
						$("#mainDisplay").empty();
						$("#mainDisplay")
								.append(
										"Congratulations!!! Item Successfully added to our Database.");
						//location.reload();

					},
					error : function() {
						alert(url);
					}
				});
	}
</script>
</head>

<style>
		.head div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}
.head div span{
	color: #5379fa !important;
	text-align: left;
}
		
	    select,input
		{
		color:black;
		}
		</style>
<body>

    <nav class="navbar navbar-inverse " role="navigation">
      <div>
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
                  
                        <div class="head">
			<div><b>LOST<span> & FOUND</span><b></div>
		</div>
                    </a>

        </div>
       <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" role="form">
            <div class="form-group">
              <label style="color:white;">Welcome ${name}!</label>
            </div>
           
          </form>
        </div><!--/.navbar-collapse -->

      </div>
    </nav>



<div class="container" style="margin-top:50px;">
<div class="row">
<div class="col-lg-6">
<button class="btn btn-primary" id="lost" onclick="lostItem();">Lost any Item?</button>
</div>
<div class="col-lg-6">
<button class="btn btn-primary" id="view" onclick="viewItem();">View Lost Items</button>
</div>
<!-- <div class="col-lg-3">
<button class="btn btn-primary" id="update" onclick="updateItem();">Update Lost Item</button>
</div> -->
</div>
<div id="mainDiv" style="height:800px;width:1000px; margin-top:100px;">
	<table id="mainDisplay">
	</table>
</div>
</div>
<div id="userid" style="visible: none;">${user}</div>
</body>
</html>