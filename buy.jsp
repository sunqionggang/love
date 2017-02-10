<%@page import="visitCount.*"%>
<%@page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%

	String USER_ID=request.getParameter("UserID");//iTV机顶盒号
	String backUrl=request.getParameter("backUrl");
	String price_f=request.getParameter("price_f");//取得价格的标志，-17：100，-18：230

	//取得完整URL
	String curentUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getRequestURI()+"?"+request.getQueryString();

	String page_id="0016001";
	//访问量和用户记录统计
	VisitCount visitCount=new VisitCount();
	visitCount.addVisitCount(page_id,USER_ID);

	if(session.getAttribute("b2g_backUrl_index")!=null){
		backUrl=(String)session.getAttribute("b2g_backUrl_index");
	}
	
	int price=0;
	String boxType="";
	if("-17".equals(price_f)){
		price=100;
		boxType="B_0001";
	}else if("-18".equals(price_f)){
		price=230;
		boxType="B_0002";
	}else{
		//出错	
	}

	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="page-view-size" content="640*530" />
<script type="text/javascript" src="js/telecom.js"></script>
<title>选择支付方式页面</title>
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
	background:url(img/bgd2.jpg) no-repeat #000;
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

.wz3{ color:#ffff00; font-size:22px; font-family:"黑体"; text-indent:2em; font-weight:bold; height:30px; line-height:35px;}

</style>

<script type="text/javascript">
			var comfcousImg1='img/an_zf_wx2.png';
			var comfcousImg2='img/an_zf_xzhf2.png';
			var comfcousImg3='img/an_zf_fh2.png';
			
			var buttons=[     
				{id:'wxPay',name:'',action:'goWeiXinPay()',focusImage:comfcousImg1,right:'buy'},
				{id:'buy',name:'',action:'goConfirm()',focusImage:comfcousImg2,right:'back',left:'wxPay'},
				{id:'back',name:'',action:'goCancel()',focusImage:comfcousImg3,left:'buy'}
				];

			function goConfirm(){
				window.location.href="informationRigister2.jsp?UserID=<%=USER_ID%>&price_f=<%=price_f%>&backUrl="+escape('<%=curentUrl%>');
			}
			
			//跳转到微信支付
			function goWeiXinPay(){
				window.location.href="infoWX2.jsp?UserID=<%=USER_ID%>&price_f=<%=price_f%>&backUrl="+escape('<%=curentUrl%>');
			}

			function goCancel(){
				back();
			}


			window.onload = function()
			{	
				Epg.btn.init(['','wxPay'], buttons, '', true);
				
			};

			//返回按钮
			function back(){
				var backUrl='<%=backUrl%>';
				if(backUrl==""){
					goIptvPortal();
				
				}else{
					window.location.href=backUrl;
				}
			}
</script>
<body>
<!----> 
<table width="640" height="530" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="72" height="199">&nbsp;</td>
    <td width="495" height="199">&nbsp;</td>
    <td width="73" height="199">&nbsp;</td>
  </tr>
  <tr>
    <td width="72" height="96" align="center" valign="middle" > </td>
    <td width="495" height="96" align="left" valign="middle" class="wz3">
		只需<%=price%>元更换为高清机顶盒，即可升级为高清电信电视！
	</td>
    <!--文字输入-->
    <td width="73" height="96" align="center" valign="middle" ></td>

  </tr>
  <tr>
    <td width="72" height="127"></td>
    <td width="495" height="127" align="left" valign="middle" >&nbsp;</td>
    <td width="73" height="127" align="left" valign="middle">&nbsp;</td>
  </tr>
  
  

  <tr>
    <td height="63" colspan="3" align="left" valign="top">
    
    <table width="630" height="63" border="0" cellspacing="0" cellpadding="0">

   <tr>
    <td width="86">&nbsp;</td>
    <td width="148"><img src="img/an_zf_wx.png" width="148" height="63" id='wxPay'/></td><!--微信支付-->
    <td width="50">&nbsp;</td>
    <td width="148"><img src="img/an_zf_xzhf.png" width="148" height="63" id='buy'/></td><!--先装后付-->
    <td width="50">&nbsp;</td>
    <td width="148"><img src="img/an_zf_fh.png" width="148" height="63" id='back'/></td><!--返回按钮-->
    <td width="86">&nbsp;</td>
  </tr>


 
</table>
   
    </td>
  </tr>
  
  <tr>
    <td width="72" height="45"></td>
    <td width="495" height="45"></td>
    <td width="73" height="45"></td>
  </tr>

</table>


</body>
</html>
