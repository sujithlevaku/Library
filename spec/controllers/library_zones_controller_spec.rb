require 'rails_helper'

RSpec.describe LibraryZonesController, type: :controller do
  include FactoryBot::Syntax::Methods

  describe 'GET #show' do
    let(:library_zone) { create(:library_zone) }

    context 'when format is JSON' do
      it 'returns the library zone and associated books in JSON format' do
        book1 = create(:book, library_zone: library_zone, status: 'available')
        book2 = create(:book, library_zone: library_zone, status: 'checkedOut', checked_out_by: 'John Doe')
        get :show, params: { id: library_zone.id }, format: :json

        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq('application/json')

        response_body = JSON.parse(response.body)
        expect(response_body['id']).to eq(library_zone.id)
        expect(response_body['name']).to eq(library_zone.name)

        expect(response_body['books'].length).to eq(2)

        expect(response_body['books'][0]['id']).to eq(book1.id)
        expect(response_body['books'][0]['title']).to eq(book1.title)
        expect(response_body['books'][0]['author']).to eq(book1.author)
        expect(response_body['books'][0]['status']).to eq(book1.status)
        expect(response_body['books'][0]['checked_out_by']).to be_nil

        expect(response_body['books'][1]['id']).to eq(book2.id)
        expect(response_body['books'][1]['title']).to eq(book2.title)
        expect(response_body['books'][1]['author']).to eq(book2.author)
        expect(response_body['books'][1]['status']).to eq(book2.status)
        expect(response_body['books'][1]['checked_out_by']).to eq(book2.checked_out_by)
      end
    end
  end
end
