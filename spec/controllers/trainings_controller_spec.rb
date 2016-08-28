# == Schema Information
#
# Table name: trainings
#
#  id          :integer          not null, primary key
#  text        :string
#  processed   :boolean
#  language_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_trainings_on_language_id  (language_id)
#
# Foreign Keys
#
#  fk_rails_9953539391  (language_id => languages.id)
#

require 'rails_helper'

RSpec.describe TrainingsController, type: :controller do
  before :all do
    @language = FactoryGirl.create(:language)
  end
  after :all do
    @language.destroy
  end

  describe "GET #index" do
    it "populates an array of trainings" do
      training = FactoryGirl.create(:training, language: @language)
      get :index, language_id: @language
      expect(assigns(:trainings)).to eq([training])
    end
    
    it "renders the :index view" do
      get :index, language_id: @language
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested training to @training" do
      training = FactoryGirl.create(:training, language: @language)
      get :show, language_id:@language, id: training
      expect(assigns(:training)).to eq(training)
    end
    
    it "renders the #show view" do
      get :show, language_id: @language, id: FactoryGirl.create(:training, language: @language)
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new training" do
      get :new, language_id: @language
      expect(assigns(:training)).to be_a_new(Training)
    end
    
    it "renders the #show view" do
      get :new, language_id: @language
      expect(response).to render_template :new
    end
  end

   describe "POST #create" do
    let(:trainer) { double 'Trainer', process: true }
    before(:each) do
      stub_const 'Trainer', double(new: trainer)
    end

    context "with valid params" do
      it "creates a new training" do
        expect {
          post :create, training: FactoryGirl.attributes_for(:training), language_id: @language
        }.to change(Training, :count).by(1)
      end

      it "assigns a newly created training as @training" do
        post :create, training: FactoryGirl.attributes_for(:training), language_id: @language
        expect(assigns(:training)).to be_a(Training)
        expect(assigns(:training)).to be_persisted
      end

      it "redirects to the created training" do
        post :create, training: FactoryGirl.attributes_for(:training), language_id: @language
        expect(response).to redirect_to(language_training_path(id: Training.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved training as @training" do
        post :create, training: FactoryGirl.attributes_for(:invalid_training), language_id: @language
        expect(assigns(:training)).to be_a_new(Training)
      end

      it "re-renders the 'new' template" do
        post :create, training: FactoryGirl.attributes_for(:invalid_training), language_id: @language
        expect(response).to render_template("new")
      end
    end
  end
end
