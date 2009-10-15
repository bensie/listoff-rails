# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_listoff_session',
  :secret      => '98b9a6d59e667fa19f04fd5d258e4bb574e06281d40f79827136113f976a9da8075f4f14a406c09a9ff00859d53480cd497ac9e3611243410c55e39726a7a2d2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
