<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teste</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascripts/user-controller.js"></script>
</head>
<body>
<content tag="name">Cadastro de usuários</content>

<div ng-app="Tasks" ng-controller="UserController">

    <form class="form-horizontal">

        <input type="hidden" value="" ng-model="currentUser.id">

        <div class="control-group">
            <label class="control-label" for="inputName">Name</label>
            <div class="controls">
                <input type="text" id="inputName" placeholder="Name" ng-model="currentUser.name">
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="inputEmail">E-mail</label>
            <div class="controls">
                <input type="text" id="inputEmail" placeholder="E-mail" ng-model="currentUser.email">
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="inputUsername">Login</label>
            <div class="controls">
                <input type="text" id="inputUsername" placeholder="Login" ng-model="currentUser.login">
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="inputPassword">Password</label>
            <div class="controls">
                <input type="password" id="inputpassword" placeholder="Password" ng-model="currentUser.password">
            </div>
        </div>

        <div class="control-group">
            <div class="controls">
                <button class="btn btn-default" ng-click="saveUser()">Save</button>
            </div>
        </div>

    </form>

    <table class="table table-hover">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>E-mail</th>
            <th>Login</th>
            <th>Options</th>
        </tr>
        </thead>
        <tbody>
        <tr ng-repeat="user in users">
            <td>{{user.id}}</td>
            <td>{{user.name}}</td>
            <td>{{user.email}}</td>
            <td>{{user.login}}</td>
            <td><button class="btn" ng-click="editUser(user)">Edit</button><button class="btn" ng-click="deleteUser(user)">Delete</button></td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>