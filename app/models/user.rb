class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
   user = find_or_create_by(uid: auth_info.uid)

   user.update_attributes(
   name: auth_info.info.name,
   screen_name: auth_info.info.nickname,
   image: auth_info.info.image,
   oauth_token: auth_info.credentials.token,
   oauth_token_secret: auth_info.credentials.secret
   )
   user.save
   user
  end
end
