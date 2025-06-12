import Foundation

protocol SeriesRepositoryProtocol {
    func getSeriesForHero(id:Int) async -> [Series]
}
