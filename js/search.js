(function(){
    'use strict';

    var app = angular.module('paSearch', ['ngAnimate']);
        app.controller('searchCtrl', function($scope, $http){
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

            $scope.searchBar = "";
            //default category to all
            $scope.searchType = "All";

            //default category to all
            $scope.sortBy = "name";
            
            //function redirecting to the correct page generator according to item type
            $scope.goTo = function(type, id)
            {
                //checking if address contains spaces if yes replace it with '-'
                if (name.indexOf(' ') > -1) {
                    name = name.replace(/ /g,"-");
                }
                window.location = '/' + type + '?id=' + id;
            };
            $scope.query = function (q)
            { 
               alert(q);
            };
        });

        //directive setting height of every cards to same for visual aestetic
        app.directive('stylo', function($timeout){
            return {
                link: function ($scope, $element, $attrs) {
                     if ($scope.$last){
                         var elements = document.getElementsByClassName("result");
                         var maxHeight = 0;
                         //Get the max height and set to the other div
                         $timeout(function(){
                            for (var i = 0; i < elements.length; i++) {
                               var elementHeight = elements[i].offsetHeight;
                               //console.log(elementHeight);
                               if (elements[i].offsetHeight > maxHeight) {
                                   maxHeight = elementHeight;
                               }
                            }    
                            for (var i = 0; i < elements.length; i++) {
                                elements[i].style.height = maxHeight + "px";
                             }    
                         });
                     }
                }
            }
        });
}());