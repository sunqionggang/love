<%@page import="visitCount.*"%>
<%@page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String USER_ID=request.getParameter("UserID");//
	
	String page_id="0016000";
	//访问量和用户记录统计
	VisitCount visitCount=new VisitCount();
	visitCount.addVisitCount(page_id,USER_ID);
	String backUrl=request.getParameter("backUrl");//返回地址
	String stbType=request.getParameter("stbType");//iTV机顶盒型号
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="page-view-size" content="640*530" />
<script type="text/javascript" src="js/telecom.js"></script>
<title>高清升级</title>
</head>
<style>
@charset "utf-8";
/* CSS Document */
* {
	margin:0;
	padding:0;
}
body {
	width:640px;
	height:530px;
	background:url(img/bg2.jpg) no-repeat #000;
}
a {
	color:#000;
	text-decoration: none;
}
img {
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
}
input{ width:252px; height:42px; border:none; font-size:22px; background: #FFF;}

.wz2{ color:#ffff00; font-size:22px; font-family:"黑体";  font-weight:bold;}
.wz3{ color:#ffff00; font-size:22px; font-family:"黑体"; text-indent:2em; font-weight:bold; height:30px; line-height:35px;}
.wz_b{ color:#FFF; font-size:23px; font-family:"黑体";  font-weight:bold;}
input {
	width:285px;
	height:48px;
	background:#FFF;
	border:none;
	font-size:36px;
}
</style>
<script type="text/javascript">
			var comfcousImg1='img/an_qd_2.png';
			var comfcousImg2='img/an_fh_2.png';
			var comfcousImg3='img/an_yl_2.png';
			
			var buttons=[     
				{id:'shengji',name:'升级确定',action:'goShengJi()',focusImage:comfcousImg1,right:'back'},
				{id:'back',name:'返回',action:'goCancel()',focusImage:comfcousImg2,left:'shengji',right:'showPic'},
				{id:'showPic',name:'预览',action:'goShowPic()',focusImage:comfcousImg3,left:'back'}
				];
			
</script>
<body>

	
<form id="form1" name="form1" >
	<input type="hidden" name="UserID" id="UserID" value="" >
	<input type="hidden" name="phoneNumber" id="phoneNumber"  value=""/>
</form>
<!----> 
<table width="640" height="530" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="52" height="171">&nbsp;</td>
    <td width="535" height="180">&nbsp;</td>
    <td width="53" height="171">&nbsp;</td>
  </tr>
  <tr>
    <td width="52" height="135" align="center" valign="middle" > </td>
    <td width="535" height="88" align="left" valign="middle" class="wz3">您确定要免费升级为高清吗？请准确填写您的联系电话，以便我们装维人员与您联系。</td>
    
       
<!-- <td width="535" height="88" align="center" valign="middle" class="wz2">您确定每月多支付10元由直播包升级为尊享包吗？</td>   -->
    <!--文字输入-->
    <td width="53" height="88" align="center" valign="middle" ></td>

  </tr>
  <tr>
    <td width="52" height="25"></td>
    <td width="535" height="25" align="left" valign="middle" >&nbsp;</td>
    <td width="53" height="25" align="left" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td height="48" colspan="3">
    <table width="630" height="48" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" align="right" class="wz_b">手机号码：</td>
    <td width="285"><input name="userPhone" id="userPhone" type="text" /></td><!--手机号码：-->
    <td width="10"></td>
    <td width="147"></td>
    </tr>
</table>
    </td>
  </tr>
  <tr>
    <td width="52" height="39"></td>
    <td width="535" height="39" align="left" valign="middle" >&nbsp;</td>
    <td width="53" height="39" align="left" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td height="63" colspan="3" align="left" valign="top">
      <table width="630" height="63" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="56">&nbsp;</td>
    <td width="163"><img src="img/an_qd.png" class="imgSize" id="shengji" width="163" height="63"/></td><!--确定按钮-->
    <td width="20">&nbsp;</td>
    <td width="163"><img src="img/an_fh.png" class="imgSize" id="back" width="163" height="63"/></td><!--返回-->
    <td width="20">&nbsp;</td>
     <td width="163"><img src="img/an_yl.png" class="imgSize" id="showPic" width="163" height="63"/></td><!--预览按钮-->
    <td width="45">&nbsp;</td>
  </tr>
</table>
    </td>
  </tr>
  <tr>
    <td width="52" height="40"></td>
    <td width="535" height="40"></td>
    <td width="53" height="40"></td>
  </tr>

<div style="position:absolute;z-index:1;left:186px;top:400px;width:350px;height:40px" align=left >	
		<font  size="4"  color="#FF0"><div id="dg_msg"></div></font>		
	</div>
</table>
<script>

			var clickNum=0;
			function goShengJi(){
				if(clickNum==0){
				var phoneNumber=document.getElementById("userPhone").value;
			
			     if(!/^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/i.test(phoneNumber)){
					 document.getElementById('dg_msg').innerHTML="请输正确的入手机号码!";
				 }else{
					 document.form1.UserID.value="<%=USER_ID%>";
					 document.form1.phoneNumber.value=document.getElementById("userPhone").value;//电话
					 document.form1.method="post";
					 document.form1.action="waiting.jsp";
					 document.form1.target="_self";
					 document.form1.submit();
					 clickNum+=1;
				 }
				}else if(clickNum==1){
					return false;
				}else{
					return false;
				}
			}

			function goCancel(){
				goIptvPortal();
			}

			function goShowPic(){
				window.location.href="showPic.jsp?UserID=<%=USER_ID%>"
			}


			window.onload = function()
			{	
				Epg.btn.init(['','shengji'], buttons, '', true);
				
			};

			//返回按钮
			function back(){
				goIptvPortal();
			}

</script>

</body>
</html>
