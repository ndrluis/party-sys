class AddPartyMemberToPeople < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :party_member, :boolean
  end
end
