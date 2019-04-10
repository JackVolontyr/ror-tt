module RoutesHelper
  def trains_on(route)
    route.trains.any? ?
        route.trains.map(&:number).join(', ') : "------"
  end

  def stations_on(route)
    route.stations.any? ?
        route.stations.map(&:name).join(', ') : "------"
  end
end
