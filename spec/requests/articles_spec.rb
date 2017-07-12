require 'rails_helper'

RSpec.describe 'Articles API', type: :request do
    let!(:articles) { create_list(:article, 10) }
    let(:article_id) { articles.first.id }

    describe 'GET /articles/:id' do
        before { get "/articles/#{article_id}" }
        context 'when the record exists' do
            it 'returns the article' do
                expect(json).not_to be_empty
                expect(json['id']).to.eq(article_id)
            end
            
            it 'returns status 200' do
                expect(response).to.have_http_status(200)
            end
        end

        context 'when the record does not exist' do
            let(:article_id) { 100 }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Artcle/)
            end
        end
    end
end