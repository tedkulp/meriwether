class Subdomain
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  index :name, :unique => true

  validates :name, :presence => true, :uniqueness => true, :subdomain => true
  
  has_many :users
  belongs_to :created_by, :class_name => 'User'
end
