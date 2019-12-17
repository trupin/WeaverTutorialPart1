import Foundation
import UIKit

/// This file is generated by Weaver 1.0.0
/// DO NOT EDIT!

@objc final class MainDependencyContainer: NSObject {

    static var onFatalError: (String, StaticString, UInt) -> Never = { message, file, line in
        Swift.fatalError(message, file: file, line: line)
    }

    fileprivate static func fatalError(file: StaticString = #file, line: UInt = #line) -> Never {
        onFatalError("Invalid memory graph. This is never suppose to happen. Please file a ticket at https://github.com/scribd/Weaver", file, line)
    }

    private typealias ParametersCopier = (MainDependencyContainer) -> Void
    private typealias Builder<T> = (ParametersCopier?) -> T

    private func builder<T>(_ value: T) -> Builder<T> {
        return { [weak self] copyParameters in
            guard let self = self else {
                MainDependencyContainer.fatalError()
            }
            copyParameters?(self)
            return value
        }
    }

    private func weakBuilder<T>(_ value: T) -> Builder<T> where T: AnyObject {
        return { [weak self, weak value] copyParameters in
            guard let self = self, let value = value else {
                MainDependencyContainer.fatalError()
            }
            copyParameters?(self)
            return value
        }
    }

    private func lazyBuilder<T>(_ builder: @escaping Builder<T>) -> Builder<T> {
        var _value: T?
        return { copyParameters in
            if let value = _value {
                return value
            }
            let value = builder(copyParameters)
            _value = value
            return value
        }
    }

    private func weakLazyBuilder<T>(_ builder: @escaping Builder<T>) -> Builder<T> where T: AnyObject {
        weak var _value: T?
        return { copyParameters in
            if let value = _value {
                return value
            }
            let value = builder(copyParameters)
            _value = value
            return value
        }
    }

    private static func fatalBuilder<T>() -> Builder<T> {
        return { _ in
            MainDependencyContainer.fatalError()
        }
    }

    private var builders = Dictionary<String, Any>()
    private func getBuilder<T>(for name: String, type _: T.Type) -> Builder<T> {
        guard let builder = builders[name] as? Builder<T> else {
            return MainDependencyContainer.fatalBuilder()
        }
        return builder
    }

    var homeViewController: UIViewController {
        return getBuilder(for: "homeViewController", type: UIViewController.self)(nil)
    }

    var imageManager: ImageManager {
        return getBuilder(for: "imageManager", type: ImageManager.self)(nil)
    }

    var movie: Movie {
        return getBuilder(for: "movie", type: Movie.self)(nil)
    }

    func movieController(movie: Movie) -> UIViewController {
        let builder: Builder<UIViewController> = getBuilder(for: "movieController", type: UIViewController.self)
        return builder { (_self) in _self.builders["movie"] = _self.builder(movie) }
    }

    var movieManager: MovieManager {
        return getBuilder(for: "movieManager", type: MovieManager.self)(nil)
    }

    var reviewManager: ReviewManager {
        return getBuilder(for: "reviewManager", type: ReviewManager.self)(nil)
    }

    var urlSession: URLSession {
        return getBuilder(for: "urlSession", type: URLSession.self)(nil)
    }

    fileprivate override init() {
    }

    fileprivate func appDelegateDependencyResolver() -> AppDelegateDependencyResolver {
        let _self = MainDependencyContainer()
        _self.builders["homeViewController"] = lazyBuilder { [weak _self] (_: Optional<ParametersCopier>) -> UIViewController in
            guard let _self = _self else {
                MainDependencyContainer.fatalError()
            }
            let __self = _self.homeViewControllerDependencyResolver()
            return HomeViewController(injecting: __self)
        }
        _self.builders["urlSession"] = lazyBuilder { [weak _self] (_: Optional<ParametersCopier>) -> URLSession in
            guard let _self = _self else {
                MainDependencyContainer.fatalError()
            }
            return URLSession.make(_self as URLSessionInputDependencyResolver)
        }
        _ = _self.getBuilder(for: "homeViewController", type: UIViewController.self)(nil)
        _ = _self.getBuilder(for: "urlSession", type: URLSession.self)(nil)
        return _self
    }

    static func appDelegateDependencyResolver() -> AppDelegateDependencyResolver {
        let _self = MainDependencyContainer().appDelegateDependencyResolver()
        return _self
    }

    private func homeViewControllerDependencyResolver() -> HomeViewControllerDependencyResolver {
        let _self = MainDependencyContainer()
        _self.builders["urlSession"] = _self.builder(urlSession)
        _self.builders["movieManager"] = lazyBuilder { [weak _self] (_: Optional<ParametersCopier>) -> MovieManager in
            guard let _self = _self else {
                MainDependencyContainer.fatalError()
            }
            let __self = _self.movieManagerDependencyResolver()
            return MovieManager(injecting: __self)
        }
        _self.builders["movieController"] = { [weak _self] (copyParameters: Optional<ParametersCopier>) -> UIViewController in
            guard let _self = _self else {
                MainDependencyContainer.fatalError()
            }
            let __self = _self.movieViewControllerDependencyResolver()
            copyParameters?(__self as! MainDependencyContainer)
            return MovieViewController(injecting: __self)
        }
        _ = _self.getBuilder(for: "movieManager", type: MovieManager.self)(nil)
        return _self
    }

    private func imageManagerDependencyResolver() -> ImageManagerDependencyResolver {
        let _self = MainDependencyContainer()
        _self.builders["urlSession"] = _self.builder(urlSession)
        return _self
    }

    private func movieManagerDependencyResolver() -> MovieManagerDependencyResolver {
        let _self = MainDependencyContainer()
        _self.builders["urlSession"] = _self.builder(urlSession)
        return _self
    }

    private func movieViewControllerDependencyResolver() -> MovieViewControllerDependencyResolver {
        let _self = MainDependencyContainer()
        _self.builders["urlSession"] = _self.builder(urlSession)
        _self.builders["imageManager"] = lazyBuilder { [weak _self] (_: Optional<ParametersCopier>) -> ImageManager in
            guard let _self = _self else {
                MainDependencyContainer.fatalError()
            }
            let __self = _self.imageManagerDependencyResolver()
            return ImageManager(injecting: __self)
        }
        _self.builders["reviewManager"] = lazyBuilder { [weak _self] (_: Optional<ParametersCopier>) -> ReviewManager in
            guard let _self = _self else {
                MainDependencyContainer.fatalError()
            }
            let __self = _self.reviewManagerDependencyResolver()
            return ReviewManager(injecting: __self)
        }
        _ = _self.getBuilder(for: "imageManager", type: ImageManager.self)(nil)
        _ = _self.getBuilder(for: "reviewManager", type: ReviewManager.self)(nil)
        return _self
    }

    private func reviewManagerDependencyResolver() -> ReviewManagerDependencyResolver {
        let _self = MainDependencyContainer()
        _self.builders["urlSession"] = _self.builder(urlSession)
        return _self
    }
}


protocol HomeViewControllerResolver: AnyObject {
    var homeViewController: UIViewController { get }
}

protocol ImageManagerResolver: AnyObject {
    var imageManager: ImageManager { get }
}

protocol MovieResolver: AnyObject {
    var movie: Movie { get }
}

protocol MovieControllerResolver: AnyObject {
    func movieController(movie: Movie) -> UIViewController
}

protocol MovieManagerResolver: AnyObject {
    var movieManager: MovieManager { get }
}

@objc protocol ReviewManagerResolver: AnyObject {
    var reviewManager: ReviewManager { get }
}

protocol UrlSessionResolver: AnyObject {
    var urlSession: URLSession { get }
}

extension MainDependencyContainer: HomeViewControllerResolver, ImageManagerResolver, MovieResolver, MovieControllerResolver, MovieManagerResolver, ReviewManagerResolver, UrlSessionResolver {
}

extension MainDependencyContainer {
}

typealias AppDelegateDependencyResolver = HomeViewControllerResolver & UrlSessionResolver

typealias HomeViewControllerDependencyResolver = MovieManagerResolver & MovieControllerResolver

typealias ImageManagerDependencyResolver = UrlSessionResolver

typealias MovieManagerDependencyResolver = UrlSessionResolver

typealias MovieViewControllerDependencyResolver = MovieResolver & ImageManagerResolver & ReviewManagerResolver

typealias ReviewManagerDependencyResolver = UrlSessionResolver

typealias URLSessionInputDependencyResolver = HomeViewControllerResolver & UrlSessionResolver