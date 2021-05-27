class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new
    end
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
