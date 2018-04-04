class Plate
  include Mongoid::Document
  field :name, type: String
  field :price, type: Float

  belongs_to :restaurants

  def as_json(*args)
    att = super
    att["_id"] = att["_id"].to_s
    att["restaurants_id"] = att["restaurants_id"].to_s
    att
  end
end
