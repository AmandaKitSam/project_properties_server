Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3000' , 'https://amandakitsam.github.io/properties_client/' # Change this to the live production URL
    resource '*',
      :headers => :any,
      :methods => %i(get post put patch delete options head),
      :credentials => true
  end
end
