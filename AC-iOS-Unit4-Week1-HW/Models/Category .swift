//
//  Category .swift
//  AC-iOS-Unit4-Week1-HW
//
//  Created by C4Q on 12/14/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation



//{
//    "status": "OK",
//    "copyright": "Copyright (c) 2017 The New York Times Company.  All Rights Reserved.",
//    "num_results": 53,
//    "results": [{
//    "list_name": "Combined Print and E-Book Fiction",
//    "display_name": "Combined Print & E-Book Fiction",
//    "list_name_encoded": "combined-print-and-e-book-fiction",
//    "oldest_published_date": "2011-02-13",
//    "newest_published_date": "2017-12-17",
//    "updated": "WEEKLY"
//    }
//    ]
//}

//struct Categories: Codable {
//    let results: [Category]
//}
//
//struct Category: Codable {
//    let list_name: String
//}


struct Categories: Codable {
    let results: [Category]
}

struct Category: Codable {
    let list_name: String
    
}



let urlStr = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=a1537c9d3c784066a9406d61ebcb9de0"
struct CategoryAPIClient {
    private init() {}
    static let manager = CategoryAPIClient()
    func getCategories(from urlRequest: URLRequest, completionHandler: @escaping ([Category]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else { errorHandler(AppError.badURL); return }
        let urlRequest = URLRequest(url: url)
        let completion: (Data) -> Void = { (data: Data) in
            do {
                let onlineCategories = try JSONDecoder().decode(Categories.self, from: data) //if error getting data, check here
                let onlineCategory = onlineCategories.results
                completionHandler(onlineCategory)
            }
            catch {
                errorHandler(AppError.badData)
            }
        }
        NetworkHelper.manager.performDataTask(with: urlRequest, completionHandler: completion, errorHandler: errorHandler)
    }
}
