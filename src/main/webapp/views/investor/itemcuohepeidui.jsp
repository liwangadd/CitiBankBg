<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<% List<Map<String, Object>> matching = (List<Map<String, Object>>) request.getAttribute("data");%>

<% for (int i = 0; i < matching.size(); i++) {%>
<tr>
    <td>"<%matching.get(i).get("productName");%>"</td>
    <td>"<%matching.get(i).get("investType");%>"</td>
    <td>"<%matching.get(i).get("investArea");%>"</td>
    <td>"<%matching.get(i).get("investIndustry");%>"</td>
    <td>"<%matching.get(i).get("fundBody");%>"</td>
    <td>"<%matching.get(i).get("leastReturnDemand");%>"</td>
    <td>"<%matching.get(i).get("investorName");%>"</td>
</tr>
<%}%>