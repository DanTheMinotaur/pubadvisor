(function(){
    'use strict';

    angular
        .module('paSearch', ['ngAnimate'])
        .controller('searchCtrl', function($scope, $http){
            //This function getting json file of all the objects: pubs and beers for search purposes
            function search()
            {
                $http({
                    method: 'GET',
                    url: 'api/search',
                  }).then(function successCallback(response) {
                      $scope.results = response.data;
                    }, function errorCallback(response) {
                      // called asynchronously if an error occurs
                      // or server returns response with an error status.
                      $scope.results = response.statusText;
                    });
            }

            //run function search on load
            search();

            //default category to all
            $scope.searchType = "All";

            //function redirecting to the correct page generator according to item type
            $scope.goTo = function(type, id)
            {
                //checking if address contains spaces if yes replace it with '-'
                if (name.indexOf(' ') > -1) {
                    name = name.replace(/ /g,"-");
                }
                window.location = '/' + type + '?id=' + id;
            }
        });

}());