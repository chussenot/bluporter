class Travel
  include Mongoid::Document
  include Mongoid::Search
  before_save :calculate_distance
  max_paginates_per 100

  field :from, type: Hash # {lat:'', lng:'', name:''}
  field :to, type: Hash
  field :departure_date, type: Date
  field :price, type: Float
  field :places, type: Integer, default: 3
  field :description, type: String
  field :distance, type: Float
  field :customers, type: Array

  search_in from: :name, to: :name

  def self.find_by_names(from, to)
    travels = full_text_search("#{from} #{to}", match: :all).to_a
    travels.select! { |v| v.from['name'].downcase.include?(from) && v.to['name'].downcase.include?(to) }
  end

  def book!(nickname)
    if opened?
      places = places - 1
      customers << nickname
    end
  end

  def opened?
    places > 1
  end

  def closed?
    places == 0
  end

  private
  def calculate_distance #in miles
    self.distance = Geocoder::Calculations.distance_between(
      [from[:lat].to_f,from[:lng].to_f],
      [to[:lat].to_f,to[:lng].to_f]
      ).floor if from && to
  end

end
