angular.module("LOLChampions").controller "ChampionsController",['$scope', 'Champion', '$filter',  ($scope, Champion, $filter) ->

  Champion.index().$promise.then (response) ->
    $scope.champions = response.data
    window.lol = $scope.champions
    return

  return

]