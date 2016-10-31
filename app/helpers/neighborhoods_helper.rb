module NeighborhoodsHelper
  def complaints_greater_than(num)
    hoods = @neighborhoods.all.find_all do |neighborhood|
      (neighborhood.complaints.count > num)
    end

    hoods.map{ |neighborhood| neighborhood.shape_area }
  end
end
