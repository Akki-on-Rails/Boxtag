class UserCollection < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  # add valiadtions for sharing with other users

  attr_accessor :email

  enum kind: { owner: 0, collaborator: 1 }, _prefix: true
end
