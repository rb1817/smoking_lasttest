class AdminPagesController < ApplicationController
    
    before_action :admin_pages
    
    def index
    end
    
    def show_nsmoking
        @nsmoke_places = Home.all
    end
    
    def show_user
        @users = User.all
    end
    
    def show_smoke_place
        @smoke_places = Product.all
    end
    
    def show_penalty_place
        @penalty_places = Product.all
    end
    
    def new_qna
        @notices = Notice.new 
    end
    
    def show_qna
        @qnas = Qna.all
    end
    
    def new_notice
        @notices = Notice.new    
    end
    
    def edit_notice
       @notices = Notice.all 
    end
    
    
    def show_notice
        @notices = Notice.all
    end
    
    def login
    end
    
    
    def admin_pages
       @admin_pages = true
    end
    
    private
    
end

    
