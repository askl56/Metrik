class AddVerifiedToRegisteredApplications < ActiveRecord::Migration
  def change
    add_column :registered_applications, :verified, :boolean, default: false
  end
end
