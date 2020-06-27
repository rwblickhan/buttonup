//
//  RootTabBarController.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/18/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

final class RootTabBarController: UITabBarController {
    private lazy var archivesViewController = makeArchivesViewController()
    private lazy var composeViewController = makeComposeViewController()
    private lazy var draftsViewController = makeDraftsViewController()
    private lazy var subscribersViewController = makeSubscribersViewController()
    private lazy var settingsViewController = makeSettingsViewController()

    override func viewDidLoad() {
        setViewControllers([
            UINavigationController(rootViewController: composeViewController),
            UINavigationController(rootViewController: draftsViewController),
            UINavigationController(rootViewController: subscribersViewController),
            UINavigationController(rootViewController: archivesViewController),
            UINavigationController(rootViewController: settingsViewController)
        ], animated: false)
        tabBar.tintColor = .selectedTextFill
        tabBar.barTintColor = .background
    }

    // MARK: View factories

    private func makeArchivesViewController() -> ArchivesViewController {
        let archivesViewController = ArchivesViewController()
        archivesViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Archive", comment: "Title of the archive tab"),
            image: UIImage(systemName: "archivebox"),
            selectedImage: UIImage(systemName: "archivebox.fill")?
                .withTintColor(.unselectedTextFill ?? UIColor())
        )
        return archivesViewController
    }

    private func makeComposeViewController() -> ComposeViewController {
        let composeViewController = ComposeViewController()
        composeViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Compose", comment: "Title of the compose tab"),
            image: UIImage(systemName: "pencil"),
            selectedImage: UIImage(systemName: "pencil.fill")?
                .withTintColor(.unselectedTextFill ?? UIColor())
        )
        return composeViewController
    }

    private func makeDraftsViewController() -> DraftsViewController {
        let draftsViewController = DraftsViewController()
        draftsViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Drafts", comment: "Title of the drafts tab"),
            image: UIImage(systemName: "envelope.circle"),
            selectedImage: UIImage(systemName: "envelope.circle.fill")?
                .withTintColor(.unselectedTextFill ?? UIColor())
        )
        return draftsViewController
    }

    private func makeSubscribersViewController() -> SubscribersViewController {
        let subscribersViewController = SubscribersViewController()
        subscribersViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Subscribers", comment: "Tite of the subscribers tab"),
            image: UIImage(systemName: "person.3"),
            selectedImage: UIImage(systemName: "person.3.fill")?
                .withTintColor(.unselectedTextFill ?? UIColor())
        )
        return subscribersViewController
    }
    
    private func makeSettingsViewController() -> SettingsViewController {
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Settings", comment: "Title of the settings tab"),
            image: UIImage(systemName: "gear"),
            selectedImage: UIImage(systemName: "gear")?
                .withTintColor(.unselectedTextFill ?? UIColor()))
        return settingsViewController
    }
}
