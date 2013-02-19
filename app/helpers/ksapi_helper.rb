module KsapiHelper
  def load_ksapi(path, title)
    "ksapi://load(#{{path: path, title: URI.escape(title)}.to_json})".strip
  end

  def button_ksapi(action, title, position)
    "ksapi://button(#{{buttonAction: action, buttonTitle: URI.escape(title), buttonPosition: position}.to_json})".strip
  end

  def login_ksapi
    "ksapi://login(#{{}.to_json})".strip
  end

  def logout_ksapi
    "ksapi://logout(#{{}.to_json})".strip 
  end
end