'use strict'

angular.module('LOLChampions').service 'Champion', ($resource) ->

  @index = ->
    $resource('/champions').get()

  return