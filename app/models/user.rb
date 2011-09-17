class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  belongs_to :subdomain

  validates :email, :presence => true, :uniqueness => { :scope => [:subdomain_id] }, :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
  validates :password, :presence => true, :confirmation => true, :length => { :within => 6..128 }
  validates :subdomain, :presence => true
end
