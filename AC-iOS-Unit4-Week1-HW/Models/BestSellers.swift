//
//  Books.swift
//  AC-iOS-Unit4-Week1-HW
//
//  Created by C4Q on 12/14/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

//https://api.nytimes.com/svc/books/v3/lists.json?api-key=a1537c9d3c784066a9406d61ebcb9de0&list=\()


struct BookDetails: Codable {
    let title: String
    let primary_isbn10: String
    let description: String
}
struct Books: Codable {
    let weeks_on_list: Int?
    let list_name: String
    let book_details: [BookDetails]
}
struct BestSellers: Codable {
    let results: [Books]
}

struct BestSellersAPI {
    private init() {}
    static let manager = BestSellersAPI()
    func getBestSellers(from urlRequest: URLRequest, completionHandler: @escaping ([Books]) -> Void, errorHandler: @escaping (Error) -> Void)  {
    guard let url = URL(string: urlStr) else { errorHandler(AppError.badURL); return }
    let urlRequest = URLRequest(url: url)
    let completion: (Data) -> Void = { (data: Data) in
    do {
    let onlineBestSellers = try JSONDecoder().decode(BestSellers.self, from: data) //if error getting data, check here
    completionHandler(onlineBestSellers.results)
    }
    catch {
    errorHandler(AppError.badData)
    }
    }
    NetworkHelper.manager.performDataTask(with: urlRequest, completionHandler: completion, errorHandler: errorHandler)
    }
    
    }

