class CreateVolatileContents < ActiveRecord::Migration[7.1]
  def change
    create_table :volatile_contents do |t|
      t.decimal :min_content
      t.decimal :max_content

      t.timestamps
    end
  end
end
