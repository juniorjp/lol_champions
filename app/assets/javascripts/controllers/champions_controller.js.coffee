angular.module("LOLChampions").controller "ChampionsController",['$scope', 'Champion', 'Item', '$filter',  ($scope, Champion, Item, $filter) ->

  $scope.choseChampion = {}
  $scope.recommendedItems = []
  $scope.champions = {}
  $scope.items = {}
  Champion.index().$promise.then (response) ->
    $scope.champions = response.data
    return

  Item.index().$promise.then (response) ->
    $scope.items = response.data
    window.items = $scope.items
    return

  $scope.championDetail = (championName) ->
    console.log championName
    $scope.recommendedItems = []
    $scope.choseChampion = $scope.champions[championName.replace(' ', '').replace(/[^a-zA-Z ]/g, "")]
    recommendedItemIds = []
    for recommended in $scope.choseChampion.recommended
      for block in recommended.blocks
        for item in block.items
          recommendedItemIds.push item.id

    for recommendedItemId in recommendedItemIds
      $scope.recommendedItems.push $scope.items[recommendedItemId] if $scope.recommendedItems.where(id: recommendedItemId).length == 0
  return

]