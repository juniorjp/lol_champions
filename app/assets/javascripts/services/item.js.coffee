'use strict'

angular.module('LOLChampions').service 'Item', ($resource) ->

  @index = ->
    $resource('/items').get()

  return