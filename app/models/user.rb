class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :email, uniqueness: true

    def user_super_email
        self[:email]
    end
end
