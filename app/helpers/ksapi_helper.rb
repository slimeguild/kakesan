module KsapiHelper
  def load_ksapi(path, title)
    URI.encode("ksapi://load(#{{path: path, title: URI.escape(title)}.to_json})".strip)
  end

  def button_ksapi(action, title, position)
    URI.encode("ksapi://button(#{{buttonAction: action, buttonTitle: URI.escape(title), buttonPosition: position}.to_json})")
  end

  def login_ksapi
    URI.encode("ksapi://login(#{{}.to_json})")
  end

  def logout_ksapi
    URI.encode("ksapi://logout(#{{}.to_json})" )
  end
end