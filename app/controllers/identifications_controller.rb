class IdentificationsController < ApplicationController
  before_action :set_identification, only: :show

  def index
    @identifications = Identification.all
  end

  def show
  end

  def new
    @identification = Identification.new
  end

  def create
    @identification = Identification.new(identification_params)

    if @identification.save
      Identifier.new.process(@identification)
      redirect_to @identification, notice: 'Identification was successfully created.'
    else
      render :new
    end
  end

  private
  
    def set_identification
      @identification = Identification.find(params[:id])
    end

    def identification_params
      params.require(:identification).permit(:text)
    end
end
