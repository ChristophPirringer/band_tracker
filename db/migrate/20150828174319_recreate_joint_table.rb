class RecreateJointTable < ActiveRecord::Migration
  def change

    drop_table(:bands_venues)

    create_table(:bands_venues) do |t|
      t.column(:band_id, :integer)
      t.column(:venue_id, :integer)
    end
    
  end
end
