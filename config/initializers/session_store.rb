# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_DisThorrent_session',
  :secret      => 'b7f2146694487a4480f0f9d87842c9815cc5576c0021650758b32df57b83207e806a8f1e66c33edea468320591b063bdac9fb5ab0f9d2c000665de493909ede9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
