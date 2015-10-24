require 'rails_helper'

describe Event, type: :model do
  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  context "db" do
    context "indexes" do
      it { is_expected.not_to have_db_index(:id) }
    end

    context "columns" do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:registered_application_id).of_type(:integer) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  context "attributes" do
    it "has name" do
      expect(Event.new(name: "Google")).to have_attributes(name: "Google")
    end

    it "has registered_application_id " do
      expect(Event.new(registered_application_id: "1")).to have_attributes(registered_application_id: 1)
    end

    context "created_at" do
      it "is an attribute" do
        today = Date.today
        expect(Event.new(created_at: today)).to have_attributes(created_at: today)
      end

      it "defaults to nil" do
        now = Time.zone.now
        today = now.to_date
        travel_to now do
          expect(Event.new.created_at).to eq(nil)
        end
      end
    end

    context "updated_at" do
      it "is an attribute" do
        today = Date.today
        expect(Event.new(updated_at: today)).to have_attributes(updated_at: today)
      end

      it "defaults to nil" do
        now = Time.zone.now
        today = now.to_date
        travel_to now do
          expect(Event.new.updated_at).to eq(nil)
        end
      end
    end
  end

  context "validation" do
    before do
      @event = Event.new(name: "Google")
    end

    it { is_expected.to belong_to (:registered_application) }

    it "requires name" do
      expect(@event).to validate_presence_of(:name)
    end
  end
end
