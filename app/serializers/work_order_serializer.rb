class WorkOrderSerializer < ActiveModel::Serializer
  attributes :id, :description, :price, :status
end
