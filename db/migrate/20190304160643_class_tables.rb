class ClassTables < ActiveRecord::Migration[5.0]
  def change
    create_table (:users) do |t|
      t.string :name
    end

    create_table (:kits) do |t|
      t.string :name
      t.integer :user_id
    end

    create_table(:sounds) do |t|
      t.string :sound_path
    end

    create_table(:kitsounds) do |t|
      t.integer :kit_id
      t.integer :sound_id
    end
  end
end
