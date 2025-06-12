import SwiftUI
import XCTest
import Foundation
@testable import KCMarvel

final class NetworkTests: XCTestCase {
    
    func testGetCharacters() async {
        let network = NetworkMarvelMock()
        let result = await network.getCharacters()
        XCTAssertEqual(result.count,2)
        XCTAssertEqual(result[0].id, 1)
        XCTAssertEqual(result[1].id, 2)
        XCTAssert(result[0].name.contains("Spider"))
        XCTAssert(result[1].name.contains("ironMan"))
        
    }
    
    func testGetSeries() async {
        let hero = Hero(id: 1, name: "hulk", description: "hulkdescription", thumbnail: Thumbnail(path: "path", extension: "jpg"), resourceURI: "resource")
        let network = NetworkMarvelMock()
        let result = await network.getSeriesForHero(id: hero.id)
        XCTAssertEqual(result.count,2)
        XCTAssertEqual(result[0].id, 1)
        XCTAssertEqual(result[1].id, 2)
        XCTAssert(result[0].title.contains("titleHero"))
        XCTAssert(result[1].title.contains("titleHero2"))
      
    }
    
    func testEndPoints() async {
        let id: Int = 1
        XCTAssertEqual(EndPoints.characters,"/v1/public/characters")
        XCTAssertEqual(EndPoints.seriesForHero(id: 1),"/v1/public/characters/\(id)/series")
    }
    
    func testHTTPmethods() async {
        XCTAssertEqual(HttpMethods.GET.rawValue,"GET")
    }
    
    func testHTTPRespondeCodes() async {
        XCTAssertEqual(HTTPResponseCodes.SUCESS.rawValue,200)
        XCTAssertEqual(HTTPResponseCodes.FORBIDDEN.rawValue, 403)
        XCTAssertEqual(HTTPResponseCodes.METHOD_NOT_ALLOWED.rawValue, 405)
        XCTAssertEqual(HTTPResponseCodes.MISSING_API_KEY.rawValue, 409)
        XCTAssertEqual(HTTPResponseCodes.NOTAUTHERIZED.rawValue, 401)
        XCTAssertEqual(HTTPResponseCodes.SUCCESS_CREATED.rawValue,201)
    }
    
}


final class DomainTests: XCTestCase {
    
    func testEntities() async {
        
        let hero = Hero(id: 1, name: "hulk", description: "green", thumbnail: Thumbnail(path: "path", extension: "jpg"), resourceURI: "resourceURI")
        
        XCTAssertEqual(hero.id, 1)
        XCTAssertEqual(hero.name, "hulk")
        XCTAssertEqual(hero.description, "green")
        XCTAssertEqual(hero.thumbnail.path, "path")
        XCTAssertEqual(hero.thumbnail.extension, "jpg")
        XCTAssertEqual(hero.resourceURI, "resourceURI")
        
    }
    
    func testSeries() async {
        let series = Series(id: 2, thumbnail: Thumbnail(path: "path2", extension: "jpg"), title: "spider", description: "spiderman")
        XCTAssertEqual(series.id, 2)
        XCTAssertEqual(series.thumbnail.path, "path2")
        XCTAssertEqual(series.thumbnail.extension, "jpg")
        XCTAssertEqual(series.title, "spider")
        XCTAssertEqual(series.description, "spiderman")
    }
    
    func testThumbnail() async {
        let thumbnail = Thumbnail(path: "path3", extension: "jpg")
        XCTAssertEqual(thumbnail.path, "path3")
        XCTAssertEqual(thumbnail.extension, "jpg")
        XCTAssertEqual(thumbnail.fullURL, "path3.jpg")
    }
    
}

final class RepositoryTests: XCTestCase {
    
    func testGetCharactersFromMock() async {
        let repo = CharactersRepositoryMock()
        let characters = await repo.getCharacters(filter: "")
        XCTAssertEqual(characters.count, 2)
    }
    
    func testGetSeriesForHeroFromMock() async {
        let repo = SeriesForHeroRepositoryMock()
        let series = await repo.getSeriesForHero(id:1)
        XCTAssertEqual(series.count, 2)
    }
    

    
}

final class ViewModelsTests: XCTestCase {
    
    func testViewModelLoadCharacters() async {
            let useCase = CharactersUseCaseMock()
            let viewModel = CharactersViewModel(useCaseCharacters: useCase)
            
            await viewModel.getCharacters()
            
            XCTAssertEqual(viewModel.heros.count, 2)
            XCTAssertEqual(viewModel.heros.first?.name,"Spider")
        }
    
    func testViewModelLoadSeries() async {
            let hero = Hero(id: 1, name: "Iron", description: "Strong", thumbnail: Thumbnail(path: "path", extension: "jpg"), resourceURI: "resourceURI")
            let useCase = SeriesForheroUseCaseMock()
            let viewModel = SeriesViewModel(useCase: useCase, hero: hero)
            
            await viewModel.getSeriesForHero(id: 1)
            
            XCTAssertEqual(viewModel.seriesHero.count, 2)
            XCTAssertEqual(viewModel.seriesHero.first?.id,1)
        }
}
