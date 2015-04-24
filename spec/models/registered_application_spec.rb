require 'rails_helper'

describe RegisteredApplication, type: :model do
  it "has a valid factory" do
    expect(build(:registered_application)).to be_valid
  end

end
