class Book < ApplicationRecord
	attr_accessor :title, :author
	validates :title, presence: true, length: { minimum:  3 }
	validates :author, presence: true, length: { minimum:  3 }


end
