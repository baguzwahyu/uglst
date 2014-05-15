class SearchSuggestionsController < ApplicationController
  def index
    term = (params.permit(:term) || {})[:term]
    render json: SearchSuggestion.terms_for(term)
  end
end
