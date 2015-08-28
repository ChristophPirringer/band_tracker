class AddPricesToBandAndVenue < ActiveRecord::Migration
  def change
    add_column(:venues, :price, :integer)
    add_column(:bands, :price, :integer)
  end
end
