require_relative './config/env'




use Rack::MethodOverride
use SessionsController
use UserController
use BookController
use PodcastController
use ArticleController
use RatingController

run ApplicationController