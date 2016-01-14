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

ToggleUtils = do () ->
  togglableWords = [
    'true false',
    'single double',
    'enable disable',
    'const let',
    'log error',
    'input output',

    'top bottom',
    'left right',
    'previous next',
    'begin end',
    'first second third',
    'initial tail',
    'head last',
    'white black',
    'red green blue',
    'come go',
    '0 1 2 3 4 5 6 7 8 9'
  ].map((s) -> s.split(' '))

  togglableWordsIndex = togglableWords
    .reduce(
      (index, words) ->
        index[word] = words for word in words
        index
      , {}
    )

  match = (targetWord) ->
    return unless words = togglableWordsIndex[targetWord]
    index = words.findIndex((word) => word == targetWord)
    return if index < 0
    { words, index }

  find = (targetWord, delta) ->
    return unless result = match(targetWord)
    { words, index } = result
    words[(index + delta + words.length) % words.length]

  findInEditor = (editor, reverse) ->
    cursor = editor.getLastCursor()
    range = cursor.getCurrentWordBufferRange()
    previousWord = editor.getTextInBufferRange(range)
    nextWord = find(previousWord, (if reverse then -1 else 1))
    {
      shouldUpdate: nextWord != previousWord,
      range,
      word: nextWord
    }

  { findInEditor }

DateUtils = do () ->
  pad = (n) -> if n < 10 then "0#{n}" else "#{n}"

  sign = (n) -> if n < 0 then '-' else '+'

  formatDate = (date, timeZoneOffset) ->
    d = {
      Y: date.getUTCFullYear()
      M: date.getUTCMonth()
      D: date.getUTCDate()
      h: date.getUTCHours()
      m: date.getUTCMinutes()
      s: date.getUTCSeconds()
      tz: timeZoneOffset || 0
    }
    if timeZoneOffset
      d = formatDate(new Date(d.Y, d.M, d.D, d.h + 2 * timeZoneOffset, d.m, d.s))
      d.tz = timeZoneOffset
    d

  stringify = (d) ->
    tzString = "#{sign(d.tz)}#{pad(d.tz)}:00"
    "#{d.Y}-#{pad(d.M+1)}-#{pad(d.D)}T#{pad(d.h)}:#{pad(d.m)}:#{pad(d.s)}#{tzString}"

  { formatDate, stringify }

atom.commands.add 'atom-text-editor',
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
