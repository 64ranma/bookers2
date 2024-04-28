class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have created book successfully."
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
      unless 
        @book.user.id == current_user.id
        redirect_to books_path
      end
    
  end

  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
    # 更新成功した場合の処理
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(@book)
      else
    # 更新失敗した場合の処理
        render 'edit'
      end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
