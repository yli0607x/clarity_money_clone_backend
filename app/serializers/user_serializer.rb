class UserSerializer < ActiveModel::Serializer
  attributes :username, :avatar, :email, :firstname, :lastname, :id
end
