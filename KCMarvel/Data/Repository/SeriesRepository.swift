import Foundation

///Creation of this intermediate layer between Data and Domain to carry out a CLEAN architecture, created to obtain Marvel series.
///Network variable created as private so that it is inaccessible outside the same class
final class SeriesForHeroRepository:SeriesRepositoryProtocol {
    
    private var  network: NetworkMarvelProtocol
    
    init(network: NetworkMarvel = NetworkMarvel()) {
        self.network = network
    }
    
    func getSeriesForHero(id: Int) async -> [Series] {
        await network.getSeriesForHero(id: id)
    }
    
    
}

///This mockup was created both to work on the project locally and to test that the repository layer works correctly.
///Network variable created as private so that it is inaccessible outside the same class.
final class SeriesForHeroRepositoryMock:SeriesRepositoryProtocol {
    
    private var  network: NetworkMarvelProtocol
    
    init(network: NetworkMarvelProtocol = NetworkMarvelMock()) {
        self.network = network
    }
    
    func getSeriesForHero(id: Int) async -> [Series] {
        await network.getSeriesForHero(id: id)
    }
    
    
}


