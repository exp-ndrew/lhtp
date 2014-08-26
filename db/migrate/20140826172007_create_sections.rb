class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.column :name, :string
    end
    add_column :lessons, :section_id, :int
  end
end
