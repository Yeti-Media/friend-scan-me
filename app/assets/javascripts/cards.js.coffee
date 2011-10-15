# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.qr-code-link, .bookmark-link').click -> 
     qr_code_h_s this
  
  qr_code_h_s = (target) ->
    if $(target).hasClass 'qr-code-link'
      $('.your-qr-code').fadeIn()
      $('.bookmark-link').show()
      $('.bookmark').hide()
      $('.qr-code-link').hide()
    else
      $('.bookmark').fadeIn()
      $('.qr-code-link').show()
      $('.bookmark-link').hide()
      $('.your-qr-code').hide()