# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

svg = 'http://www.w3.org/2000/svg'
xlink  = 'http://www.w3.org/1999/xlink'

class Node
  container: null
  img: null
  text: null

  initImg = ->
    @img  = document.createElementNS(svg, 'image')
    @img.setAttributeNS(xlink, 'href', '../../assets/lib/animal/bird.png')
    @img.setAttribute('x', 0)
    @img.setAttribute('y', 0)
    @img.setAttribute('width', '50')
    @img.setAttribute('height', '50' )

  initText = ->
    @text = document.createElementNS(svg, 'text')
    @text.setAttribute('x', '0')
    @text.setAttribute('y', '60')
    @text.textContent = 'default'


  initContainer = ->
    @container = document.createElementNS(svg, 'g')
    @container.appendChild(@img)
    @container.appendChild(@text)

  constructor: ->
    initImg.call(@)
    initText.call(@)
    initContainer.call(@)

  setText: (text) ->
    @text.textContent = text

  setImgSrc: (imgSrc) ->
    @img.setAttributeNS(xlink, 'href', imgSrc)

  setPosition: (x, y) ->
    @container.setAttribute('transform', "translate(#{x}, #{y})")

  getWidth: ->
    return @container.getBoundingClientRect().width

  getHeight: ->
    return @container.getBoundingClientRect().height

class Mindmap
  canvas : null
  width  : null
  height : null

  constructor: ->
    @canvas = document.getElementById('draw_canvas')
    @width  = document.getElementById('draw_area').offsetWidth;
    @height = document.getElementById('draw_area').offsetHeight;

  addRootNode: ->
    node = new Node
    left = (@width - node.getWidth()) // 2
    top  = (@height - node.getHeight()) // 2
    node.setPosition(left, top)
    node.setText('root')
    @canvas.appendChild(node.container)

  addChildNode: (parent) ->

  removeNode: (node_id) ->

  removeAllNodes: ->
    @canvas.innerHTML = ''

$ ->
  window.mindmap = new Mindmap()