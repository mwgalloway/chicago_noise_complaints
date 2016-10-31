module NeighborhoodsHelper
  def complaints_greater_than(num)
    hoods = Neighborhood.all.find_all do |neighborhood|
      neighborhood.complaints.count > 0
    end

    hoods.map{ |neighborhood| neighborhood.zip }
  end
end
