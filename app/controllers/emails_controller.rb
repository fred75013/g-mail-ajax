class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy ]
  require 'faker'
  # GET /emails or /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1 or /emails/1.json
  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      
      format.html { redirect_to emails_url}
      format.js {}
    end
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails or /emails.json
  def create
    @email = Email.new(object:Faker::Games::SuperMario.game, body: Faker::ChuckNorris.fact, read: false)

    respond_to do |format|
      if @email.save
        format.html { redirect_to email_path }
        format.js { }

      else
        format.html { redirect_to email_path }
        format.js { }
      end
    end
  end

  # PATCH/PUT /emails/1 or /emails/1.json
  def update
    @email = Email.find(params[:id])
    if @email.read === true
      @email.update(read: false)
    else 
      @email.update(read: true)
    end
  
  end


  # DELETE /emails/1 or /emails/1.json
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: "Email was successfully destroyed." }
      format.js { }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:object, :body)
    end
end
