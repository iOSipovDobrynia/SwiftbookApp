//
//  DataManger.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

final class DataManager {
    
    // MARK: - Public properties
    static let shared = DataManager()
    
    // MARK: - Private properties
    private let userDefaults = UserDefaults()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public methods
    func setFavoriteStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func getFavoriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
}
