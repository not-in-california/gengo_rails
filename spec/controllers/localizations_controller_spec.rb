require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe LocalizationsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Localization. As you add validations to Localization, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { path: "en.views.users.show", value: "Show User", locale: "en" }
  }

  let(:invalid_attributes) {
    { path: "", value: "", locale: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LocalizationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all localizations as @localizations" do
      localization = Localization.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:localizations)).to eq([localization])
    end
  end

  describe "GET #show" do
    it "assigns the requested localization as @localization" do
      localization = Localization.create! valid_attributes
      get :show, {:id => localization.to_param}, valid_session
      expect(assigns(:localization)).to eq(localization)
    end
  end

  describe "GET #new" do
    it "assigns a new localization as @localization" do
      get :new, {}, valid_session
      expect(assigns(:localization)).to be_a_new(Localization)
    end
  end

  describe "GET #edit" do
    it "assigns the requested localization as @localization" do
      localization = Localization.create! valid_attributes
      get :edit, {:id => localization.to_param}, valid_session
      expect(assigns(:localization)).to eq(localization)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Localization" do
        expect {
          post :create, {:localization => valid_attributes}, valid_session
        }.to change(Localization, :count).by(1)
      end

      it "assigns a newly created localization as @localization" do
        post :create, {:localization => valid_attributes}, valid_session
        expect(assigns(:localization)).to be_a(Localization)
        expect(assigns(:localization)).to be_persisted
      end

      it "redirects to the created localization" do
        post :create, {:localization => valid_attributes}, valid_session
        expect(response).to redirect_to(Localization.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved localization as @localization" do
        post :create, {:localization => invalid_attributes}, valid_session
        expect(assigns(:localization)).to be_a_new(Localization)
      end

      it "re-renders the 'new' template" do
        post :create, {:localization => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { path: "pt-BR.views.users.show", value: "Ver Usuário", locale: "pt-BR" }
      }

      it "updates the requested localization" do
        localization = Localization.create! valid_attributes
        put :update, {:id => localization.to_param, :localization => new_attributes}, valid_session
        localization.reload
        expect(localization.locale).to eq("pt-BR")
        expect(localization.value).to eq("Ver Usuário")
        expect(localization.path).to eq("pt-BR.views.users.show")
      end

      it "assigns the requested localization as @localization" do
        localization = Localization.create! valid_attributes
        put :update, {:id => localization.to_param, :localization => valid_attributes}, valid_session
        expect(assigns(:localization)).to eq(localization)
      end

      it "redirects to the localization" do
        localization = Localization.create! valid_attributes
        put :update, {:id => localization.to_param, :localization => valid_attributes}, valid_session
        expect(response).to redirect_to(localization)
      end
    end

    context "with invalid params" do
      it "assigns the localization as @localization" do
        localization = Localization.create! valid_attributes
        put :update, {:id => localization.to_param, :localization => invalid_attributes}, valid_session
        expect(assigns(:localization)).to eq(localization)
      end

      it "re-renders the 'edit' template" do
        localization = Localization.create! valid_attributes
        put :update, {:id => localization.to_param, :localization => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested localization" do
      localization = Localization.create! valid_attributes
      expect {
        delete :destroy, {:id => localization.to_param}, valid_session
      }.to change(Localization, :count).by(-1)
    end

    it "redirects to the localizations list" do
      localization = Localization.create! valid_attributes
      delete :destroy, {:id => localization.to_param}, valid_session
      expect(response).to redirect_to(localizations_url)
    end
  end
  
  describe "POST #import" do
    context "with valid params" do
      before do
        @object_list = []
        3.times { |i| @object_list << { path: "path.#{i}", value: "Value #{i}", locale: "en" } }
      end
    
      it "should save all objects in database" do
        expect { post :import, localizations_list: @object_list }.to change { Localization.count }.by(3)
      end
    
      it "should redirect to localizations list" do
        post :import, localizations_list: @object_list
        expect(response.body).to match(/localizations/)
        expect(response.body).to match(/valid_localizations/)
        expect(response.body).to match(/invalid_localizations/)
      end
    end
    
    context "with invalid data" do
      before do
        @object_list = []
        3.times { |i| @object_list << { path: "path.#{i}", value: "Value #{i}", locale: "" } }
      end
    
      it "should save all objects in database" do
        expect { post :import, localizations_list: @object_list }.to change { Localization.count }.by(0)
      end
    end 
    
    context "with duplicated data" do
      before do
        @object_list = []
        3.times do |i| 
          @object_list << { path: "path.#{i}", value: "Value #{i}", locale: "en" }
          @object_list << { path: "path.#{i}", value: "Value #{i}", locale: "en" }
        end
      end
    
      it "should save all objects in database" do
        expect { post :import, localizations_list: @object_list }.to change { Localization.count }.by(3)
      end
    end 
    
    context "with no data" do
      it "should save no objects in database" do
        expect { post :import }.to change { Localization.count }.by(0)
      end
    end
  end

  describe "POST #update_job" do
    context "status is approved" do
      before do
        @localization = FactoryGirl.create(:localization, job_id: "1298342", data: nil)
        @job_data = {job_id: "1298342", custom_data: @localization.id.to_s, body_src: "other value", lc_src: "en", lc_tgt: "de", unit_count: "2", tier: "standard", credits: "0.10", status: "approved", eta: "-1", ctime: "1424894043", callback_url: "http:\/\/requestb.in\/1mscujf1", auto_approve: "1", body_tgt: "anderen Wert"}.stringify_keys
        post(:update_job, job: @job_data.to_json)
      end

      it "should return 200" do
        expect(response.status).to eq 200
      end

      it "should update status and save response data" do
        expect(@localization.reload.status).to eq "approved"
        expect(@localization.data).to eq @job_data
      end
    end
  end
  
  describe "POST #send_to_gengo" do
    context "without any filter" do
      before do
        @localizations = []
        2.times { @localizations << create(:localization, data: {}) }
        @localization = create(:localization, job_id: "123456")
        @package = double('TranslationPackage')
        allow(TranslationPackage).to receive(:new).and_return(@package)
        allow(@package).to receive(:send_to_gengo)
      end
      
      it "queries only translations without a job" do
        post :send_to_gengo
        expect(assigns(:localizations)).not_to include @localization
      end
      
      it "calls new on TranslationPackage with selected locations" do
        expect(TranslationPackage).to receive(:new).with(@localizations, update_job_localizations_url)
        post :send_to_gengo
      end
      
      it "calls send_to_gengo on package" do
        expect(@package).to receive(:send_to_gengo)
        post :send_to_gengo
      end
      
      it "flash success message" do
      end
      
      it "redirects to index" do
        post :send_to_gengo
        expect(response).to redirect_to localizations_path
      end
    end
  end
end
