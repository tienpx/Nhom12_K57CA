# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

svg = 'http://www.w3.org/2000/svg'
xlink  = 'http://www.w3.org/1999/xlink'

class Node
  @_numOfInstance: 0

  IMG_SIZE    = 50
  IMG_MARGIN  = 10
  IMG_DEFAULT_URL = '../../assets/lib/animal/bird.png'
  TEXT_HEIGHT = 4
  TEXT_DEFAULT = 'default'

  container: null
  img: null
  text: null

  _initImg = ->
    @img  = document.createElementNS(svg, 'image')
    @img.setAttributeNS(xlink, 'href', IMG_DEFAULT_URL)
    @img.setAttribute('x', 0)
    @img.setAttribute('y', 0)
    @img.setAttribute('width', IMG_SIZE)
    @img.setAttribute('height',IMG_SIZE)

  _initText = ->
    @text = document.createElementNS(svg, 'text')
    @text.setAttribute('x', '0')
    @text.setAttribute('y', IMG_SIZE + IMG_MARGIN)
    @text.textContent = TEXT_DEFAULT

  _initContainer = ->
    @container = document.createElementNS(svg, 'g')
    @container.id = 'node' + Node._numOfInstance
    @container.className = 'MMNode'
    @container.appendChild(@img)
    @container.appendChild(@text)

  _createFromObj = (container) ->
    @container = container
    @container.id
    @img  = @container.getElementsByTagName('image')[0]
    @text = @container.getElementsByTagName('text')[0]

  constructor: ->
    if arguments.length == 0
      Node._numOfInstance++
      _initImg.call(@)
      _initText.call(@)
      _initContainer.call(@)
      @addEventHandlers()
    else
      _createFromObj.call(@, arguments[0])

  getText: ->
    return @text.textContent

  setText: (text) ->
    @text.textContent = text
    textWidth  = @text.getComputedTextLength()
    left = (IMG_SIZE - textWidth) // 2
    @text.setAttribute('x', left)

  setImgSrc: (imgSrc) ->
    @img.setAttributeNS(xlink, 'href', imgSrc)

  setPosition: (x, y) ->
    @container.setAttribute('transform', "translate(#{x}, #{y})")

  focus: ->
    @container.focus()

  getId: ->
    return @container.id

  getWidth: ->
    return IMG_SIZE

  getHeight: ->
    return parseInt(@container.getBoundingClientRect().height, 10)

  getLeft: ->
    coordinate = @container.getAttribute('transform')
    return parseInt(coordinate.match(/\d*\.?\d+/g)[0], 10)

  getTop: ->
    coordinate = @container.getAttribute('transform')
    return parseInt(coordinate.match(/\d*\.?\d+/g)[1], 10)

  addEventHandlers: ->
    @container.addEventListener('focusin', Node.onFocusEvent)
    @container.addEventListener('mousedown', Node.onStartDragEvent)
    @container.addEventListener('drag', Node.onDragEvent)

  @onFocusEvent: (e) ->
    node = new Node(this)
    mindmap.focusedItem = node

  @onStartDragEvent: (e) ->
    linkArr = [].slice.call(mindmap.canvas.getElementsByTagName('line'))
    if linkArr.length > 0
      nodeId = this.id
      parentRegx = new RegExp("line_[a-z0-9]+_#{nodeId}")
      childRegx  = new RegExp("line_#{nodeId}_[a-z0-9]")
      mindmap.parentLink = linkArr.filter((link) -> link.id.match(parentRegx))
      mindmap.childLink  = linkArr.filter((link) -> link.id.match(childRegx))
      for link, i in mindmap.parentLink
        mindmap.parentLink[i] = new Link(link)
      for link, i in mindmap.childLink
        mindmap.childLink[i] = new Link(link)

  @onDragEvent: (e) ->
    node = new Node(this)
    globalPoint = e.detail
    localPoint = mindmap.getRelativeXY(globalPoint.clientX, globalPoint.clientY)
    nodeX = localPoint.x - node.getWidth() // 2
    nodeY = localPoint.y - node.getHeight() // 2
    node.setPosition(nodeX, nodeY)
    for link in mindmap.parentLink
      link.setEndPoint(localPoint.x, localPoint.y)
    for link in mindmap.childLink
      link.setStartPoint(localPoint.x, localPoint.y)

class Link
  line: null

  _createNewLink = (parentNode, childNode) ->
    parentId = parentNode.getId()
    childId  = childNode.getId()
    @line = document.createElementNS(svg, 'line')
    @line.id = "line_#{parentId}_#{childId}"
    @line.className = 'MMLink'
    @setColor('black')

  _createFromObj = (id) ->
    @line = id

  constructor: ->
    switch arguments.length
      when 2
        [parentNode, childNode] = arguments
        _createNewLink.call(@, parentNode, childNode)
      when 1
        objId = arguments[0]
        _createFromObj.call(@, objId)


  getStartPoint: ->
    x = parseInt(@line.getAttribute('x1'))
    y = parseInt(@line.getAttribute('y1'))
    return [x, y]

  getEndPoint: ->
    x = parseInt(@line.getAttribute('x2'))
    y = parseInt(@line.getAttribute('y2'))
    return [x, y]

  setPosition: (x1, y1, x2, y2) ->
    @line.setAttribute('x1', x1)
    @line.setAttribute('y1', y1)
    @line.setAttribute('x2', x2)
    @line.setAttribute('y2', y2)

  setStartPoint: (x, y) ->
    @line.setAttribute('x1', x)
    @line.setAttribute('y1', y)

  setEndPoint: (x, y) ->
    @line.setAttribute('x2', x)
    @line.setAttribute('y2', y)

  setColor: (color) ->
    @line.style.stroke = color


class Mindmap
  @focusedItem: null
  @draggedItem: null

  canvas : null
  width  : null
  height : null

  CANVAS_ID = 'draw_canvas'
  CANVAS_WRAP_ID = 'draw_area'

  constructor: ->
    @canvas = document.getElementById(CANVAS_ID)
    @width  = document.getElementById(CANVAS_WRAP_ID).offsetWidth
    @height = document.getElementById(CANVAS_WRAP_ID).offsetHeight
    @enableNodeDrag()

  addNode: ->
    node = new Node()
    @canvas.appendChild(node.container)
    return node

  addLink: (parent, child) ->
    link = new Link(parent, child)
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

  removeAllNodes: ->
    @canvas.innerHTML = ''

  enableNodeDrag: ->
    @canvas.addEventListener('mousedown', Mindmap.onDragStartEvent)
    @canvas.addEventListener('mousemove', Mindmap.onDragEvent)
    @canvas.addEventListener('mouseup', Mindmap.onDropEvent)

  @onDragStartEvent: (e) ->
    target = e.target.parentNode
    if target.tagName == 'g'
      Mindmap.draggedItem = target

  @onDragEvent: (e) ->
    if Mindmap.draggedItem
      event = new CustomEvent('drag', {'detail':{
        'clientX': e.clientX,
        'clientY': e.clientY
      }})
      Mindmap.draggedItem.dispatchEvent(event)

  @onDropEvent: (e) ->
    Mindmap.draggedItem = null

  getData: ->
    html = document.getElementById(CANVAS_ID).innerHTML

$ ->
  window.mindmap = new Mindmap()