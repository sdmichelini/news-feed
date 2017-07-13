require 'rails_helper'

RSpec.describe 'Articles API', type: :request do
    let!(:articles) { create_list(:article, 10) }
    let(:article_id) { articles.first.id }

    # Test suite for GET /todos
    describe 'GET /articles' do
        # make HTTP get request before each example
        before { get '/articles' }

        it 'returns todos' do
            # Note `json` is a custom helper to parse JSON responses
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'GET /articles/:id' do
        before { get "/articles/#{article_id}" }
        context 'when the record exists' do
            it 'returns the article' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(article_id)
            end
            
            it 'returns status 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the record does not exist' do
            let(:article_id) { 100 }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Article/)
            end
        end
    end

    # Test suite for POST /todos
    describe 'POST /articles' do
        # valid payload
        let(:valid_attributes) { { title: 'New Article', shared_by: 'test', url: 'test' } }

        context 'when the request is valid' do
            before { post '/articles', params: valid_attributes }

            it 'creates an article' do
                expect(json['title']).to eq('New Article')
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            before { post '/articles', params: { title: 'Foobar', url: 'test' } }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns a validation failure message' do
                expect(response.body).to match(/Validation failed: Shared by can't be blank/)
            end
        end
    end
end