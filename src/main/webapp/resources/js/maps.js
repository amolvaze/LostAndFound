var map;

var houseLat, houseLng = null;

function Initialise() {

	var latlng = new google.maps.LatLng(32.7766, -96.7969);

	var mapOptions = {
		zoom : 12,
		center : latlng,
		mapTypeControl : true
	};

	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

function UpdateMap() {
	var geocoder = new google.maps.Geocoder();

	var address = document.getElementById("entry").value;

	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		var addr_type = results[0].types[0];
		if (status == google.maps.GeocoderStatus.OK) {
			ShowLocation(results[0].geometry.location, address, addr_type);
			houseLat = results[0].geometry.location.lat();
			houseLng = results[0].geometry.location.lng();
			// alert("house lat and long::"+houseLat+houseLng);

		} else
			alert("Geocode was not successful for the following reason: "
					+ status);
	});

}

function ShowLocation(latlng, address, addr_type) {

	map.setCenter(latlng);

	var zoom = 12;
	switch (addr_type) {
	case "administrative_area_level_1":
		zoom = 6;
		break;
	case "locality":
		zoom = 10;
		break;
	case "street_address":
		zoom = 15;
		break;
	}
	map.setZoom(zoom);
	/*
	 * 
	 * var marker = new google.maps.Marker( { position: latlng, map: map, title:
	 * address });
	 */

	var marker = new google.maps.Marker({
		map : map,
		draggable : true,
		animation : google.maps.Animation.DROP,
		position : latlng,
		title : address
	});
	// document.getElementById("updatingLocation").disabled = true;
	// document.getElementById("addingLocation").disabled = false;
	document.getElementById("latitude").value = "";
	document.getElementById("longitude").value = "";
	document.getElementById("locName").value = "";
	document.getElementById("latitude").value = latlng.lat();
	document.getElementById("longitude").value = latlng.lng();
	/* google.maps.event.addListener(marker, 'click', toggleBounce); */

	var contentString = "" + address + "";
	var infowindow = new google.maps.InfoWindow({
		content : contentString
	});
	google.maps.event.addListener(marker, 'dragend', function(event) {

		document.getElementById("latitude").value = event.latLng.lat();
		document.getElementById("longitude").value = event.latLng.lng();
	});

	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
		document.getElementById("latitude").value = latlng.lat();
		document.getElementById("longitude").value = latlng.lng();
		document.getElementById("locName").value = address;
		var lat = latlng.lat();
		var lng = latlng.lng()
		getDevices(lat,lng,address);
		document.getElementById("latitude").disabled = true;
		document.getElementById("longitude").disabled = true;
		document.getElementById("locName").disabled = true;
		// document.getElementById("addingLocation").disabled = true;
		document.getElementById("updatingLocation").disabled = false;
		/*
		 * if (marker.getAnimation() != null) { marker.setAnimation(null); }
		 * else { marker.setAnimation(google.maps.Animation.BOUNCE); }
		 */
	});

}
function getDevices(lat , lng , location)
{
	alert("Getting called");
	$.ajax({
		   url: "getDevices?emailId=soma@gmail.com",
		   type: 'GET',
		   crossDomain:true,
		   success: function(data) {
			   var obj=JSON.parse(data);
				var additionalAtt=obj.additionalAttributes;
				var addObj=JSON.parse(additionalAtt);
				for(var i=0;i<addObj.length;i++)
				{ 
					
				var name=addObj[i].userDeviceName;
			    var userLocation = addObj[i].userWireless.userLocation.locationName;
				var longitude = addObj[i].userWireless.userLocation.longitude;
				var latitude = addObj[i].userWireless.userLocation.latitude;
			    if(location==userLocation && latitude==lat && longitude==lng){
			    	alert("Hello");
			    	var img = document.createElement('img')
			    	img.src = 'resources/sprinkler-on.jpg';
			    	img.width='52';
			    	img.height='52';
			    	document.getElementById('devices').appendChild(img);
			    }
	 		    
			} 
		
		   },
		   error: function() {
			     alert(url);
			   }
		});	

}
function locationChange() {
	var e = document.getElementById("locationList");
	var strUser = e.options[e.selectedIndex].text;
	var latlng = e.options[e.selectedIndex].value.split(",");
	var latitude = latlng[0];
	var longitude = latlng[1];
	console.log(latitude + " " + longitude);
	document.getElementById("latitude").value = "";
	document.getElementById("longitude").value = "";
	document.getElementById("latitude").value = latitude;
	document.getElementById("longitude").value = longitude;
	document.getElementById("locName").value = strUser;
	map.setCenter(new google.maps.LatLng(latitude, longitude));
	document.getElementById("latitude").disabled = true;
	document.getElementById("longitude").disabled = true;
	document.getElementById("locName").disabled = true;
	// document.getElementById("addingLocation").disabled = true;
	document.getElementById("updatingLocation").disabled = false;
	// ShowLocation( new google.maps.LatLng(latitude,longitude), "home",
	// "administrative_area_level_1" );
}
function updateLocation() {
	document.getElementById("latitude").disabled = false;
	document.getElementById("longitude").disabled = false;
	document.getElementById("locName").disabled = false;
	document.getElementById("savingLocation").disabled = false;
	document.getElementById("updatingLocation").disabled = true;

}
function addLocation() {
	var location = document.getElementById("locName").value;
	var x = document.getElementById("locationList");
	var option = document.createElement("option");
	var latitude = document.getElementById("latitude").value;
	var longitude = document.getElementById("longitude").value;
	var str = document.getElementById("latitude").value + ","
			+ document.getElementById("longitude").value;
	option.text = location;
	option.value = str;
	x.add(option);

	$.ajax({
		url : "addLocation?name=" + location + "&latitude=" + latitude
				+ "&longitude=" + longitude,
		type : 'GET',
		crossDomain : true,
		success : function(data) {
			alert("Success" + data);

		},
		error : function() {
			alert(url);
		}
	});
	document.getElementById("latitude").value = "";
	document.getElementById("longitude").value = "";
	document.getElementById("entry").value = "";
	document.getElementById("locName").value = "";
}
function loadLocation(location, latitude, longitude) {

/*	var x = document.getElementById("locationList");
	var option = document.createElement("option");
	var str = latitude + "," + longitude;
	option.text = location;
	option.value = str;
	x.add(option);*/
	ShowLocation(new google.maps.LatLng(latitude, longitude), location,
			"locality");
	document.getElementById("latitude").value = "";
	document.getElementById("longitude").value = "";
	document.getElementById("addingLocation").disabled = true;
	document.getElementById("updatingLocation").disabled = true;
	document.getElementById("savingLocation").disabled = true;
}

function makeIt() {
	var pinImage = new google.maps.MarkerImage(
			"http://www.googlemapsmarkers.com/v1/009900/");
	var markerLoc = new google.maps.LatLng(houseLat + Math.random() / 1000,
			houseLng + Math.random() / 1000);

	var marker1 = new google.maps.Marker({
		position : markerLoc,
		map : map,
		icon : pinImage

	});
}
var images = [ "image1.jpg", "image2.png", "image3.jpg", "image4.png" ];
var i = 0;
function make() {

	var markerLoc = new google.maps.LatLng(houseLat + Math.random() / 1000,
			houseLng + Math.random() / 1000);

	var marker1 = new google.maps.Marker({
		icon : images[i],
		position : markerLoc,
		map : map,
		draggable : true

	});
	i++;
}
