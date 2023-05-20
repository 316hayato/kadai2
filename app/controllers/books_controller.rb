class BooksController < ApplicationController

  def create
    @book = Book.new(book_params) # @book用インスタンス変数を作成(定義)
    if @book.save # データベースへの保存を実行
      flash[:notice] = "successfully"  # サクセスメッセージを定義
      redirect_to book_path(@book.id) # show画面へリダイレクト
    else
      @books = Book.all # @books用インスタンス変数を作成(定義)
      render :index # indexのViewを表示する
    end
  end
# ここから要編集
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = @list.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/lists'  # 投稿一覧画面へリダイレクト
  end
# ここまで要編集
   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
