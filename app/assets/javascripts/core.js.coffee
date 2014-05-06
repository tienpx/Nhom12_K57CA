# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

svg = 'http://www.w3.org/2000/svg'
xlink  = 'http://www.w3.org/1999/xlink'

class Node
  IMG_SIZE   = 50
  IMG_MARGIN = 10

  container: null
  img: null
  text: null

  initImg = ->
    @img  = document.createElementNS(svg, 'image')
    @img.setAttributeNS(xlink, 'href', '../../assets/lib/animal/bird.png')
    @img.setAttribute('x', 0)
    @img.setAttribute('y', 0)
    @img.setAttribute('width', IMG_SIZE)
    @img.setAttribute('height',IMG_SIZE)

  initText = ->
    @text = document.createElementNS(svg, 'text')
    @text.setAttribute('x', '0')
    @text.setAttribute('y', IMG_SIZE + IMG_MARGIN)
    @text.textContent = 'default'


  initContainer = ->
    @container = document.createElementNS(svg, 'g')
    @container.className = 'node'
    @container.appendChild(@img)
    @container.appendChild(@text)

  constructor: ->
    initImg.call(@)
    initText.call(@)
    initContainer.call(@)

  setText: (text) ->
    @text.textContent = text
    textWidth  = @text.getComputedTextLength()
    left = (IMG_SIZE - textWidth) // 2
    @text.setAttribute('x', left)

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
    @canvas.appendChild(node.container)
    left = (@width - node.getWidth()) // 2
    top  = (@height - node.getHeight()) // 2
    node.setPosition(left, top)
    node.setText('root')

  addChildNode: (parent) ->

  removeNode: (node_id) ->

  removeAllNodes: ->
    @canvas.innerHTML = ''

$ ->
  window.mindmap = new Mindmap()