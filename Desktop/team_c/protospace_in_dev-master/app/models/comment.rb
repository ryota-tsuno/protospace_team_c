class Comment < ActiveRecord::Base
  belongs_to :prototype               #prototypesテーブルとのアソシエーション
  belongs_to :user                #usersテーブルとのアソシエーション
end
