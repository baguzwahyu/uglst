class SearchSuggestion < ActiveRecord::Base
  def self.terms_for(prefix)
    suggestions = where('term like ?', "#{prefix}_%")
    suggestions.order('popularity desc').limit(10).pluck(:term)
  end

  def self.index_user_groups
    UserGroup.find_each do |user_group|
      index_term(user_group.name)
      user_group.name.split.each { |t| index_term(t) }
      #index_term(user_group.topic)
    end
  end

  def self.index_term(term)
    where(term: term.downcase).first_or_initialize.tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
end

# == Schema Information
# Schema version: 20140515151603
#
# Table name: search_suggestions
#
#  id         :integer          not null, primary key
#  term       :string(255)
#  popularity :integer
#  created_at :datetime
#  updated_at :datetime
#
