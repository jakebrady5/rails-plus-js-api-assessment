class JobSerializer < ActiveModel::Serializer
  attributes :id
  has_many :work_orders
  has_one :mechanic
  has_one :customer
end
