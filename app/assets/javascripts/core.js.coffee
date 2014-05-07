# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

svg = 'http://www.w3.org/2000/svg'
xlink  = 'http://www.w3.org/1999/xlink'

class Node
  IMG_SIZE    = 50
  IMG_MARGIN  = 10
  TEXT_HEIGHT = 4

  container: null
  img: null
  text: null
  border: null

  _initImg = ->
    @img  = document.createElementNS(svg, 'image')
    @img.setAttributeNS(xlink, 'href', '../../assets/lib/animal/bird.png')
    @img.setAttribute('x', 0)
    @img.setAttribute('y', 0)
    @img.setAttribute('width', IMG_SIZE)
    @img.setAttribute('height',IMG_SIZE)

  _initText = ->
    @text = document.createElementNS(svg, 'text')
    @text.setAttribute('x', '0')
    @text.setAttribute('y', IMG_SIZE + IMG_MARGIN)
    @text.textContent = 'default'

  _initBorder = ->
    @border = document.createElementNS(svg, 'rect')
    @border.setAttribute('width', IMG_SIZE)
    @border.setAttribute('height', IMG_SIZE + IMG_MARGIN + TEXT_HEIGHT)
    @border.setAttribute('fill', 'none')
    @border.setAttribute('stroke-width', '1')
    @border.setAttribute('stroke-width', 'black')
    @border.setAttribute('visibility', 'hidden')

  _initContainer = ->
    @container = document.createElementNS(svg, 'g')
    @container.className = 'MMNode'
    @container.appendChild(@img)
    @container.appendChild(@text)
    @container.appendChild(@border)

  _createFromObj = (container) ->
    @container = container
    @img  = @container.getElementsByTagName('img')[0]
    @text = @container.getElementsByTagName('text')[0]

  constructor: ->
    if arguments.length == 0
      _initBorder.call(@)
      _initImg.call(@)
      _initText.call(@)
      _initContainer.call(@)
      @addEventHandlers()
    else
      _createFromObj.call(@, arguments[0])

  resizeBorder: ->
    @border.setAttribute('width', @getWidth())
    @border.setAttribute('height', @getHeight())

  setText: (text) ->
    @text.textContent = text
    textWidth  = @text.getComputedTextLength()
    left = (IMG_SIZE - textWidth) // 2
    @text.setAttribute('x', left)
    @resizeBorder()

  setImgSrc: (imgSrc) ->
    @img.setAttributeNS(xlink, 'href', imgSrc)
    @resizeBorder()

  setPosition: (x, y) ->
    @container.setAttribute('transform', "translate(#{x}, #{y})")

  focus: ->
    @container.focus()

  getWidth: ->
    return parseInt(@container.getBoundingClientRect().width, 10)

  getHeight: ->
    return parseInt(@container.getBoundingClientRect().height, 10)

  getLeft: ->
    return parseInt(@container.getAttribute('transform').match(/\d*\.?\d+/g)[0], 10)

  getTop: ->
    return parseInt(@container.getAttribute('transform').match(/\d*\.?\d+/g)[1], 10)

  addEventHandlers: ->
    @container.addEventListener('focusin', Node.onFocusEvent)
    @container.addEventListener('focusout', Node.onBlurEvent)

  @onFocusEvent: (e) ->
    node = new Node(this)
    mindmap.focusedItem = node
    #node.border.setAttribute("visibility", "visible")

  @onBlurEvent: (e) ->
    node = new Node(this)
    #node.border.setAttribute("visibility", "hidden")

class Link
  line: null

  constructor: ->
    @line = document.createElementNS(svg, 'line')
    @line.className = 'MMLink'
    @setColor('black')

  getPointA: ->
    x = parseInt(@line.getAttribute('x1'))
    y = parseInt(@line.getAttribute('y1'))
    return [x, y]

  getPointB: ->
    x = parseInt(@line.getAttribute('x2'))
    y = parseInt(@line.getAttribute('y2'))
    return [x, y]

  setPosition: (x1, y1, x2, y2) ->
    @line.setAttribute('x1', x1)
    @line.setAttribute('y1', y1)
    @line.setAttribute('x2', x2)
    @line.setAttribute('y2', y2)

  setColor: (color) ->
    @line.style.stroke = color

class Mindmap
  @focusedItem: null

  canvas : null
  width  : null
  height : null

  constructor: ->
    @canvas = document.getElementById('draw_canvas')
    @width  = document.getElementById('draw_area').offsetWidth;
    @height = document.getElementById('draw_area').offsetHeight;

  addNode: ->
    node = new Node()
    @canvas.appendChild(node.container)
    return node

  addLink: (parent, child) ->
    link = new Link()
    x1 = parent.getLeft() + parent.getWidth() // 2
    y1 = parent.getTop() + parent.getHeight() // 2
    x2 = child.getLeft() + child.getWidth() // 2
    y2 = child.getTop() + child.getHeight() // 2
    link.setPosition(x1, y1, x2, y2)
    @canvas.insertBefore(link.line, @canvas.firstChild)
    return link

  addRootNode: ->
    root = @addNode()
    x = (@width - root.getWidth()) // 2
    y = (@height - root.getHeight()) // 2
    root.setPosition(x, y)
    root.focus()
    return root

  addChildNode: (parent, x, y) ->
    child = @addNode()
    child.setPosition(x, y)
    @addLink(parent, child)
    parent.focus()
    return child

  getRelativeXY: (absX, absY) ->
    point = @canvas.createSVGPoint()
    point.x = absX
    point.y = absY
    return point.matrixTransform(@canvas.getScreenCTM().inverse())

  removeNode: (node) ->

  removeAllNodes: ->
    @canvas.innerHTML = ''

$ ->
  window.mindmap = new Mindmap()