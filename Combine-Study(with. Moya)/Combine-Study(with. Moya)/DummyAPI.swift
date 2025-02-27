//
//  DummyAPI.swift
//  Combine-Study(with. Moya)
//
//  Created by 안정흠 on 2/26/25.
//

import Foundation
import Moya
// https://korean-advice-open-api.vercel.app/api/advice
enum DummyAPI {
    case getMessage
}

extension DummyAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://korean-advice-open-api.vercel.app/api")!
    }
    
    var path: String {
        switch self {
        case .getMessage: return "/advice"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMessage: return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMessage: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default :
            return ["Content-Type": "application/json"]
        }
    }
}
