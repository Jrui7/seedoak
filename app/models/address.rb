class Address < ApplicationRecord
  belongs_to :user

  validates :first_name,
    presence: {
    message: "Présence obligatoire"
    }

  validates :last_name,
    presence: {
    message: "Présence obligatoire"
    }

  validates :street,
    presence: {
    message: "Présence obligatoire"
    }

  validates :zip_code,
    presence: {
    message: "Présence obligatoire"
    }

  validates :city,
    presence: {
    message: "Présence obligatoire"
    }


end
