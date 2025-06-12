import Foundation
///Protocol for Series
protocol SeriesRepositoryProtocol {
    func getSeriesForHero(id:Int) async -> [Series]
}
