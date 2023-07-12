//
//  LocalDataBaseHandler.swift
//  SOLIDPrinciples
//
//  Created by Harish on 2023-07-12.
//

import Foundation
class LocalDataBaseHandler: CommentsDelegate{
    func getComments(completion: @escaping (Result<[CommentModel], DataError>) -> Void) {
        //read from local json file
        guard let url = Bundle.main.url(forResource: "JsonData", withExtension: "json"),
                let data = try? Data(contentsOf: url),
              let model = try? JSONDecoder().decode([CommentModel].self, from:data) else{
            return completion(.failure(.DecodingError))
        }
        completion(.success(model))
    }
    
}
