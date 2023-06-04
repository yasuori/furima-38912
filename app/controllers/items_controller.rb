class ItemsController < ApplicationController
  # ログインしていないuesrはトップページへ促す
  before_action :authenticate_user!, except: :index
  
  def index
  end
end
