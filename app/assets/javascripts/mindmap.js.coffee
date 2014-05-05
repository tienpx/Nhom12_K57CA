# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

svg = 'http://www.w3.org/2000/svg'
xlink  = 'http://www.w3.org/1999/xlink'

class Node
  container: null
  img: null
  text: null
  img_src: '../../assets/lib/animal/bird.png'
  content: 'default'

  constructor: ->
    @img  = document.createElementNS(svg, 'image')
    @img.setAttributeNS(xlink, 'href', @img_src)
    @img.setAttributeNS(null, 'x', 0)
    @img.setAttributeNS(null, 'y', 0)
    @img.setAttributeNS(null, 'width', '50')
    @img.setAttributeNS(null, 'height', '50' )
    @text = document.createElementNS(svg, 'text')
    @text.setAttributeNS(null, 'x', '0')
    @text.setAttributeNS(null, 'y', '60')
    @text.appendChild(document.createTextNode(@content))
    @container = document.createElementNS(svg, 'g')
    @container.appendChild(@img)
    @container.appendChild(@text)

  set_content: (content) ->
    @content = content
    @text.textContent = content

  set_img_src: (img_src) ->
    @img_src = img_src
    @img.setAttributeNS(xlink, 'href', @img_src)


mindmap =
  add_node: (parent) ->
  remove_node: (node) ->
  empty: ->
