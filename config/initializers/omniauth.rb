Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :twitter, "Pluj6uKMZ0fXvsOE3MmPQ", "082SmDfoWrcFy2FzzSIBKYIgoZbtDFuBSeg2GsAED0"
  elsif Rails.env.production?
    provider :twitter, "0bCVPZXNW2zNxII9GPaHiw", "Q5rRhOiMy5weCYeKX9cqEOVR2pgZsIm6qIPM79M74"
  end
end