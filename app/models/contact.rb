class Contact < ActiveRecord::Base
	validates :name, :presence => true
	validates :email, :presence => true
	validates :message, :presence => true

	scope :recent, -> (limit){order(:created_at => :desc).limit(limit)}
end
