(function(){
    'use strict';

    angular
        .module('paSearch', ['ngAnimate'])
        .controller('searchCtrl', function($scope, $http){
            //entire list of objects get from php
            function search()
            {
                $http({
                    method: 'GET',
                    url: 'search.php',
                    params: {'query': 'gimme'}
                  }).then(function successCallback(response) {
                      $scope.results = response.data;
                    }, function errorCallback(response) {
                      // called asynchronously if an error occurs
                      // or server returns response with an error status.
                      $scope.results = response.statusText;
                    });
            }
            search();
            $scope.searchType = "All";
        });
}());