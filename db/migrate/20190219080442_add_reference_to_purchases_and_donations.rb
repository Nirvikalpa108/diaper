class AddReferenceToPurchasesAndDonations < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchases, :provideable, polymorphic: true, index: true
    add_reference :donations, :provideable, polymorphic: true, index: true

    Donation.each do |donation|
      unless donation.diaper_drive_participant_id.nil?
        donation.update_attribute(:provideable_id, donation.diaper_drive_participant_id)
        donation.update_attribute(:provideable_type, 'Provider')
      end
    end

    remove_column :donations, :diaper_drive_participant_id
  end
end
