class User < ActiveRecord::Base

    def self.user_all
        self.all
    end
end
