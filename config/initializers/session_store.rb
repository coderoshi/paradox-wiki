# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_paradox-wiki_session',
  :secret      => 'c05c05877aee91e81a546edf60d3fc51377158cd06845573a78e74d9e1119ccbefdea27084e18a508329fb0d28e99de7bd8d0a2ad06f2d6e870c95d9b59a103e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
