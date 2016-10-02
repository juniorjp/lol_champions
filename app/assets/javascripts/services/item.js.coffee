'use strict'

angular.module('LOLChampions').service 'Item',['$resource', ($resource) ->

  @index = ->
    $resource('/items').get()

  return
]