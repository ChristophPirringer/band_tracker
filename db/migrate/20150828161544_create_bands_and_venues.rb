class CreateBandsAndVenues < ActiveRecord::Migration
  def change

    create_table(:bands) do |t|
      t.column(:name, :string)
    end

    create_table(:venues) do |t|
      t.column(:name, :string)
    end

    create_table(:bands_venues) do |t|
      t.column(:band_id, :string)
      t.column(:venue_id, :string)
    end
    
  end
end
