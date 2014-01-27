class SearchSuggestionsController < ApplicationController


  def index
    render json: %w[foo bar]
  end



  private


  # Never trust parameters from the scary internet, only allow the white list through.
  def search_suggestions_params
    params.require(:SearchSuggestion).permit(:popularity,  :term )
  end



end
