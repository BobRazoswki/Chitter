require 'data_mapper'
require 'sinatra'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'

require_relative 'controllers/replies'
require_relative 'controllers/users'
require_relative 'controllers/peeps'
require_relative 'controllers/application'
require_relative 'controllers/sessions'
require_relative 'controllers/forgot_password'


class Chitter < Sinatra::Base

	include ApplicationHelper

	use Rack::MethodOverride
	register Sinatra::Partial
  register Sinatra::Flash

	set :sessions_secret, 'bob super secret'
	set :partial_template_engine, :erb
	set :views, Proc.new { File.join(root, "..", "views") }
	set :public_folder, Proc.new { File.join(root, "..", "public") }

	enable :sessions
	

  # start the server if ruby file executed directly
  run! if app_file == $0

end
