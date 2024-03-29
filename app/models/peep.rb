class Peep

	include DataMapper::Resource
	
	belongs_to :user
	has n, :replies

	property :id,		Serial
	property :message, 	Text, :required => true, :message => 'Your message is empty'
	property :timestamp, Time
	
end
