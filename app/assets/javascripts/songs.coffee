# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

dimBg = ->
  $('#bg').velocity
    opacity: 0.3

hideBg = ->
  $('#bg').velocity
    opacity: 0

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

  $(".control").click ->
    lyrics = $('.lyrics')
    isEditable = lyrics.is('.editable')
    unless isEditable
      toggleEditable()
    else
      toggleEditable()
      worded_lyrics = $('.lyrics').html().replace(/<p>/g, "\n")
      saveLyrics(worded_lyrics)
      if $('.lyrics').text().length == 0
        $('.lyrics').html '<p></p>'
        $('.lyrics').addClass 'placeholder'

  # $(".lyrics-container").dblclick ->
  #   lyrics = $('.lyrics')
  #   isEditable = lyrics.is('.editable')
  #   unless isEditable
  #     toggleEditable()

