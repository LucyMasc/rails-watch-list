class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # @bookmark = Bookmark.new
    @bookmarks = @list.bookmarks
  end
end
