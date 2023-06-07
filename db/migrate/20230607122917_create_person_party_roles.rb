class CreatePersonPartyRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :person_party_roles do |t|
      t.references :person, null: false, foreign_key: true
      t.references :party_role, null: false, foreign_key: true

      t.timestamps
    end

    add_index :person_party_roles, [:person_id, :party_role_id], unique: true

    # Add the association in Person model
    add_reference :people, :party_role, foreign_key: true
  end
end
