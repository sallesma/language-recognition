class TrainingsController < ApplicationController
  before_action :set_training, only: :show
  before_action :set_language

  def index
    @trainings = @language.trainings.all
  end

  def show
  end

  def new
    @training = @language.trainings.build
  end

  def create
    @training = @language.trainings.build(training_params)

    if @training.save
      Trainer.new.process(@training)
      redirect_to language_training_path(id: @training), notice: 'Training was successfull.'
    else
      render :new
    end
  end

  private

    def set_language
      @language = Language.find(params[:language_id])
    end

    def set_training
      @training = Training.find(params[:id])
    end

    def training_params
      params.require(:training).permit(:text)
    end
end
