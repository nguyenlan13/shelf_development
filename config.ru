require_relative './config/env'




use Rack::MethodOverride
use SessionsController
use MemberController
use BookController
use PodcastController
use ArticleController

run ApplicationController