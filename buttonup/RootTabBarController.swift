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

    override func viewDidLoad() {
        setViewControllers([
            composeViewController,
            subscribersViewController,
            draftsViewController,
            archivesViewController,
        ], animated: false)
        tabBar.tintColor = UIColor(named: "selectedTextFill")
        tabBar.barTintColor = UIColor(named: "background")
    }

    // MARK: View factories

    private func makeArchivesViewController() -> ArchivesViewController {
        let archivesViewController = ArchivesViewController()
        archivesViewController.tabBarItem = UITabBarItem(
            title: "Archive",
            image: UIImage(systemName: "archivebox"),
            selectedImage: UIImage(systemName: "archivebox.fill")?
                .withTintColor(UIColor(named: "unselectedTextFill") ?? UIColor())
        )
        return archivesViewController
    }

    private func makeComposeViewController() -> ComposeViewController {
        let composeViewController = ComposeViewController()
        composeViewController.tabBarItem = UITabBarItem(
            title: "Compose",
            image: UIImage(systemName: "pencil"),
            selectedImage: UIImage(systemName: "pencil.fill")?
                .withTintColor(UIColor(named: "unselectedTextFill") ?? UIColor())
        )
        return composeViewController
    }

    private func makeDraftsViewController() -> DraftsViewController {
        let draftsViewController = DraftsViewController()
        draftsViewController.tabBarItem = UITabBarItem(
            title: "Drafts",
            image: UIImage(systemName: "envelope.circle"),
            selectedImage: UIImage(systemName: "envelope.circle.fill")?
                .withTintColor(UIColor(named: "unselectedTextFill") ?? UIColor())
        )
        return draftsViewController
    }

    private func makeSubscribersViewController() -> SubscribersViewController {
        let subscribersViewController = SubscribersViewController()
        subscribersViewController.tabBarItem = UITabBarItem(
            title: "Subscribers",
            image: UIImage(systemName: "person.3"),
            selectedImage: UIImage(systemName: "person.3.fill")?
                .withTintColor(UIColor(named: "unselectedTextFill") ?? UIColor())
        )
        return subscribersViewController
    }
}
