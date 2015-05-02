class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @events = @registered_application.events
    respond_with(@registered_application)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def edit
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)

    respond_to do |format|
      if @registered_application.save
        format.html { redirect_to @registered_application, notice: 'Registered application was successfully created.' }
        format.json { render :show, status: :created, location: @registered_application }
      else
        format.html { render :new }
        format.json { render json: @registered_application.errors, status: :unprocessable_entity }
      end
      @registered_application.verification_code = SecureRandom.hex
    end
  end

  def update
    respond_to do |format|
      if @registered_application.update(registered_application_params)
        format.html { redirect_to @registered_application, notice: 'Registered Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @registered_application }
      else
        format.html { render :edit }
        format.json { render json: @registered_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @registered_application.destroy
    respond_to do |format|
      format.html { redirect_to registered_applications_url, notice: 'Registered Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_registered_application
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end
end
