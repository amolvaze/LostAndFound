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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
html, body, .container {
	height: 100%;
}

.container {
	display: table;
	vertical-align: middle;
}

.vertical-center-row {
	display: table-cell;
	vertical-align: middle;
}

.img-btn {
	background: none;
	border: none;
	box-shadow: none;
}

.profile-img {
	width: 120px;
	height: 120px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}

.center-button {
	margin: 0 auto 10px;
	display: block;
}

.div-content {
	background-color: #fff;
	-webkit-background-clip: padding-box;
	border: 1px solid #999;
	border: 1px solid rgba(0, 0, 0, .2);
	border-radius: 6px;
	outline: 0;
	-webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
	box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
	background: 1px solid black;
}
</style>
</head>


<script>
var selected=new Array();
//Code to add all the devices of a particular user
	var count=1;


var myarray=new Array(16);
$(document).ready(function() {
	//alert($("#jsonData").html());
    var jsonData=$("#jsonData").html();
	var obj=JSON.parse(jsonData);

	$("#jsonData").hide();
	 
	for(var i=0;i<16;i++)
		{
		myarray[i]=new Array(2);
		}
	myarray[0][0]=10;
	myarray[0][1]=10;
	myarray[1][0]=10;
	myarray[1][1]=310;
	myarray[2][0]=10;
	myarray[2][1]=610;
	myarray[3][0]=10;
	myarray[3][1]=910;
	myarray[4][0]=10;
	myarray[4][1]=1210;
	myarray[5][0]=310;
	myarray[5][1]=10;
	myarray[6][0]=610;
	myarray[6][1]=10;
	myarray[7][0]=910;
	myarray[7][1]=10;
	myarray[8][0]=1210;
	myarray[8][1]=10;
	myarray[9][0]=1210;
	myarray[9][1]=310;
	myarray[10][0]=1210;
	myarray[10][1]=610;
	myarray[11][0]=1210;
	myarray[11][1]=910;
	myarray[12][0]=1210;
	myarray[12][1]=1210;
	myarray[13][0]=310;
	myarray[13][1]=1210;
	myarray[14][0]=610;
	myarray[14][1]=1210;
	myarray[15][0]=910;
	myarray[15][1]=1210;
	for(var i=0;i<obj.length;i++)
	{
	addDiv(obj[i]);
	}
	$('#launch').click(function() {
		$('#deviceModel').modal('show');
		
		}); 

});
 function addDiv(obj)
{
      
		$('#deviceModel').modal('hide');
		var p=0;
		if(selected.length>0)
	    {	
			
		for(var i=0;i<myarray.length;i++)
		{   if(i!=selected[i])
			{
			p=i;
			break;
			}
		}
	    }
		var posx=myarray[p][0];
		var posy=myarray[p][1];
		selected[selected.length]=p;
		 $('#body').append("<div class='div-content' id='"+obj.deviceName+""+count+"' style='position:absolute; width:400px;height:270px;left:"+posx+"px;top:"+posy+"px;'><div><h4>"+obj.deviceName+"</h4></div></div>");   
         
		addElementsToDiv(obj);
}
function addElementsToDiv(obj)
{
	

	var imagefun="'"+obj.deviceName+"image"+count+"','"+obj.deviceName+"'";
																									
	$('#'+obj.deviceName+""+count).append("<br/><div class='col-lg-3 col-lg-offset-4'><button class='img-btn' style='border:none;' onclick=buttonChange("+imagefun+"); ><img style='height:150px;' id='"+obj.deviceName+"image"+count+"' value='off' src='resources/"+obj.deviceName+"-off.jpg'/></button></div>");
	count++;
   var addDevice=$('#launch').position();
   var devicex=addDevice.top;
   var devicey=addDevice.left;

}
function buttonChange(id,device)
{   //Code to update the information to the back end
	
	var state=$("#"+id).attr('value');
	
	if(state=="on")
	{ 
	/*  $("#"+id).attr('value','off'); 
	 $("#"+id).attr('src','C://SmartHome/SmartDevice/images/'+device+'-off.jpg'); */
	 operateDevice("sprinkler","soma@gmail.com","off",id);
	}
	else
	{
	 /* $("#"+id).attr('value','on'); 
     $("#"+id).attr('src','C://SmartHome/SmartDevice/images/'+device+'-on.jpg'); */
     operateDevice("sprinkler","soma@gmail.com","on",id);
	}
	
}
function addDevice()
{ 
	//Code to add a new device and get a json object for the device
	/* var jsonData = "{\"devices\":[{\"actionURL\":\"http://google.com\",\"dataURL\":\"http://google.com\",\"uioptions\":{\"nControlType\":\"Switch\",\"nControlCount\":1,\"ndisplayCount\":1},\"deviceName\":\"Fan\",\"deviceID\":1,\"refresh\":15, \"state\":\"ON\"}]}";
 	var obj=JSON.parse(jsonData);
	addDiv(obj.devices[0]); */
	device = "sprinkler";
	userid = "soma@gmail.com";
	var url='addDevice?emailId='+userid+'&deviceId='+device;
	$.ajax({
		   url: url,
		   type: 'GET',
		   crossDomain:true,
		   success: function(data) {
			   $('#deviceModel').modal('hide');
		reload();
		   },
		   error: function() {
			     alert(url);
			   }
		});
} 
function reload()
{
	var url='reload';
	$.ajax({
		   url: url,
		   type: 'GET',
		   crossDomain:true,
		   success: function(data) {
			  // alert(data);
			   location.reload();
			
		   },
		   error: function() {
			     alert(url);
			   }
		});
}
function operateDevice(device,userid,state,id)
{ 
	var url='operateDevice?emailId='+userid+'&deviceId='+device+'&additionalParameters='+state;
	$.ajax({
		   url: url,
		   type: 'GET',
		   crossDomain:true,
		   success: function(data) {
			   
			   $("#"+id).attr('value',state); 
			   $("#"+id).attr('src','resources/'+device+'-'+state+'.jpg');
		   },
		   error: function() {
			     alert(url);
			   }
		});
	
}
</script>
<body id="body">
	<div class="container">
		<div class="row vertical-center-row">
			<div class="col-lg-12">
				<div class="row ">
					<div class="col-xs-4 col-xs-offset-4">
						<div class="div-content">
							<div class="row" style="height: 30px;"></div>
							<img class="profile-img"
								src='resources/profile.jpg' />
							<button class="center-button btn btn-primary btn-lg"
								type="button" id="launch">+Add New Device</button>
							<div class="row" style="height: 30px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="deviceModel" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Device Registration</h4>
				</div>
				<div class="modal-body">
					<div class="row form-group">

						<Label for="device_name" class="col-sm-3 control-label">Device
							Name:</Label>
						<div class="col-sm-9">
							<Input type="text" class="form-control" id="device_name"
								placeholder="Enter Device Name">
						</div>
					</div>

					<div class="row form-group">
						<Label for="device_id" class="col-sm-3 control-label">Device
							ID:</Label>
						<div class="col-sm-9">
							<Input type="text" class="form-control" id="device_id"
								placeholder="Enter Device ID">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="add"
						onclick="addDevice();">Submit</button>
				</div>
			</div>
		</div>
	</div>
	<div id="jsonData" style="visible: none;">${jsonData}</div>
</body>
</html>