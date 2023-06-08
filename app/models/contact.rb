class Contact
  include ActiveModel::Model

  attr_accessor :name, :email, :subject, :content

  validates :name, presence: true
  validates :email, presence: true
  validates :subject, presence: true
  validates :content, presence: true, length: {maximum: 500}

end