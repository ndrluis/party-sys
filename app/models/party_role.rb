class PartyRole < ApplicationRecord
  has_and_belongs_to_many :people, join_table: :person_party_roles
end
