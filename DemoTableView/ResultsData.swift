//
//  ResultsData.swift
//  DemoTableView
//
//  Created by user on 5/23/24.
//

import UIKit

//첫번째키(JSON)
struct Root: Codable {
    let results: [ResultsData]
}

struct ResultsData: Codable {
    let name: NameData
    let location: LocationData
    let cell: String
    let picture: PictureData
    //비동기 형태의 메서드
    func retrieveImage(completionHandler: @escaping (UIImage?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: picture.large)!)
        { data, _, error in
            guard let data = data, error == nil else {
                completionHandler(nil, error)
                return
            }
            completionHandler(UIImage(data: data), nil)
        }
        task.resume()
    }
}

struct NameData: Codable {
    let first: String
    let last: String
}

struct LocationData: Codable {
    let street: StreetData
}

struct StreetData: Codable {
    let name: String
}

struct PictureData: Codable {
    let large: String
}
