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

    it "has url" do
      expect(RegisteredApplication.new(url: "http://google.com")).to have_attributes(url: "http://google.com")
    end

    it "has user_id" do
      expect(RegisteredApplication.new(user_id: "1")).to have_attributes(user_id: 1)
    end

    context "created_at" do
      it "is an attribute" do
        today = Date.today
        expect(RegisteredApplication.new(created_at: today)).to have_attributes(created_at: today)
      end

      it "defaults to nil" do
        now = Time.zone.now
        today = now.to_date
        travel_to now do
          expect(RegisteredApplication.new.created_at).to eq(nil)
        end
      end
    end

    context "updated_at" do
      it "is an attribute" do
        today = Date.today
        expect(RegisteredApplication.new(updated_at: today)).to have_attributes(updated_at: today)
      end

      it "defaults to nil" do
        now = Time.zone.now
        today = now.to_date
        travel_to now do
          expect(RegisteredApplication.new.updated_at).to eq(nil)
        end
      end
    end
  end

  context "validation" do

    before do
      @registered_application = RegisteredApplication.new(name: "Google", url: "http://google.com")
    end

    it "requires name" do
      expect(@registered_application).to validate_presence_of(:name)
    end

    it "requires unique name" do
      expect(@registered_application).to validate_uniqueness_of(:name)
    end

    it "requires url" do
      expect(@registered_application).to validate_presence_of(:url)
    end

    it "requires unique url" do
      expect(@registered_application).to validate_uniqueness_of(:url)
    end

  end
end
