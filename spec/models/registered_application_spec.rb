require 'rails_helper'

describe RegisteredApplication, type: :model do
  it "has a valid factory" do
    expect(build(:registered_application)).to be_valid
  end

  context "db" do
    context "indexes" do
      it { should have_db_index(:user_id) }
    end

    context "columns" do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:url).of_type(:string) }
      it { should have_db_column(:user_id).of_type(:integer) }
      it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  context "attributes" do
    it "has name" do
      expect(RegisteredApplication.new(name: "Google")).to have_attributes(name: "Google")
    end

  end

end
