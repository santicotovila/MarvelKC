import Foundation

final class SeriesForHeroRepository:SeriesRepositoryProtocol {
    
    private var  network: NetworkMarvelProtocol
    
    init(network: NetworkMarvel = NetworkMarvel()) {
        self.network = network
    }
    
    func getSeriesForHero(filter: String) async -> [Series] {
        await network.getSeriesForHero()
    }
    
    
}

final class SeriesForHeroRepositoryMock:SeriesRepositoryProtocol {
    
    private var  network: NetworkMarvelProtocol
    
    init(network: NetworkMarvelProtocol = NetworkMarvelMock()) {
        self.network = network
    }
    
    func getSeriesForHero(filter: String) async -> [Series] {
        await network.getSeriesForHero()
    }
    
    
}


