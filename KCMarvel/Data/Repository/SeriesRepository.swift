import Foundation

final class SeriesForHeroRepository:SeriesRepositoryProtocol {
    
    private var  network: NetworkMarvelProtocol
    
    init(network: NetworkMarvel = NetworkMarvel()) {
        self.network = network
    }
    
    func getSeriesForHero(id: Int) async -> [Series] {
        await network.getSeriesForHero(id: id)
    }
    
    
}

final class SeriesForHeroRepositoryMock:SeriesRepositoryProtocol {
    
    private var  network: NetworkMarvelProtocol
    
    init(network: NetworkMarvelProtocol = NetworkMarvelMock()) {
        self.network = network
    }
    
    func getSeriesForHero(id: Int) async -> [Series] {
        await network.getSeriesForHero(id: id)
    }
    
    
}


