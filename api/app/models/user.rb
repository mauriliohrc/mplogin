class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  devise :database_authenticatable, 
        :registerable, 
        :jwt_authenticatable, 
        :timeoutable,
        jwt_revocation_strategy: JwtDenylist

end
