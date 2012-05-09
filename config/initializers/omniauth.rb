Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '224061857645056', '95f60e2e738851b66e0046cda25e8022',
    :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}
end

  