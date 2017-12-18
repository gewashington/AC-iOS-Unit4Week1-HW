//
//  GoogleBooks.swift
//  AC-iOS-Unit4-Week1-HW
//
//  Created by C4Q on 12/15/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct GoogleBookInfo: Codable {
    let items: [GoogleBooks]
    let totalItems: Int
}

struct GoogleBooks: Codable {
    let volumeInfo: VolumeWrapper
    let id: String

}

struct VolumeWrapper: Codable {
    let title: String
    let authors: [String]
    let description: String
    let industryIdentifiers: [ISBNNumbers]
    let imageLinks: ImageWrapper
    
}

struct ISBNNumbers: Codable {
    let type: String
    let identifier: String
}

struct ImageWrapper: Codable {
    let smallThumbnail: String
    let thumbnail: String
}


struct GoogleBooksAPIClient {
    private init() {}
    static let manager = GoogleBooksAPIClient()
    func getCategories(from urlRequest: URLRequest, completionHandler: @escaping ([GoogleBooks]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else { errorHandler(AppError.badURL); return }
        let urlRequest = URLRequest(url: url)
        let completion: (Data) -> Void = { (data: Data) in
            do {
                let onlineGoogleBooks = try JSONDecoder().decode(GoogleBookInfo.self, from: data) //if error getting data, check here
                let onlineGoogleBook = onlineGoogleBooks.items
                completionHandler(onlineGoogleBook)
            }
            catch {
                errorHandler(AppError.badData)
            }
        }
        NetworkHelper.manager.performDataTask(with: urlRequest, completionHandler: completion, errorHandler: errorHandler)
    }
}
