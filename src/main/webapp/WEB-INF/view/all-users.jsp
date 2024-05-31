<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
<h2>All users</h2>
<br>
<table>
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Age</th>
        <th>Operations</th>
    </tr>

    <c:forEach var="usr" items="${allUsrs}">

        <c:url var="updateButton" value="/updateInfo">
            <c:param name="usrId" value="${usr.id}"/>
        </c:url>

        <c:url var="deleteButton" value="/deleteUser">
            <c:param name="usrId" value="${usr.id}"/>
        </c:url>

    <tr>
        <td>${usr.name}</td>
        <td>${usr.surname}</td>
        <td>${usr.email}</td>
        <td>${usr.age}</td>

        <td>
            <input type="button" value="Update"
                   onclick="window.location.href = '${updateButton}'">

            <input type="button" value="Delete"
                   onclick="window.location.href = '${deleteButton}'">
        </td>

    </tr>

    </c:forEach>
</table>
<br>
<input type="button" value="Add"
onclick="window.location.href ='addNewUser'"
/>

</body>
</html>