//
//  FoodStore.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 20.03.2021.
//

import Foundation
import SwiftHTMLParser

class FoodStore {
    static let shared = FoodStore()
    
    func fetchFoods(completion: @escaping (Result<Foods, FoodError>) -> ()) {
//        guard let url = URL(string: "\(baseAPIURL)/movie/\(endpoint.rawValue)") else {
//            completion(.failure(.invalidEndpoint))
//            return
//        }
        //self.loadURLAndDecode(url: url, completion: completion)
        
    }
}

func parseAndTraverseSimpleHTML() throws {
    // get string from file
    let fileURL = URL.init(fileURLWithPath: "/https://dodopizza.ru/moscow")
    let htmlString = try String(contentsOf: fileURL, encoding: .utf8)

    // parse the htmlString into a tree of node objects (DOM)
    let nodeTree = try HTMLParser.parse(htmlString)

    // create a node selector path to describe what nodes to match in the nodeTree
    let nodeSelectorPath: [NodeSelector] = [
        ElementSelector().withTagName("html"),
        ElementSelector().withTagName("body"),
        ElementSelector().withTagName("div").atPosition(0),
        ElementSelector().withTagName("p").withClassName("body-paragraph")
    ]

    // find the elements that match the nodeSelectorPath
    // notice we use the findElements() function which only matches elements
    let matchingElements = HTMLTraverser.findElements(in: nodeTree, matching: nodeSelectorPath)

    // matchingElements will contain the 3 matching <p> elements with the className 'body-paragraph'
    // will print: 3
    print(matchingElements.count)
}

enum FoodError: Error, CustomNSError {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
    
}


