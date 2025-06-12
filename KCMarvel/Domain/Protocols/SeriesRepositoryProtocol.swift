import Foundation

protocol SeriesRepositoryProtocol {
    func getSeriesForHero(filter:Int) async -> [Series]
}
