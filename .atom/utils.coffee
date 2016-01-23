path = require('path')

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

FindPathUtils = do () ->
  resolve = do () ->
    try
      { sync } = require('resolve')
      (args...) ->
        try
          sync(args...)
        catch error
          false
    catch error
      (_) -> false

  EXTENSIONS = ['.sh', '.md', '.json', '.js', '.jsx', '.ts', '.tsx', '.es6', '.coffee']
  PATH_PATTERN = /(?:import|require).*(['"`])([a-zA-Z0-9_\-. ()\[\]\\\/]+)\1/

  findPathInStringWithSep = (s, sep) ->
    if start = s.indexOf(sep)
      if end = s.indexOf(sep, start + 1)
        return s.slice(start + 1, end)
    false

  find = (editor) ->
    line = editor.getLastCursor().getCurrentBufferLine()
    return false unless match = PATH_PATTERN.exec(line)
    filePath = match[2]
    basedir = path.dirname(editor.getPath())
    resolve(filePath, { extensions: EXTENSIONS, basedir })

  { find }

module.exports = { ToggleUtils, DateUtils, FindPathUtils }
