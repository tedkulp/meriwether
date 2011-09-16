class Subdomain
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  index :name, :unique => true

  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :users
  belongs_to :created_by, :class_name => 'User'
end
