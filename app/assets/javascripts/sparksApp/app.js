var SparksApp = angular.module('SparksApp', [
    'ngRoute',
    'ngResource',
    'templates'
]);

SparksApp.run(['$http',
        function ($http) {

            $http.defaults.useXDomain = true;
            // $httpProvider.defaults.withCredentials = true;
            delete $http.defaults.headers.common["X-Requested-With"];
            $http.defaults.headers.common["Accept"] = "application/json";
            $http.defaults.headers.common["Content-Type"] = "application/json";

        }]
);

