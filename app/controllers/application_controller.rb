
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  # end

  get '/articles/new' do   			# CREATE
  	erb :new
  end

  post '/articles' do    			# CREATE
  	@article = Article.create(title: params[:title], content: params[:content])
  	erb :index
  end

  get '/articles' do 				# READ - iterate through @articles, render all. 
  	@articles = Article.all 		# WORKS
  	erb :index
  end


  get '/articles/:id' do   			# READ  ( # show action)    #WORKS
  	@article= Article.find(params[:id])

  	erb :show 
  end

  get '/articles/:id/edit' do 		#UPDATE - request form WORKS
  	@article =  Article.find(params[:id])
  	erb :edit
  	#redirect "/articles/#{article.id}"
  end


  patch '/articles/:id' do 			#UPDATE - action for the edit  WORKS 
  	@article =  Article.find(params[:id])
  	@article.update(params[:article])
  	redirect "/articles/#{@article.id}" #Takes us back to the READ    
  end


  delete('/articles/:id') do 			#DESTROY
    @article = Article.find(params[:id])
    @article.destroy
    redirect('/articles')
  end

end
