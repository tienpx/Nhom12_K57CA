# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

context = null
painting = false
clickX = []
clickY = []
clickDrag = []

init = () ->
  canvas = $("#draw_canvas")[0]
  context = canvas.getContext('2d')
  painting = false
  clickX = []
  clickY = []
  clickDrag = []

handle = () ->
  $('#draw_canvas').mousedown( (e) ->
      mouseX = e.pageX - this.offsetLeft
      mouseY = e.pageY - this.offsetTop

      painting = true
      addClick(mouseX, mouseY)
      redraw()
  )

  $('#draw_canvas').mousemove( (e) ->
    mouseX = e.pageX - this.offsetLeft
    mouseY = e.pageY - this.offsetTop
    if(painting)
      addClick(mouseX, mouseY, true)
      redraw()
  )
  $('#draw_canvas').mouseup( (e) ->
    painting = false
  )

  $('#draw_canvas').mouseleave( (e) ->
    painting = false
  )

addClick = (x, y, dragging) ->
  clickX.push(x)
  clickY.push(y)
  clickDrag.push(dragging)


redraw = () ->
  context.clearRect(0, 0, context.canvas.width, context.canvas.height)
  context.strokeStyle = '#df4b26'
  context.lineJoin = "round"
  context.lineWidth = 5

  for i in [0 ... clickX.length] by 1
    context.beginPath();
    if(clickDrag[i] && i)
      context.moveTo(clickX[i-1], clickY[i-1])
    else
      context.moveTo(clickX[i] - 1, clickY[i])
    context.lineTo(clickX[i], clickY[i])
    context.closePath();
    context.stroke();
  0

