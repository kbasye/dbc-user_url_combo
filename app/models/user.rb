class User < ActiveRecord::Base
  has_many :urls


  # e.g., User.authenticate('jesse@devbootcamp.com', 'apples123')
  def self.authenticate(email, password)
    user = User.where(:username => email, :password => password)
    if user.empty?
        nil
    else
        user
    end

  end

end



# user = User.where(:username => "otilia@buckridge.info", :password => "password")
