//
//  CourseListConfigurator.swift
//  SwiftbookApp
//
//  Created by Goodwasp on 12.12.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseListConfiguratorInputProtocol {
    func configure(with view: CourseListViewController)
}

final class CourseListConfigurator: CourseListConfiguratorInputProtocol {

    // MARK: - Methods
    func configure(with view: CourseListViewController) {
        let presenter = CourseListPresenter(view: view)
        view.presenter = presenter
        let interactor = CourseListInteractor(presenter: presenter)
        presenter.interactor = interactor
        let router = CourseListRouter(view: view)
        presenter.router = router
    }
}
