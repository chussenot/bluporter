class User 
  include Mongoid::Document
  field :pseudo, type: String
  field :email, type: String
end