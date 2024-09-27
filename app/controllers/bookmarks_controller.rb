  class BookmarksController < ApplicationController
    # def index
    #   @bookmarks = Bookmark.all
    # end

    # def show
    #   @bookmark = Bookmark.find(params[:id])
    # end

    def new
      @list = List.find(params[:list_id])
      @bookmark = Bookmark.new
    end

    def create
      @list = List.find(params[:list_id])
      @bookmark = Bookmark.new(bookmark_params)
      if @bookmark.save
        redirect_to bookmark_path(@bookmark)
      else
        render :new
      end
    end

    def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
      redirect_to list_path(@bookmark.list)
    end

    private

    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end
  end
