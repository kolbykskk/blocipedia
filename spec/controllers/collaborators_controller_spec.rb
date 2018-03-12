require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:wiki) { create(:wiki) }

  describe "GET #new" do
    it "returns http status of success" do
      get :new, params: { wiki_id: wiki.id }
      expect(response).to have_http_status :success
    end

    it "renders the new template" do
      get :new, params: { wiki_id: wiki.id }
      expect(response).to render_template :new
    end

    it "instantiates @collaborator" do
      get :new, params: { wiki_id: wiki.id }
      expect(assigns(:collaborator)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increases the number of collaborators by 1" do
      expect{ post :create, params: { wiki_id: wiki.id, collaborator: { email: another_user.email } } }.to change(Collaborator,:count).by(1)
    end

    it "assigns the new collaborator to @collaborator" do
      post :create, params: { wiki_id: wiki.id, collaborator: { email: another_user.email } }
      expect(assigns(:collaborator)).to eq Collaborator.last
    end

    it "redirects to the wiki where a collaborator was added" do
      post :create, params: { wiki_id: wiki.id, collaborator: { email: another_user.email } }
      expect(response).to redirect_to Wiki.last
    end
  end
end
