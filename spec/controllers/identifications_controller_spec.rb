# == Schema Information
#
# Table name: identifications
#
#  id          :integer          not null, primary key
#  text        :string
#  language_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_identifications_on_language_id  (language_id)
#
# Foreign Keys
#
#  fk_rails_d706eacb3f  (language_id => languages.id)
#

require 'rails_helper'

RSpec.describe IdentificationsController, type: :controller do

  describe "GET #index" do
    it "populates an array of identifications" do
      identification = FactoryGirl.create(:identification)
      get :index
      expect(assigns(:identifications)).to eq([identification])
    end
    
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested identification to @identification" do
      identification = FactoryGirl.create(:identification)
      get :show, id: identification
      expect(assigns(:identification)).to eq(identification)
    end
    
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:identification)
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new identification" do
      get :new
      expect(assigns(:identification)).to be_a_new(Identification)
    end
    
    it "renders the #show view" do
      get :new
      expect(response).to render_template :new
    end
  end

   describe "POST #create" do
    let(:identifier) { double 'Identifier', process: true }
    before(:each) do
      stub_const 'Identifier', double(new: identifier)
    end

    context "with valid params" do
      it "creates a new Identification" do
        expect {
          post :create, identification: FactoryGirl.attributes_for(:identification)
        }.to change(Identification, :count).by(1)
      end

      it "assigns a newly created identification as @identification" do
        post :create, identification: FactoryGirl.attributes_for(:identification)
        expect(assigns(:identification)).to be_a(Identification)
        expect(assigns(:identification)).to be_persisted
      end

      it "redirects to the created identification" do
        post :create, identification: FactoryGirl.attributes_for(:identification)
        expect(response).to redirect_to(Identification.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved identification as @identification" do
        post :create, identification: FactoryGirl.attributes_for(:invalid_identification)
        expect(assigns(:identification)).to be_a_new(Identification)
      end

      it "re-renders the 'new' template" do
        post :create, identification: FactoryGirl.attributes_for(:invalid_identification)
        expect(response).to render_template("new")
      end
    end
  end
end
