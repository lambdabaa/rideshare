Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '224061857645056', '95f60e2e738851b66e0046cda25e8022',
  		   :scope => 'email', :display => 'popup'
end

  