# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

svg = 'http://www.w3.org/2000/svg'
xlink  = 'http://www.w3.org/1999/xlink'

class Node
  container: null
  img: null
  text: null

  initImg = () ->
    @img  = document.createElementNS(svg, 'image')
    @img.setAttributeNS(xlink, 'href', '../../assets/lib/animal/bird.png')
    @img.setAttributeNS(null, 'x', 0)
    @img.setAttributeNS(null, 'y', 0)
    @img.setAttributeNS(null, 'width', '50')
    @img.setAttributeNS(null, 'height', '50' )

  initText = () ->
    @text = document.createElementNS(svg, 'text')
    @text.setAttributeNS(null, 'x', '0')
    @text.setAttributeNS(null, 'y', '60')
    @text.textContent = 'default'


  initContainer = () ->
    @container = document.createElementNS(svg, 'g')
    @container.appendChild(@img)
    @container.appendChild(@text)

  constructor: ->
    initImg()
    initText()
    initContainer()

  setText: (text) ->
    @text.textContent = text

  setImgSrc: (imgSrc) ->
    @img.setAttributeNS(xlink, 'href', imgSrc)

class Mindmap
  canvas: null

  constructor: ->
    @canvas = document.getElementById('draw_canvas')

  addRootNode: ->

  addNode: (parent) ->

  removeNode: (node_id) ->


$ ->
