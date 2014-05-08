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

  editText: ->
    handler = (e) ->
      mindmap.canvas.removeEventListener('click', arguments.callee)
      point = mindmap.getRelativeXY(e.clientX, e.clientY)
      x = point.x - mindmap.focusedItem.getWidth() // 2
      y = point.y - mindmap.focusedItem.getHeight() // 2
      node = mindmap.focusedItem
      new_text = prompt('New text', node.text.text)
      node.setText new_text
    mindmap.canvas.addEventListener('click', handler)

  save: ->
    html = mindmap.getData()
    $.post '/mindmap/save',
        text: html
        (data) -> alert "Save successfully!"

