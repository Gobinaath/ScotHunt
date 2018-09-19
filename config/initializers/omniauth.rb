Rails.application.config.middleware.use OmniAuth::Builder do 

	provider :google_oauth2, '224741060280-c3jrvol8cc0e16k71crikdrdc7mqoolv.apps.googleusercontent.com','uf2r7JlZoT8lNBpKTyOBHGo-'
    provider :linkedin, '81gm73616x7ehs','mqzftAka3mjFeN6F'

end