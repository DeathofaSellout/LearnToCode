class User < ApplicationRecord
  has_many :post_comments
  has_many :posts

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }

  def name
    "User #{id}"
  end

  def self.confirm(params)
    @user = User.find_by({username: params[:username]})
    @user ? @user.authenticate(params[:password]) : false
  end
end