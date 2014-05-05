# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

svg = 'http://www.w3.org/2000/svg'
xlink  = 'http://www.w3.org/1999/xlink'

class Node
  container: null
  img: null
  text: null

  init_img = () ->
    @img  = document.createElementNS(svg, 'image')
    @img.setAttributeNS(xlink, 'href', '../../assets/lib/animal/bird.png')
    @img.setAttributeNS(null, 'x', 0)
    @img.setAttributeNS(null, 'y', 0)
    @img.setAttributeNS(null, 'width', '50')
    @img.setAttributeNS(null, 'height', '50' )

  init_text = () ->
    @text = document.createElementNS(svg, 'text')
    @text.setAttributeNS(null, 'x', '0')
    @text.setAttributeNS(null, 'y', '60')
    @text.textContent = 'default'


  init_container = () ->
    @container = document.createElementNS(svg, 'g')
    @container.appendChild(@img)
    @container.appendChild(@text)

  constructor: ->
    init_img()
    init_text()
    init_container()

  set_text: (text) ->
    @text.textContent = text

  set_img_src: (img_src) ->
    @img.setAttributeNS(xlink, 'href', img_src)


mindmap =
  add_node: (parent) ->
  remove_node: (node) ->
  empty: ->
