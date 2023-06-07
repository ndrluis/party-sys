class Person < ApplicationRecord
  has_and_belongs_to_many :party_roles, join_table: :person_party_roles

  def self.ransackable_scopes(_auth_object = nil)
    %i[search]
  end

  scope :search, ->(query) {
    ransack(name_or_rg_or_cpf_cont: query).result(distinct: true)
  }
end
