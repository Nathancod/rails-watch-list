class BookmarksController < ApplicationController

  before_action :get_book_params, only: [:show]
  before_action :set_bookmark, only: :destroy

  def show
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def get_book_params
    @list = Bookmark.find(params[:id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end


