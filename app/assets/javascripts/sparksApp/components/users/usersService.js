SparksApp.factory('UsersFactory', function($resource) {
    return $resource('/users/:id', {id: '@id'}, {
        query: {
            method: 'GET',
            dataType: 'json',
            headers: {
                'Content-Type': 'application/json'
            }
        },
        get: {
            method: 'GET'
            //url: '/api/portfolios/:id'
        },
        delete: {
            method: 'DELETE',
            url: '/api/users/destroy'
        },
        update: {
            method: 'PUT'
        },
        save: {
            method: 'POST',
            url: '/api/users/'
        },
        changeStatus: {
            method: 'POST',
            url: 'api/users/changestatus'
        }
    });
});

SparksApp.service('UsersService', function (UsersFactory, $resource, $q) {
    var listUsers = [];
    return {
        getUsers: function() {
            var deferred = $q.defer();
            //Se a lista esta vazia, nos vamos buscar ela no servidor.
            if(!listUsers || listUsers.length <= 0) {
                UsersFactory.query(function (f) {
                    listUsers = f.users;
                    deferred.resolve(listUsers);
                });
            }else {
                deferred.resolve(listUsers);
            }
            return deferred.promise;
        },
        clearUsers: function() {
            listUsers = [];
        }
    }
});