kakesan = {}
window.kakesan = kakesan

##########################################
# Common
##########################################
kakesan.ajax_loader = (next, path, options) ->
  show_loader = ->
    loader = $("<div id='loader' style='text-align: center; padding: 5px;'><img src= '/assets/ajax-loader.gif' /></div>")
    $("#theme-list").append(loader)
  
  hide_loader = ->
    $('#loader').remove()
  
  show_list = (response) ->
    $("#contents").append(response)

  page = 1
  show_loader() if next
  $(window).bottom({proximity: 0})
  $(window).on('bottom', ->
    obj = $(this)
    if !obj.data('loading') && next
      obj.data('loading', true)
      params = jQuery.extend({page: ++page},options)
      $.get(
        path, params, 'html'
      ).success((response) ->
        show_list(response)
        obj.data('loading', false)
        next = (jQuery.trim(response) != '')
        hide_loader() unless next
      ).fail( ->
        alert('通信エラーです。')
        obj.data('loading', false)
      )
  )


##########################################
# Native Request
##########################################
kakesan.loadAPI = (api) ->
  location.href = api

##########################################
# Native Callback
##########################################
kakesan.closeButtonDidPushed = ->
  location.href = "ksapi://close/"
