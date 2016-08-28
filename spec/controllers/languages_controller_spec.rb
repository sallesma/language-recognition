require 'rails_helper'

RSpec.describe LanguagesController, type: :controller do

  describe "GET #index" do
    it "populates an array of languages" do
      language = FactoryGirl.create(:language)
      get :index
      expect(assigns(:languages)).to eq([language])
    end
    
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested language to @language" do
      language = FactoryGirl.create(:language)
      get :show, id: language
      expect(assigns(:language)).to eq(language)
    end
    
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:language)
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new language" do
      get :new
      expect(assigns(:language)).to be_a_new(Language)
    end
    
    it "renders the #show view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do

    context "with valid params" do
      it "creates a new language" do
        expect {
          post :create, language: FactoryGirl.attributes_for(:language)
        }.to change(Language, :count).by(1)
      end

      it "assigns a newly created language as @language" do
        post :create, language: FactoryGirl.attributes_for(:language)
        expect(assigns(:language)).to be_a(Language)
        expect(assigns(:language)).to be_persisted
      end

      it "redirects to the created language" do
        post :create, language: FactoryGirl.attributes_for(:language)
        expect(response).to redirect_to(Language.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved language as @language" do
        post :create, language: FactoryGirl.attributes_for(:invalid_language)
        expect(assigns(:language)).to be_a_new(Language)
      end

      it "re-renders the 'new' template" do
        post :create, language: FactoryGirl.attributes_for(:invalid_language)
        expect(response).to render_template("new")
      end
    end
  end

  describe 'PATCH #train' do
    before :each do
      @language = FactoryGirl.create(:language)
    end
    
    context "valid attributes" do
      it "located the requested @language" do
        patch :train, id: @language
        expect(assigns(:language)).to eq(@language)
      end
    
      it "calls a trainer service" do
        expect_any_instance_of(Trainer).to receive(:process).with(@language)
        patch :train, id: @language
      end
    
      it "redirects to the trained contact" do
        patch :train, id: @language
        expect(response).to redirect_to @language
      end
    end
  end
end
