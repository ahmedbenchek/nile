require 'rails_helper'


describe "Books Api", type: :request do
	describe 'GET /books' do
		before do
			FactoryBot.create(:book, title: "1984", author: "Orwell")
			FactoryBot.create(:book, title: "Atlas Shrugged", author: "Ayn Rand")
		end
		it 'returns all books' do
			get '/api/v1/books'
			expect(response).to have_http_status(:success)
			expect(JSON.parse(response.body).size).to eq(2)
		end
	end

	describe 'POST /books' do 
		it 'creates a book' do
			expect {
				post "/api/v1/books", params: { book: {title: "the Martian", author: "Andy Weir"} }
			}.to change { Book.count}.from(0).to(1)
			expect(response).to have_http_status(:created)

		end
	end

	describe 'DELETE /books/:id' do 
		let!(:book) { FactoryBot.create(:book, title: "1984", author: "Orwell") }
		it 'deletes a book' do
			expect {
				delete "/api/v1/books/#{book.id}"
			}.to change { Book.count }.from(1).to(0)
			
			expect(response).to have_http_status(:no_content)

		end
	end


end