# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  audiojs.events.ready ->
    as = audiojs.createAll()
    return

  $('.add-clip-note').click ->
    time = $(@).closest('.clip').find('audio')[0].currentTime
    clip_id = $(@).closest('.clip').data('id')
    # $(@).closest('.clip').append "<div class='set-clip-time'>#{time}</div>"
    # audio = $(@).closest('.clip').find('audio')[0]
    $.post('/audio_notes', { audio_note: { time: time, audio_clip_id: clip_id, note: 'this is a test' } })

  $('.clip').on 'click', '.set-clip-time', ->
    audio = $(@).closest('.clip').find('audio')[0]
    audio.currentTime = $(@).data('time')
    $(@).closest('.clip').find(".audiojs").addClass('playing')
    audio.play()
