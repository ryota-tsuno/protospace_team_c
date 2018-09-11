class CreateProtoTags < ActiveRecord::Migration
  def change
    create_table :proto_tags do |t|
      t.references :protorype, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
      t.timestamps
    end
  end
end
