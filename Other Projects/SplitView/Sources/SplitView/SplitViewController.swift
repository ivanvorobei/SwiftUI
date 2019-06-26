import SwiftUI

public struct SplitViewController: UIViewControllerRepresentable {
    public var controllers: [UIViewController]
    @Binding public var preferredDisplayMode: UISplitViewController.DisplayMode

    public func makeUIViewController(context: UIViewControllerRepresentableContext<SplitViewController>) -> UISplitViewController {
        let splitViewController = UISplitViewController()
        splitViewController.preferredDisplayMode = preferredDisplayMode
        splitViewController.viewControllers = controllers
        return splitViewController
    }

    public func updateUIViewController(_ uiViewController: UISplitViewController, context: UIViewControllerRepresentableContext<SplitViewController>) {
        uiViewController.preferredDisplayMode = preferredDisplayMode
        uiViewController.viewControllers = controllers
    }
}
