FakeElement = require './fake_element'

attr = (constructor, name) ->
  constructor::__defineGetter__ name, -> @getAttribute name
  constructor::__defineSetter__ name, (value) -> @setAttribute name, value

class FakeInput extends FakeElement
  selfClosing: yes

  constructor: (ownerDocument, type='text') ->
    super ownerDocument, 'input'
    @type = type
    @value = ''

  attr this, 'value'
  attr this, 'type'

  this::__defineGetter__ 'selectionStart', ->
    @_selectionStart

  this::__defineSetter__ 'selectionStart', (selectionStart) ->
    selectionStart = 0 if selectionStart < 0
    selectionStart = @value.length if selectionStart > @value.length
    @_selectionStart = selectionStart

  this::__defineGetter__ 'selectionEnd', ->
    @_selectionStart

  this::__defineSetter__ 'selectionEnd', (selectionEnd) ->
    selectionEnd = 0 if selectionEnd < 0
    selectionEnd = @value.length if selectionEnd > @value.length
    @_selectionEnd = selectionEnd

module.exports = FakeInput