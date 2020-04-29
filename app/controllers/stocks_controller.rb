class StocksController < ApplicationController

    def search

      if params[:stock].present?
        @stock = Stock.new_lookup(params[:stock])
        if @stock
          #respond to the ajax of remote: true in the form
          respond_to do |format|
            format.js { render partial: 'users/result' }
          end
          #render profile.html.erb in views
          #render 'users/profile'
        else 
          respond_to do |format|
            flash.now[:alert] = "Please enter a valid to search"
            format.js { render partial: 'users/result' }
          end
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a symbol to search"
          format.js { render partial: 'users/result' }
        end
      end
    end
end
