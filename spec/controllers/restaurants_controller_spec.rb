require 'spec_helper'

describe Api::V1::RestaurantsController, type: :controlle do

  context "When execute end-points of Api" do

    it "should success when send post" do
    end

    it "should success when call get" do
      restaurants = Restaurant.create(name: "restaurante-1")
      get 'index'
    end

    it "should success when send put" do
    end

    it "should success when send delete" do
    end

  end

end
