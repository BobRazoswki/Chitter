class Reply

	include DataMapper::Resource
	
	belongs_to :peep
	belongs_to :user

	property :id,		Serial
	property :message, 	Text, :required => true, :message => 'Your reply is empty'
	property :timestamp, Time
	
end


