(($) ->
  $.fn.bottom = (options) ->
    defaults = proximity: 0
    options = $.extend(defaults, options)
    @each ->
      obj = this
      $(obj).bind "scroll", ->
        if obj is window
          scrollHeight = $(document).height()
        else
          scrollHeight = $(obj)[0].scrollHeight
        scrollHeight -= 60  if jQuery.support.touch
        scrollPosition = $(obj).height() + $(obj).scrollTop()
        $(obj).trigger "bottom"  if (scrollHeight - scrollPosition) / scrollHeight <= options.proximity

      false

) jQuery