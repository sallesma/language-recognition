class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def identify
    text = params[:text]
    language = Identifier.identify(text)
    render json: language
  end

  def training
    text = params[:text]
    language = params[:language]
    Trainer.train(text, language)
    head :ok
  end
end
