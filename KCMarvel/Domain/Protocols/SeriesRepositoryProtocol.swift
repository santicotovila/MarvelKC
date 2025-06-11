import Foundation

protocol SeriesRepositoryProtocol {
    func getSeriesForHero(filter:String) async -> [Series]
}
