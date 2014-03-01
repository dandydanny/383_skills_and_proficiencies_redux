class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      # Not needed when t.belongs_to is present
      # t.integer :user_id
      # t.integer :skill_id

      t.integer :years
      t.boolean :formal, default: false
      t.timestamps

      t.belongs_to :user
      t.belongs_to :skill
    end
  end
end
