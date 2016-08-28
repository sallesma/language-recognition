class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :train]

  def index
    @languages = Language.all
  end

  def show
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)

    if @language.save
      redirect_to @language, notice: 'Language was successfully created.'
    else
      render :new
    end
  end

  def train
    Trainer.new.process(@language)
    redirect_to @language, notice: 'Language was successfully trained.'
  end

  private
    def set_language
      @language = Language.find(params[:id])
    end

    def language_params
      params.require(:language).permit(:locale, :name, :local_name)
    end
end
