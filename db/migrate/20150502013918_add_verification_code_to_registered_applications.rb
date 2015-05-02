class AddVerificationCodeToRegisteredApplications < ActiveRecord::Migration
  def change
    add_column :registered_applications, :verification_code, :string
  end
end
