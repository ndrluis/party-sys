class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :rg
      t.string :cpf
      t.string :electoral_document

      t.timestamps
    end
  end
end
