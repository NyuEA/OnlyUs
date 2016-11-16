<%@page import="com.service.CouponService"%>
<%@page import="com.dto.MycouponDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.GenUserDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.service.GenUserService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	// 폼데이터 얻기
	String id = request.getParameter("userid");
	CouponService service = new CouponService();
	List<MycouponDTO> list = service.MyCoupon(id);
	StringBuffer buffer = new StringBuffer();
	buffer.append("<dept>");
	for (MycouponDTO dto : list) {
		String couid = dto.getCouid();
		String period_f = dto.getPeriod_f();
		String period_t = dto.getPeriod_t();
		String bisid = dto.getBisid();
		String bisname = dto.getBisname();
		String dcouid = dto.getDcouid();
		String use_yn = dto.getUse_yn();
		String content = dto.getContent();

		buffer.append("<record>");
		buffer.append("<couid>" + couid + "</couid>");
		buffer.append("<period_f>" + period_f + "</period_f>");
		buffer.append("<period_t>" + period_t + "</period_t>");
		buffer.append("<bisid>" + bisid + "</bisid>");
		buffer.append("<bisname>" + bisname + "</bisname>");
		buffer.append("<dcouid>" + dcouid + "</dcouid>");
		buffer.append("<use_yn>" + use_yn + "</use_yn>");
		buffer.append("<content>" + content + "</content>");
		buffer.append("</record>");
	}
	buffer.append("</dept>");
%>
<%=buffer.toString()%>
