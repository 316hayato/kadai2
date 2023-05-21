class BooksController < ApplicationController

  def create
    @book = Book.new(book_params) # book用のローカル変数を作成(定義)
    if @book.save # データベースへの保存を実行
      flash[:success] = "Book was successfully created."  # サクセスメッセージを定義
      redirect_to book_path(@book.id) # 保存後show画面へリダイレクト
    else
      @books = Book.all # @books用インスタンス変数を作成(定義)
      render :index # indexのViewを表示する
    end

  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book.id) # 保存後show画面へリダイレクト
    else
      render :edit # editのViewを表示する
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    flash[:success] = "Book was successfully destroyed."
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
