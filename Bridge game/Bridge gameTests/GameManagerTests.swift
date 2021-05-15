//
//  GameManagerTests.swift
//  Bridge gameTests
//
//  Created by Giuseppe Diciolla on 15/05/21.
//

import XCTest
@testable import Bridge_game

class GameManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsBorderMethodFalseCase() {
        // In our game we have a 5x5 square where the border index are
        // first column [0, 5, 10, 15, 20] last column [4, 9, 14, 19, 24]
        // isBorder method turns false if the index is not a border square
        XCTAssertFalse(GameManager.isBorder(index: 1))
        XCTAssertFalse(GameManager.isBorder(index: 13))
        XCTAssertFalse(GameManager.isBorder(index: 21))
    }
    
    func testIsBorderMethodTrueCase(){
        // In our game we have a 5x5 square where the border index are
        // first column [0, 5, 10, 15, 20] last column [4, 9, 14, 19, 24]
        // isBorder method turns false if the index is not a border square
        XCTAssertTrue(GameManager.isBorder(index: 0))
        XCTAssertTrue(GameManager.isBorder(index: 15))
        XCTAssertTrue(GameManager.isBorder(index: 20))
        XCTAssertTrue(GameManager.isBorder(index: 4))
        XCTAssertTrue(GameManager.isBorder(index: 9))
        XCTAssertTrue(GameManager.isBorder(index: 24))
    }
    
    func testResetGame(){
        // The restGame method creates a new Game obj to init
        // the start game situation, the result is a new Game obj
        
        let initMatrix = [0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0]
        
        var game = Game()
        game.totalClicks = 3
        game.playedClicks = 7
        game.grid = [0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0,
                     0, 0, 1, 1, 1,
                     0, 0, 1, 0, 1,
                     0, 0, 1, 0, 1]
        game.cellVal = [0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0,
                        0, 0, 15, 5, 15,
                        0, 0, 10, 10,10,
                        0, 0, 5, 10, 5]
        
        game = GameManager.resetGame()
        
        XCTAssertEqual(game.totalClicks, 10)
        XCTAssertEqual(game.playedClicks, 0)
        XCTAssertEqual(game.grid, initMatrix)
        XCTAssertEqual(game.cellVal, initMatrix)
        
    }
    
    func testClick6TimesOnSameColumn(){
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        
        let initMatrix = [0, 0, 0, 1, 0,
                          0, 0, 0, 1, 0,
                          0, 0, 0, 1, 0,
                          0, 0, 0, 1, 0,
                          0, 0, 0, 1, 0]
        let initPoints = [0, 0, 0, 25, 0,
                          0, 0, 0, 20, 0,
                          0, 0, 0, 15, 0,
                          0, 0, 0, 10, 0,
                          0, 0, 0, 5, 0]
        
        var game = Game()
        
        GameManager.cellPressed(cell: 3, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 3, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 3, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 3, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 3, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 3, collView: collectionView, game: &game)
        
        XCTAssertEqual(game.totalClicks, 10)
        XCTAssertEqual(game.playedClicks, 5)
        XCTAssertEqual(game.grid, initMatrix)
        XCTAssertEqual(game.cellVal, initPoints)
    }
    
    func testClick6TimesOnSameRow(){
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        
        let initMatrix = [0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0,
                          0, 0, 0, 0, 1,
                          1, 1, 1, 1, 1]
        let initPoints = [0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0,
                          0, 0, 0, 0, 10,
                          5, 5, 5, 5, 5]
        
        var game = Game()
        
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 21, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 22, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 24, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 24, collView: collectionView, game: &game)
        
        XCTAssertEqual(game.totalClicks, 10)
        XCTAssertEqual(game.playedClicks, 6)
        XCTAssertEqual(game.grid, initMatrix)
        XCTAssertEqual(game.cellVal, initPoints)
    }
    
    func testClick10TimeCreate2Bridges(){
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        
        let initMatrix = [0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0,
                          0, 0, 1, 1, 1,
                          1, 1, 1, 0, 1,
                          1, 0, 1, 0, 1]
        let initPoints = [0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0,
                          0, 0, 15, 5, 15,
                         10, 5, 10, 10,10,
                          5, 10, 5, 10, 5]
        
        var game = Game()
        
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 22, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 22, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 21, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 22, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 24, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 24, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 24, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        
        XCTAssertEqual(game.totalClicks, 10)
        XCTAssertEqual(game.playedClicks, 10)
        XCTAssertEqual(game.grid, initMatrix)
        XCTAssertEqual(game.cellVal, initPoints)
    }
    
    func testClickInSquareUnderTheBridge(){
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        
        let initMatrix = [0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0,
                          0, 1, 0, 0, 0,
                          1, 1, 1, 0, 0,
                          1, 0, 1, 0, 0]
        let initPoints = [0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0,
                          0, 10, 0, 0, 0,
                         10, 5, 10, 0, 0,
                          5, 10, 5, 0, 0]
        
        var game = Game()
        
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 15, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 22, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 17, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 16, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 21, collView: collectionView, game: &game)
        
        XCTAssertEqual(game.totalClicks, 10)
        XCTAssertEqual(game.playedClicks, 6)
        XCTAssertEqual(game.grid, initMatrix)
        XCTAssertEqual(game.cellVal, initPoints)
    }
    
    func testGetResult2Rows(){
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        
        var game = Game()
        
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 21, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 21, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 22, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 22, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 24, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 24, collView: collectionView, game: &game)
        
        let vc = UIViewController()
        
        let result: Int = GameManager.getGameResult(game: game, viewC: vc)
        XCTAssertEqual(result, 75)
    }
    
    func testGetResult2Colums(){
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        
        var game = Game()
        
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        
        let vc = UIViewController()
        
        let result: Int = GameManager.getGameResult(game: game, viewC: vc)
        XCTAssertEqual(result, 150)
    }
    
    func testGetResultWith1Bridge(){
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        
        var game = Game()
        
        GameManager.cellPressed(cell: 21, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 21, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 21, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 21, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 22, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        
        let vc = UIViewController()
        
        let result: Int = GameManager.getGameResult(game: game, viewC: vc)
        XCTAssertEqual(result, 140)
    }
    
    func testGetResultWith2Bridges(){
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        
        var game = Game()
        
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 20, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 22, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 22, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 21, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 22, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 24, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 24, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 24, collView: collectionView, game: &game)
        GameManager.cellPressed(cell: 23, collView: collectionView, game: &game)
        
        let vc = UIViewController()
        
        let result: Int = GameManager.getGameResult(game: game, viewC: vc)
        XCTAssertEqual(result, 115)
    }
    
}
