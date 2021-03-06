<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache" /> 
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" /> 
<jsp:include page="base.jsp" />
<title>计费平台开发者中心</title>
<script type="text/javascript">
jQuery(document).ready(function() {
	
	jQuery("#payment_but").live('click', function(event){
		var _root = jQuery("#_root").val();
		var _url = _root+"/iread/getConfirm";
		jQuery("#alert_message").html("<xmp></xmp>");
		
		var options = {
			url: _url,
	        success: function (data) {
	           if(null==data || ''==data){
	        	   jQuery("#alert_message").html("未查询到数据！");
	           }else{
	        	   var str = JSON.stringify(data); 
	        	   jQuery("#alert_message").html(str);
	           }
	           jQuery("#alert_message").show();
	        }
	    };
		jQuery("#payment_code_frm").ajaxSubmit(options);
		
	});	
});
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="api_nav_title">
		 单击<a href="<%=request.getContextPath()%>/api/apiList">此处</a>，获取完整的操作列表。
	</div>
	
	<div class="nav_left">
		<a href="<%=request.getContextPath()%>/api/paymentSms">获取支付短信接口</a>
		<a href="<%=request.getContextPath()%>/api/paymentConfirm" id="current_nav">获取支付验证码</a>
		<a href="<%=request.getContextPath()%>/api/codeList">结果码</a>
	</div>
	
	<div class="api_from_div">
		<jsp:include page="paymentBase.jsp" />
		
		<div id="alert_message"></div>
		<div class="tab_title">在线调试，输入参数后，请单击“调用”按钮。</div>
		
	<form id="payment_code_frm" name="payment_code_frm" method="post">
		<table class="tab2" cellpadding="0" border="0" cellspacing="0" >
			<thead>
				<tr>
					<th width="10%">参数</th>
					<th align="left">值</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="right"><font color="red">*</font>orderId：</td>
					<td><input type="text" id="orderId" name="orderId" /></td>
				</tr>
				
				<tr>
					<td align="right"><font color="red">*</font>channelNo：</td>
					<td><input type="text" id="channelNo" name="channelNo" /></td>
				</tr>
				
				<tr>
					<td align="right"><font color="red">*</font>password：</td>
					<td><input type="text" id="password" name="password" /></td>
				</tr>
				
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" id="payment_but" name="payment_but" class="def_button" value="调用" />
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
		
		<div class="tab_title">请求消息体参数</div>
		<table class="tab3" cellpadding="0" border="0" cellspacing="0" style="margin-bottom: 20px;" >
			<thead>
				<tr>
					<th align="left">参数名</th>
					<th align="left">类型</th>
					<th align="left">选取原则</th>
					<th align="left">说明</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>orderId</td>
					<td>string</td>
					<td>必录</td>
					<td>订单号</td>
				</tr>
				
				<tr>
					<td>channelNo</td>
					<td>string</td>
					<td>必录</td>
					<td>渠道号</td>
				</tr>
				
				<tr>
					<td>password</td>
					<td>string</td>
					<td>必录</td>
					<td>渠道password</td>
				</tr>
				
			</tbody>
		</table>
		<div class="tab_title" style="margin-top: 20px;">响应消息体参数</div>
		<table class="tab3" cellpadding="0" border="0" cellspacing="0" style="margin-bottom: 20px;" >
			<thead>
				<tr>
					<th align="left">参数名</th>
					<th align="left">类型</th>
					<th align="left">选取原则</th>
					<th align="left">说明</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>resultCode</td>
					<td>string</td>
					<td>必选</td>
					<td>0成功，非0失败。</td>
				</tr>
				
				<tr>
					<td>resultMsg</td>
					<td>string</td>
					<td>可选</td>
					<td>结果描述。</td>
				</tr>
				
				<tr>
					<td>confirmCode</td>
					<td>string</td>
					<td>必选</td>
					<td>校验码</td>
				</tr>
				<tr>
					<td>accessno</td>
					<td>string</td>
					<td>必选</td>
					<td>短信发送至</td>
				</tr>
				<tr>
					<td>orderId</td>
					<td>string</td>
					<td>必选</td>
					<td>计费平台生成唯一订单号</td>
				</tr>
				
				<tr>
					<td>响应消息体格式：</td>
					<td colspan="3">
<pre>	
{
"resultCode":"0",
"resultMsg":"请求成功",
"confirmCode":"86012440",
"orderId":"14372998438293490796897142231684"
}
</pre>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
</body>
</html>