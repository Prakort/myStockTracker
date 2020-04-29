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
          flash[:alert] = "Please enter a valid to search"
          redirect_to portfolio_path
        end
      else
        flash[:alert] = "Please enter a symbol to search"
        redirect_to portfolio_path
      end
    end
end
