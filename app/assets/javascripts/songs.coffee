# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

dimBg = ->
  $('#bg').addClass 'active'
  $('#bg').velocity
    opacity: 0.3

hideBg = ->
  $('#bg').velocity
    opacity: 0
  , ->
    $('#bg').removeClass 'active'

toggleEditable = ->
  lyricsContainer = $('.lyrics-container')
  lyrics = $('.lyrics')
  title = lyrics.closest(".lyrics-container").find('.title')
  isEditable = lyrics.is('.editable')
  lyrics.prop('contentEditable', !isEditable)
  title.toggleClass 'active'
  lyricsContainer.toggleClass 'active'
  lyrics.toggleClass 'editable'
  if isEditable
    $('.control').text "EDIT"
    hideBg()
  else
    $('.control').text "SAVE"
    dimBg()


saveSongName = (name) ->
  $.post($('.song-name-link').data('update-url'), { song: { name: name }, _method: 'PATCH' })

saveLyrics = (lyrics) ->
  $.post($('.lyrics').data('update-url'), { song: { lyrics: lyrics }, _method: 'PATCH' })

$ ->
  audiojs.events.ready ->
    as = audiojs.createAll()
    return


  $(".lyrics").keydown (event) ->
    if ((event.metaKey || event.ctrlKey) && event.keyCode == 13)
      toggleEditable()
      lyrics = $(@).html().replace(/<p>/g, "\n")
      saveLyrics(lyrics)
      if $('.lyrics').text().length == 0
        $(@).addClass 'placeholder'
    if $(@).text().length > 0
      $(@).removeClass 'placeholder'

  $(".link-section .control").click ->
    link = $(@).closest('.link-section').find('a')
    isEditable = link.is('.editable')
    unless isEditable
      $(@).closest('.link-section').addClass 'active'
      link.prop('contentEditable', true)
      link.addClass 'editable'
      $(@).text "SAVE"
      dimBg()
    else
      name = $('.song-name-link a').text()
      saveSongName(name)
      $(@).text "EDIT"
      $(@).closest('.link-section').removeClass 'active'
      link.prop('contentEditable', false)
      link.removeClass 'editable'
      hideBg()

  $('.link-section a').keydown (event) ->
    if event.keyCode == 13
      event.preventDefault()


  $(".lyrics-container .control").click ->
    lyrics = $('.lyrics')
    isEditable = lyrics.is('.editable')
    unless isEditable
      toggleEditable()
    else
      toggleEditable()
      worded_lyrics = $('.lyrics').html()
      saveLyrics(worded_lyrics)
      if $('.lyrics').text().length == 0
        $('.lyrics').addClass 'placeholder'

  # $(".lyrics-container").dblclick ->
  #   lyrics = $('.lyrics')
  #   isEditable = lyrics.is('.editable')
  #   unless isEditable
  #     toggleEditable()

