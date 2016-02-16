# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # $('form').on 'ajax:success', (xhr, data, status) ->
  #   last_song = $($('.song')[0]).clone()
  #   last_song.find('.underline a').text data.name
  #   song = $(@).closest('.song').replaceWith last_song
  #   last_song.addClass 'new-song'
  $('.flash .alert').velocity
    translateY: -45
    maxWidth: 0
    color: '#000'
    backgroundColor: "#0AF"
    opacity: 0
  ,
    duration: 0
  $('.alert button').click ->
    $(@).closest('.alert').velocity 'transition.slideUpOut'

  delay = 0
  $('.flash .alert').each ->
    delay += 100
    $(@).velocity
      color: '#FFF'
      backgroundColor: '#FFF'
      opacity: 1
    ,
      duration: 0
      delay: delay + 200
    $(@).velocity
      color: '#FFF'
      backgroundColor: ['#000', 'easeOutSine', '#FFF']
      maxWidth: 800
      opacity: [1, 1]
      translateY: 0
    ,
      easing: 'spring'
      duration: 700

  $('.song-links').sortable
    axis: 'y'
    items: '> .song'
    update: ->
      $.post($(@).data('update-url'), $(@).sortable('serialize'))

  $('.add-song a').hover ->
    if $(@).hasClass 'inactive'
      $(@).closest('.song').stop(true,false).find('.glyphicon-plus').velocity
        color: '#0AF'
      ,
        duration: 100
    else
      $(@).closest('.song').stop(true,false).find('.glyphicon-plus').velocity
        color: '#F00'
      ,
        duration: 100
  , ->
      $(@).closest('.song').stop(true).find('.glyphicon-plus').velocity
        color: '#888'
      ,
        duration: 100
  $('.add-song a').click ->
    target_name = $(@).data('target')
    target = $("##{target_name}")
    input = $(target).find('input')
    target.find('form').css
      display: 'inline'
    if $(@).hasClass 'inactive'
      $(@).removeClass 'inactive'
      $(@).stop(true, false).velocity
        color: '#0AF'
        opacity: 1
      ,
        easing: 'spring'
      $(@).closest('.song').addClass 'hide-song'
      $(@).closest('.song').find('.glyphicon-plus').addClass 'cancel'
      $(@).closest('.song').find('.glyphicon-plus').css
        color: '#0AF'
      $(@).closest('.song').find('.glyphicon-plus').stop(true, false).velocity
        color: '#888'
        rotateZ: '45deg'
      ,
        easing: 'spring'
        # opacity: 0
      input.focus()
      input.stop(true, false).css
        opacity: 1
        width: 300
    else
      $(@).addClass 'inactive'
      $(@).stop(true, false).velocity
        color: '#0AF'
        opacity: 1
      ,
        easing: 'spring'
      $(@).closest('.song').removeClass 'hide-song'
      $(@).closest('.song').find('.glyphicon-plus').css
        color: '#F00'
      $(@).closest('.song').find('.glyphicon-plus').velocity
        color: '#888'
        rotateZ: '0deg'
      ,
        easing: 'spring'
      $(@).closest('.song').find('.glyphicon-plus').removeClass 'cancel'
      input.blur()
      input.stop(true, false).css
        opacity: 0
        width: 0
      ,
        target.find('form').css
          display: 'none'

   $('.song-link .glyphicon').velocity
      translateX: 5
   $('.song-link a').hover ->
     $(@).css
      paddingLeft: 10
      marginLeft: -10
     $(@).closest('.song-link').find('.glyphicon').stop(true, false).velocity
      opacity: 1
      translateX: 0
      ,
        easing: 'spring'
    , ->
     $(@).closest('.song-link').find('.glyphicon').stop(true).velocity
      opacity: 0
      translateX: 5
      ,
        easing: 'spring'

