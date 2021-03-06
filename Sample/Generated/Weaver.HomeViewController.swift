/// This file is generated by Weaver 0.12.0
/// DO NOT EDIT!
import Foundation
import UIKit
// MARK: - HomeViewController
protocol HomeViewControllerInputDependencyResolver {
    var urlSession: URLSessionProtocol { get }
}
protocol HomeViewControllerDependencyResolver {
    var movieManager: MovieManager { get }
    func movieController(movie: Movie) -> UIViewController
}
final class HomeViewControllerDependencyContainer: HomeViewControllerDependencyResolver {
    let urlSession: URLSessionProtocol
    private var _movieManager: MovieManager?
    var movieManager: MovieManager {
        if let value = _movieManager { return value }
        let dependencies = MovieManagerDependencyContainer(injecting: self)
        let value = MovieManager(injecting: dependencies)
        _movieManager = value
        return value
    }
    func movieController(movie: Movie) -> UIViewController {
        let dependencies = MovieViewControllerDependencyContainer(injecting: self, movie: movie)
        let value = MovieViewController(injecting: dependencies)
        return value
    }
    init(injecting dependencies: HomeViewControllerInputDependencyResolver) {
        urlSession = dependencies.urlSession
        _ = movieManager
    }
}
extension HomeViewControllerDependencyContainer: MovieManagerInputDependencyResolver {}
extension HomeViewControllerDependencyContainer: MovieViewControllerInputDependencyResolver {}