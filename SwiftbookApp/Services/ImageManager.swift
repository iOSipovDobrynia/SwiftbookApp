//
//  ImageManager.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 03.01.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import Foundation

final class ImageManager {
    
    // MARK: - Public properties
    static let shared = ImageManager()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public methods
    func fetchImageData(from url: URL?) -> Data? {
        guard let url = url else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}
