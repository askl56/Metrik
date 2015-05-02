require 'rails_helper'

RSpec.describe RegisteredApplication, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user}
  
  it { is_expected.to have_many :events}

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
	it { is_expected.to have_db_column :name }
	it { is_expected.to have_db_column :url }
	it { is_expected.to have_db_column :user_id }
	it { is_expected.to have_db_column :created_at }
	it { is_expected.to have_db_column :updated_at }
	it { is_expected.to have_db_column :verified }
	it { is_expected.to have_db_column :verification_code }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["user_id"]}

  # === Validations (Length) ===
  it { is_expected.to allow_value(Faker::Lorem.characters(1)).for :name }
	it { is_expected.not_to allow_value(Faker::Lorem.characters(0)).for :name }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :name }
	it { is_expected.to validate_presence_of :url }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end