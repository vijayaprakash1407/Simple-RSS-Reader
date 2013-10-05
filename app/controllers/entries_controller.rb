class EntriesController < ApplicationController
  def index
    @entries=Entry.order("published_date DESC").paginate(:page=>(params[:page] || 1 ),:per_page=>(params[:per_page]|| 50))
  end
  
  def show_new_entry
    Entry.get_news_feeds
    redirect_to :action=>"index"
  end
end
