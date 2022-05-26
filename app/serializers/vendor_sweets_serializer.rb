class VendorSweetsSerializer < ActiveModel::Serializer
  attributes :id, :name, :price 

  has_many :vendor_sweets
end
