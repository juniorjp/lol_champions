'use strict'

angular.module('LOLChampions').service 'Champion',[ '$resource', ($resource) ->

  @index = ->
    $resource('/champions').get()

  return
]