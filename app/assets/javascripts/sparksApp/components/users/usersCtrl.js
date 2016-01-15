SparksApp.controller('UsersCtrl', ['$scope','UsersService',
    function($scope, UsersService) {

    $scope.init = function() {
        console.log('UsersCtrl iniciando...');

        UsersService.getUsers().then(function(users) {
            $scope.listUsers = users;
            console.table($scope.listUsers);
        });

    }




    $scope.init();
}]);