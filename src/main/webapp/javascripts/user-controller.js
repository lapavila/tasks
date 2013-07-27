var app;

app = angular.module("Tasks", ["ngResource"]);

app.factory("User", [
    "$resource", function($resource) {
        return $resource("/users/:id", {id: '@id'}, {
            update: {
                method: "PUT"
            },
            delete: {
                method: "DELETE",
                params: {
                    id: "@id"
                }
            }
        });
    }
]);

this.UserController = [
    "$scope", "User", function($scope, User) {
        $scope.users = User.query();
        $scope.saveUser = function() {
            if ($scope.currentUser.id == null) {
                var user = angular.toJson({user : $scope.currentUser});
                user = User.save(user);
                $scope.users.push(user);
            } else {
                var user = angular.toJson({user : $scope.currentUser});
                user = User.update(user);
            }
            return $scope.currentUser = {};
        };
        $scope.deleteUser = function(user) {
            User.delete(user);
            $scope.users.splice( $scope.users.indexOf(user), 1 );
        };
        $scope.editUser = function(user) {
            $scope.currentUser = user;
        }
    }
];