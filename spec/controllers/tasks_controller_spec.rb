require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe "GET #index" do
    before do
      @task = create(:task)
    end

    it "returns all tasks to @task" do
      get :index
      expect(assigns(:tasks)).to eq([@task])
    end

    it "returns all tasks as json" do
      get :index
      expected = [{ id: @task.id, title: @task.title, position: @task.position, start_times: [] }].to_json
      expect(response.body).to eq(expected)
    end

    it "returns a 200 status code" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    before do
      @task = create(:task)
    end

    it "returns a specific task as json" do
      get :show, id: @task.id
      expected = { id: @task.id, title: @task.title, position: @task.position, start_times: [] }.to_json
      expect(response.body).to eq(expected)
    end

    it "returns a 200 status code" do
      get :show, id: @task.id
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do
    before do
      @task = create(:task)
    end

    context "with valid data" do
      before do
        @params = { title: "New title" }
      end

      it "returns a 200 status code" do
        put :update, id: @task.id, task: @params
        expect(response).to have_http_status(200)
      end

      it "renders @task as json" do
        put :update, id: @task.id, task: @params
        expected = { id: @task.id, title: "New title", position: @task.position, start_times: [] }.to_json
        expect(response.body).to eq(expected)
      end
    end

    context "with invalid data" do
      before do
        @params = { title: "" }
      end

      it "return a 422 status code" do
        put :update, id: @task.id, task: @params
        expect(response).to have_http_status(422)
      end

      it "renders @task as json" do
        put :update, id: @task.id, task: @params
        expected = { id: @task.id, title: "", position: @task.position, start_times: [] }.to_json
        expect(response.body).to eq(expected)
      end
    end
  end

  describe "POST #create" do
    context "with valid data" do
      before do
        @params = { title: "New task" }
      end

      it "increases Task count by one" do
        expect{
          post :create, task: @params
        }.to change{ Task.count }.by(1)
      end

      it "renders a 200 status code" do
        post :create, task: @params
        expect(response).to have_http_status(200)
      end

      it "renders @task as json" do
        post :create, task: @params
        @task = assigns(:task)
        expected = { id: @task.id, title: "New task", position: @task.position, start_times: [] }.to_json

        expect(response.body).to eq(expected)
      end
    end

    context "with invalid data" do
      before do
        @params = { title: "" }
      end

      it "does not increase Task count" do
        expect{
          post :create, task: @params
        }.to_not change{ Task.count }
      end

      it "renders a 422 status code" do
        post :create, task: @params
        expect(response).to have_http_status(422)
      end

      it "renders a error message" do
        post :create, task: @params
        expected = { error: "Task is invalid" }.to_json
        expect(response.body).to eq(expected)
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @task = create(:task)
    end

    context "with success" do
      it "decreases Task count by one" do
        expect{
          delete :destroy, id: @task.id
        }.to change{ Task.count }.by(-1)
      end

      it "renders a 200 status code" do
        delete :destroy, id: @task.id
        expect(response).to have_http_status(200)
      end

      it "renders @task as json" do
        delete :destroy, id: @task.id
        expected = { id: @task.id, title: @task.title, position: @task.position, start_times: [] }.to_json
        expect(response.body).to eq(expected)
      end
    end

    context "without success" do
      before do
        allow_any_instance_of(Task).to receive(:destroy).and_return(false)
      end

      it "does not descrease Task count" do
        expect{
          delete :destroy, id: @task.id
        }.to_not change{ Task.count }
      end

      it "renders a 422 status code" do
        delete :destroy, id: @task.id
        expect(response).to have_http_status(422)
      end

      it "renders @task as json" do
        delete :destroy, id: @task.id
        expected = { id: @task.id, title: @task.title, position: @task.position, start_times: [] }.to_json
        expect(response.body).to eq(expected)
      end
    end
  end

end