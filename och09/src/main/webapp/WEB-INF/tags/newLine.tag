<%@ tag language="java" pageEncoding="UTF-8" %> <!-- java기반문장 -->
<%@ tag body-content="empty" %> <!-- 바디부분선언X -->
<%@ attribute name="color" required="true" %> <!-- 칼라, 사이즈 필수 -->
<%@ attribute name="size" required="true" type="java.lang.Integer" %>
<font color="${color }">
	<%
	for(int i=0; i <size; i++) {
		out.println("-");
	}
	%>
</font>
