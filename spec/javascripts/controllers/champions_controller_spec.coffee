#= require application
#= require angular-mocks
describe 'LOLChampions', ->
  scope = undefined
  controller = undefined
  beforeEach ->
    module 'LOLChampions'
    return

  describe 'ChampionsController', ->
    championsData = {data: {'Omniknight': {name: 'Omniknight', title: 'The Omniscience', recommended: [blocks: [items: [{id: "2"}]]]}}};
    itemData = {data:{"1":{"name": 'Mekan'}},"2":{name: 'Boots'}};
    beforeEach inject(($rootScope, $httpBackend, $injector, $controller, $q, Champion) ->
      @scope = $rootScope.$new()
      @champion = Champion
      #spyOn(@champion, 'index');
      @httpBackend = $injector.get('$httpBackend')
      controller = $controller('ChampionsController', $scope: @scope, Champion: @champion)
      return
    )
    it 'loads all champions and items', ->
      @httpBackend.whenGET('/champions').respond(200, championsData)
      @httpBackend.whenGET('/items').respond(200, itemData)
      @httpBackend.flush();

      #expect scope to contain at least 1 hero
      expect(Object.keys(@scope.champions).length).toBeGreaterThan(0)
      #expect scope to contain at least 1 item
      expect(Object.keys(@scope.items).length).toBeGreaterThan(0)
      return

    it 'gets correct champion and recommended items', ->
      @httpBackend.whenGET('/champions').respond(200, championsData)
      @httpBackend.whenGET('/items').respond(200, itemData)
      @httpBackend.flush();
      @scope.championDetail('Omniknight')

      #expect selected hero to be Omniknight
      expect(@scope.choseChampion.name).toMatch('Omniknight')
      #expect only one recommended item for Omniknight
      expect(Object.keys(@scope.recommendedItems).length).toBe(1)
      return