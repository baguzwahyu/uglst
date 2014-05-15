namespace :search_suggestions do
  desc 'Generate search suggestions from user_groups'
  task index: :environment do
    SearchSuggestion.index_user_groups
  end
end
