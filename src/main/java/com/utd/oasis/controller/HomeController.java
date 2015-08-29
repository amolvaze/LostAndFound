package com.utd.oasis.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.utd.oasis.dao.LostDAO;
import com.utd.oasis.data.User;

@Controller
public class HomeController {
	final String USER_AGENT = "Mozilla/5.0";

	@Autowired
	LostDAO login;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String displayHome(Model model) {
		model.addAttribute("user", new User());
		return "/home";
	}

	/*
	 * @RequestMapping(value = "/registerUser") public String
	 * displayRegister(Model model) { model.addAttribute("user", new User());
	 * 
	 * return "/register"; }
	 * 
	 * @RequestMapping(value = "/regUser", method = RequestMethod.POST) public
	 * String registerUser(@ModelAttribute User user, ModelMap model) {
	 * System.out.println(user); String resultpage = "";
	 * model.addAttribute("user", user.getEmailID()); model.addAttribute("pwd",
	 * user.getPassword()); model.addAttribute("fname", user.getFirstName());
	 * model.addAttribute("lname", user.getLastName()); boolean result = false;
	 * String object = ""; try { String url =
	 * "http://54.69.170.92:8080/OASIS_Server/user/register"; URL obj = new
	 * URL(url); HttpURLConnection con = (HttpURLConnection)
	 * obj.openConnection();
	 * 
	 * // add reuqest header con.setRequestMethod("POST");
	 * con.setRequestProperty("User-Agent", USER_AGENT);
	 * con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
	 * 
	 * 
	 * 
	 * String urlParameters = "emailId=" + user.getEmailID() + "&password=" +
	 * user.getPassword()+"&firstName="+user.getFirstName()+"&lastName="+
	 * user.getLastName()+"&osType=dummy&regId=dummy";
	 * 
	 * // Send post request con.setDoOutput(true); DataOutputStream wr = new
	 * DataOutputStream(con.getOutputStream()); wr.writeBytes(urlParameters);
	 * wr.flush(); wr.close();
	 * 
	 * int responseCode = con.getResponseCode();
	 * 
	 * System.out.println("\nSending 'POST' request to URL : " + url);
	 * System.out.println("Post parameters : " + urlParameters);
	 * System.out.println("Response Code : " + responseCode);
	 * 
	 * 
	 * BufferedReader in = new BufferedReader(new InputStreamReader(
	 * con.getInputStream())); String inputLine; StringBuffer response = new
	 * StringBuffer();
	 * 
	 * while ((inputLine = in.readLine()) != null) { response.append(inputLine);
	 * } in.close();
	 * 
	 * // print result // System.out.println(response.toString()); Boolean
	 * res=Boolean.parseBoolean(response.toString()); if(res) {
	 * model.addAttribute("user", new User()); resultpage="/home"; } } catch
	 * (Exception e) { // TODO Auto-generated catch block e.printStackTrace(); }
	 * 
	 * System.out.println(result+"sdfsd"); if(result) {
	 * 
	 * 
	 * return resultpage;
	 * 
	 * } else { return "/home"; }
	 * 
	 * }
	 */

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(@ModelAttribute User user, ModelMap model) {
		System.out.println(user);
		String resultpage = "";
		model.addAttribute("user", user.getEmailID());
		model.addAttribute("pwd", user.getPassword());

		boolean result = false;

		String object = "";

		try {
			User us = login.userLogin(user);
			// result = sendPost(user.getEmailID(), user.getPassword());
			model.addAttribute("name", us.getFirstName());
			if (us.getFirstName().length() > 0) {

				resultpage = "/LostAndFound";
			} else {
				resultpage = "/home";
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * System.out.println(result+"sdfsd"); if(result) {
		 */
		return resultpage;
		/*
		 * } else { return "/home"; }
		 */
	}

	/*
	 * @RequestMapping(value = "/addDevice", method = RequestMethod.GET) public
	 * @ResponseBody String addDevice(@RequestParam String emailId,
	 * 
	 * @RequestParam String deviceId) {
	 */

	@RequestMapping(value = "/insertValues", method = RequestMethod.POST)
	public @ResponseBody String insertValues(@RequestParam String userid,
			@RequestParam String name, @RequestParam String description,
			@RequestParam String location) {
		System.out.println(userid + "" + name);
		// System.out.println(user);
		String resultpage = "";
		Boolean result = false;

		try {
			result = login.insertValues(userid, name, description, location);

			System.out.println(result);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result.toString();

	}
	
	@RequestMapping(value = "/insertFoundValues", method = RequestMethod.POST)
	public @ResponseBody String insertFoundValues(@RequestParam String userid,
			@RequestParam String name, @RequestParam String description,
			@RequestParam String location) {
		System.out.println(userid + "" + name);
		// System.out.println(user);
		String resultpage = "";
		Boolean result = false;

		try {
			result = login.insertFoundValues(userid, name, description, location);

			System.out.println(result);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result.toString();

	}
	
	@RequestMapping(value = "/updateLost", method = RequestMethod.POST)
	public @ResponseBody String updateLost(@RequestParam String userid,@RequestParam String id,
			@RequestParam String name, @RequestParam String description,
			@RequestParam String location) {
		System.out.println(userid + "" + name);
		// System.out.println(user);
		String resultpage = "";
		Boolean result = false;

		try {
			result = login.updateLost(userid,id, name, description, location);

			System.out.println(result);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result.toString();

	}
	
	@RequestMapping(value = "/updateFound", method = RequestMethod.POST)
	public @ResponseBody String updateFound(@RequestParam String userid,@RequestParam String id,
			@RequestParam String name, @RequestParam String description,
			@RequestParam String location) {
		System.out.println(userid + "" + name);
		// System.out.println(user);
		String resultpage = "";
		Boolean result = false;

		try {
			result = login.updateFound(userid,id, name, description, location);

			System.out.println(result);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result.toString();

	}
	
	
	
	@RequestMapping(value = "/viewItem", method = RequestMethod.GET)
	public @ResponseBody String viewItem() {
		String resultpage = "";
		boolean result = false;
		String object = "";
		try {
			System.out.println("Inside");
			object=login.getItems();
			System.out.println("sdaf"+object);
  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 System.out.println(result+"sdfsd"); 
		 
		return object;
		
		 
		 
	}
	@RequestMapping(value = "/viewFoundItem", method = RequestMethod.GET)
	public @ResponseBody String viewFoundItem() {
		String resultpage = "";
		boolean result = false;
		String object = "";
		try {
			System.out.println("Inside");
			object=login.getFoundItems();
			System.out.println("sdaf"+object);
  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 System.out.println(result+"sdfsd"); 
		 
		return object;
		
		 
		 
	}
	/*
	 * public boolean sendPost(String emailId, String password) throws Exception
	 * {
	 * 
	 * String url = "http://54.69.170.92:8080/OASIS_Server/user/login"; URL obj
	 * = new URL(url); HttpURLConnection con = (HttpURLConnection)
	 * obj.openConnection();
	 * 
	 * // add reuqest header con.setRequestMethod("POST");
	 * con.setRequestProperty("User-Agent", USER_AGENT);
	 * con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
	 * 
	 * String urlParameters = "emailId=" + emailId + "&password=" + password;
	 * System.out.println(emailId+"ssass"+password); // Send post request
	 * con.setDoOutput(true); DataOutputStream wr = new
	 * DataOutputStream(con.getOutputStream()); wr.writeBytes(urlParameters);
	 * wr.flush(); wr.close();
	 * 
	 * int responseCode = con.getResponseCode();
	 * 
	 * System.out.println("\nSending 'POST' request to URL : " + url);
	 * System.out.println("Post parameters : " + urlParameters);
	 * System.out.println("Response Code : " + responseCode);
	 * 
	 * 
	 * BufferedReader in = new BufferedReader(new InputStreamReader(
	 * con.getInputStream())); String inputLine; StringBuffer response = new
	 * StringBuffer();
	 * 
	 * while ((inputLine = in.readLine()) != null) { response.append(inputLine);
	 * } in.close();
	 * 
	 * // print result // System.out.println(response.toString()); return
	 * Boolean.parseBoolean(response.toString()); }
	 * 
	 * public boolean sendPostOperate(String userid, String deviceId, String
	 * additionalParameters) throws Exception {
	 * 
	 * String url = "http://54.69.170.92:8080/OASIS_Server/user/operateDevice";
	 * URL obj = new URL(url); HttpURLConnection con = (HttpURLConnection)
	 * obj.openConnection();
	 * 
	 * // add reuqest header con.setRequestMethod("POST");
	 * con.setRequestProperty("User-Agent", USER_AGENT);
	 * con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
	 * 
	 * String urlParameters = "emailId=" + userid + "&deviceId=" + deviceId +
	 * "&additionalParameters=" + additionalParameters; System.out.println(url +
	 * "" + urlParameters); // Send post request con.setDoOutput(true);
	 * DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	 * wr.writeBytes(urlParameters); wr.flush(); wr.close();
	 * 
	 * int responseCode = con.getResponseCode();
	 * 
	 * System.out.println("\nSending 'POST' request to URL : " + url);
	 * System.out.println("Post parameters : " + urlParameters);
	 * System.out.println("Response Code : " + responseCode);
	 * 
	 * 
	 * BufferedReader in = new BufferedReader(new InputStreamReader(
	 * con.getInputStream())); String inputLine; StringBuffer response = new
	 * StringBuffer();
	 * 
	 * while ((inputLine = in.readLine()) != null) { response.append(inputLine);
	 * } in.close();
	 * 
	 * // print result // System.out.println(response.toString()); return
	 * Boolean.parseBoolean(response.toString()); }
	 * 
	 * public boolean sendPostAddDevice(String userid, String deviceId) throws
	 * Exception {
	 * 
	 * String url = "http://54.69.170.92:8080/OASIS_Server/user/addDevice"; URL
	 * obj = new URL(url); HttpURLConnection con = (HttpURLConnection)
	 * obj.openConnection();
	 * 
	 * // add reuqest header con.setRequestMethod("POST");
	 * con.setRequestProperty("User-Agent", USER_AGENT);
	 * con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
	 * 
	 * String urlParameters = "emailId=" + userid + "&deviceId=" + deviceId;
	 * System.out.println(url + "" + urlParameters); // Send post request
	 * con.setDoOutput(true); DataOutputStream wr = new
	 * DataOutputStream(con.getOutputStream()); wr.writeBytes(urlParameters);
	 * wr.flush(); wr.close();
	 * 
	 * int responseCode = con.getResponseCode();
	 * 
	 * System.out.println("\nSending 'POST' request to URL : " + url);
	 * System.out.println("Post parameters : " + urlParameters);
	 * System.out.println("Response Code : " + responseCode);
	 * 
	 * 
	 * BufferedReader in = new BufferedReader(new InputStreamReader(
	 * con.getInputStream())); String inputLine; StringBuffer response = new
	 * StringBuffer();
	 * 
	 * while ((inputLine = in.readLine()) != null) { response.append(inputLine);
	 * } in.close();
	 * 
	 * // print result // System.out.println(response.toString()); return
	 * Boolean.parseBoolean(response.toString()); }
	 * 
	 * private String sendGet() throws Exception {
	 * 
	 * String url =
	 * "http://54.69.170.92:8080/OASIS_Server/user/getDevices?emailId=soma@gmail.com"
	 * ;
	 * 
	 * URL obj = new URL(url); HttpURLConnection con = (HttpURLConnection)
	 * obj.openConnection();
	 * 
	 * // optional default is GET con.setRequestMethod("GET");
	 * 
	 * // add request header con.setRequestProperty("User-Agent", USER_AGENT);
	 * 
	 * int responseCode = con.getResponseCode();
	 * 
	 * BufferedReader in = new BufferedReader(new InputStreamReader(
	 * con.getInputStream())); String inputLine; StringBuffer response = new
	 * StringBuffer();
	 * 
	 * while ((inputLine = in.readLine()) != null) { response.append(inputLine);
	 * } in.close();
	 * 
	 * // print result System.out.println(response.toString()); return
	 * response.toString(); }
	 * 
	 * @RequestMapping(value = "/operateDevice", method = RequestMethod.GET)
	 * public @ResponseBody String operateDevice(@RequestParam String emailId,
	 * 
	 * @RequestParam String deviceId,
	 * 
	 * @RequestParam String additionalParameters) { System.out.println(emailId +
	 * "" + deviceId); // System.out.println(user); String resultpage = "";
	 * Boolean result = false;
	 * 
	 * model.addAttribute("user", user.getEmailID()); model.addAttribute("pwd",
	 * user.getPassword()); boolean result=false; String object="";
	 * 
	 * try { result = sendPostOperate(emailId, deviceId, additionalParameters);
	 * 
	 * System.out.println(result); } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); }
	 * 
	 * System.out.println(result+"sdfsd"); if(result) {
	 * 
	 * return result.toString();
	 * 
	 * } else { return "/home"; }
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/addDevice", method = RequestMethod.GET) public
	 * @ResponseBody String addDevice(@RequestParam String emailId,
	 * 
	 * @RequestParam String deviceId) { System.out.println(emailId + "" +
	 * deviceId); // System.out.println(user); String resultpage = ""; Boolean
	 * result = false;
	 * 
	 * model.addAttribute("user", user.getEmailID()); model.addAttribute("pwd",
	 * user.getPassword()); boolean result=false; String object="";
	 * 
	 * try { result = sendPostAddDevice(emailId, deviceId);
	 * 
	 * System.out.println(result);
	 * 
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * System.out.println(result+"sdfsd"); if(result) {
	 * 
	 * return result.toString();
	 * 
	 * } else { return "/home"; }
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/reload", method = RequestMethod.GET) public
	 * String reloadPage( ModelMap model) { String resultpage = ""; boolean
	 * result = false; String object = ""; try {
	 * 
	 * object = sendGet(); model.addAttribute("jsonData", object); resultpage =
	 * "/SmartHome";
	 * 
	 * System.out.println("SDsdf"+result); } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); }
	 * 
	 * System.out.println(result+"sdfsd"); if(result) {
	 * 
	 * return resultpage;
	 * 
	 * } else { return "/home"; }
	 * 
	 * }
	 */

}