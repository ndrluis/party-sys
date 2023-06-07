ActiveAdmin.register Person do
  permit_params :name, :rg, :cpf, :electoral_document, :party_member, party_role_ids: []

  form  do |f|
    f.inputs I18n.t('activerecord.attributes.person.personal_data') do
      f.input :name
      f.input :rg
      f.input :cpf
      f.input :electoral_document
    end

    f.inputs I18n.t('activerecord.attributes.person.party_data') do
      f.input :party_member
      f.input :party_role_ids, as: :selected_list
    end

    f.actions
  end

  index do
    selectable_column

    column :id

    column :name
    column :rg
    column :cpf
    column :party_member

    actions
  end

  show do
    attributes_table do
      row :name
      row :rg
      row :cpf
      row :electoral_document
      row :party_member
      row :party_roles do |person|
        person.party_roles.pluck(:name).join(', ')
      end
      row :created_at
      row :updated_at
    end
  end

  filter :name_or_rg_or_cpf_cont, label: 'Nome, RG ou CPF'
  filter :party_member, as: :boolean, label: 'Filiado?'
  filter :party_roles, as: :select, collection: -> { PartyRole.all }
  filter :created_at, as: :date_time_picker_filter
end
