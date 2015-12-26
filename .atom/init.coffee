# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

atom.commands.add 'atom-text-editor',
  'user:toggle-todo-checkbox': (event) ->
    editor = @getModel()
    cursor = editor.getLastCursor()
    prevText = cursor.getCurrentBufferLine()
    range = cursor.getCurrentLineBufferRange()

    toggle = (s, s1, s2) -> if s == s1 then s2 else s1

    nextText = prevText.replace(
      /(^\s*-\s+)\[([x ])\](\s+)/,
      (_, prefix, mark, trailingSpaces) ->
        "#{prefix}[#{toggle(mark, 'x', ' ')}]#{trailingSpaces}"
    )

    editor.setTextInBufferRange(range, nextText) if prevText != nextText
