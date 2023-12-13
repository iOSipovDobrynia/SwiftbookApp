//
//  CourseDetailsConfigurator.swift
//  SwiftbookApp
//
//  Created by Goodwasp on 12.12.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseDetailsConfiguratorInputProtocol {
    func configure(with view: CourseDetailsViewController, and course: Course)
}

class CourseDetailsConfigurator: CourseDetailsConfiguratorInputProtocol {
    
    // MARK: - Methods
    func configure(with view: CourseDetailsViewController, and course: Course) {
        let presenter = CourseDetailsPresenter(view: view)
        view.presenter = presenter
        let interactor = CourseDetailsInteractor(presenter: presenter, course: course)
        presenter.interactor = interactor
    }
}
