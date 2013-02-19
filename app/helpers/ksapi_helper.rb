module KsapiHelper
  def load_ksapi(path, title)
    "ksapi://load/?path=#{path}&title=#{URI.escape(title)}"
  end

  def button_ksapi(action, title, position)
    "ksapi://button/?buttonAction=#{action}&buttonTitle=#{URI.escape(title)}&buttonPosition=#{position}"
  end

  def login_ksapi
    "ksapi://login/"
  end
end