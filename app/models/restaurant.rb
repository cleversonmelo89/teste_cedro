class Restaurant
  include Mongoid::Document
  field :name, type: String

  def as_json(*args)
    att = super
    att["_id"] = att["_id"].to_s
    att
  end
end
