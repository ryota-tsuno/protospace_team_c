class ProtoTag < ActiveRecord::Base
  belongs_to :protorype
  belongs_to :tag
end
