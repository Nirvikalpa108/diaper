class RenameDiaperDriveParticipantToProvider < ActiveRecord::Migration[5.2]
  def change
    rename_table :diaper_drive_participants, :providers
    add_column :providers, :type, :string, default: 'DiaperDriveParticipant'
  end
end
