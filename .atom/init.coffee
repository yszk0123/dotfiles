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

ToggleUtils = null
DateUtils = null
FindPathUtils = null
reloadUtils = () ->
  delete require.cache[require.resolve('./utils')]
  { ToggleUtils, DateUtils, FindPathUtils } = require('./utils')
reloadUtils()

atom.commands.add 'atom-text-editor',
  'user:reload-utils': reloadUtils

  'user:toggle-todo-checkbox': (event) ->
    editor = @getModel()
    cursor = editor.getLastCursor()
    previousText = cursor.getCurrentBufferLine()
    range = cursor.getCurrentLineBufferRange()

    toggle = (s, s1, s2) -> if s == s1 then s2 else s1

    nextText = previousText.replace(
      /(^\s*-\s+)\[([x ])\](\s+)/,
      (_, prefix, mark, trailingSpaces) ->
        "#{prefix}[#{toggle(mark, 'x', ' ')}]#{trailingSpaces}"
    )

    editor.setTextInBufferRange(range, nextText) if previousText != nextText

  'user:toggle-previous-word': (event) ->
    editor = @getModel()
    { shouldUpdate, range, word } = ToggleUtils.findInEditor(editor, true)
    editor.setTextInBufferRange(range, word) if shouldUpdate

  'user:toggle-next-word': (event) ->
    editor = @getModel()
    { shouldUpdate, range, word } = ToggleUtils.findInEditor(editor, false)
    editor.setTextInBufferRange(range, word) if shouldUpdate

  'user:insert-current-date': (event) ->
    timeZoneOffset = 9
    dateString = DateUtils.stringify(DateUtils.formatDate(new Date(), timeZoneOffset))
    @getModel().insertText(dateString)

  'user:go-to-path': (event) ->
    return unless filePath = FindPathUtils.find(@getModel())
    atom.workspace.open(filePath)
