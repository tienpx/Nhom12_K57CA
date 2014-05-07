window.MMTools =
  new: ->
    mindmap.removeAllNodes()
    mindmap.addRootNode()
  addChildNode: ->
    handler = (e) ->
      mindmap.canvas.removeEventListener('click', arguments.callee)
      point = mindmap.getRelativeXY(e.clientX, e.clientY)
      x = point.x - mindmap.focusedItem.getWidth() // 2
      y = point.y - mindmap.focusedItem.getHeight() // 2
      mindmap.addChildNode(mindmap.focusedItem, x, y)
    mindmap.canvas.addEventListener('click', handler)
