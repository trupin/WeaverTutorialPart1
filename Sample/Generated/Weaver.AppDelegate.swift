/// This file is generated by Weaver 0.10.1
/// DO NOT EDIT!
import UIKit
// MARK: - AppDelegate
protocol AppDelegateDependencyResolver {
    var homeViewController: UIViewController { get }
    var urlSession: URLSession { get }
    func urlSessionCustomRef() -> URLSession
}
final class AppDelegateDependencyContainer: AppDelegateDependencyResolver {
    private var _homeViewController: UIViewController?
    var homeViewController: UIViewController {
        if let value = _homeViewController { return value }
        let dependencies = HomeViewControllerDependencyContainer(injecting: self)
        let value = HomeViewController(injecting: dependencies)
        _homeViewController = value
        return value
    }
    private var _urlSession: URLSession?
    var urlSession: URLSession {
        if let value = _urlSession { return value }
        let value = urlSessionCustomRef()
        _urlSession = value
        return value
    }
    init() {
        _ = homeViewController
        _ = urlSession
    }
}
extension AppDelegateDependencyContainer: HomeViewControllerInputDependencyResolver {}