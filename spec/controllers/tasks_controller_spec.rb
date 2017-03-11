require 'rails_helper'

RSpec.describe TasksController, type: :controller do

	describe "GET #index" do
		it "returns all tasks as json"

		it "returns a 200 status code"
	end

	describe "GET #show" do
		it "returns a specific task as json"

		it "returns a 200 status code"
	end

	describe "PUT #update" do
		context "with valid data" do
			it "returns a 200 status code"

			it "renders @task as json"
		end

		context "with invalid data" do
			it "return a 422 status code"

			it "renders @task as json"
		end
	end

	describe "POST #create" do
		context "with valid data" do
			it "increases Task count by one"

			it "renders a 200 status code"

			it "renders @task as json"
		end

		context "with invalid data" do
			it "does not increase Task count"

			it "renders a 422 status code"

			it "renders a error message"
		end
	end

	describe "DELETE #destroy" do
		context "with success" do
			it "decreases Task count by one"

			it "renders a 200 status code"

			it "renders @task as json"
		end

		context "without success" do
			it "does not descrease Task count"

			it "renders a 422 status code"

			it "renders @task as json"
		end
	end

end