Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1059761967483978", "1ccbd8d6283182877fa5769127e64e83", scope: 'public_profile', info_fields: 'id,name,link'
end
