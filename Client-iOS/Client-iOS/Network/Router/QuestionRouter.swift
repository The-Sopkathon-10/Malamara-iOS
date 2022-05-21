//
//  QuestionRouter.swift
//  Client-iOS
//
//  Created by 황찬미 on 2022/05/22.
//

import Foundation
import Alamofire

enum QuestionRouter {
    case signIn(email: String, pw: String)
    case signUp(email: String, name: String, pw: String)
    case questionResult(userId: String, question: String, decision: String, isLiked: Bool)
}

extension QuestionRouter: BaseRouter {

    var path: String {
        switch self {
        case .signIn:
            return URLConstants.signIn
        case .signUp:
            return URLConstants.signUp
        case .questionResult:
            return URLConstants.questionResult
        }
    }

    var method: HTTPMethod {
        switch self {
        case .signIn, .signUp, .questionResult:
            return .post
        }
    }

    var header: HeaderType {
        switch self {
        case .signIn, .signUp, .questionResult:
            return .basic
        }
    }

    var parameters: RequestParams {
        switch self {
        case .signUp(let email, let name, let pw):
            let body: [String:Any] = [
                "email": email,
                "name": name,
                "password":pw
            ]
            return .requestParameters(body)
        case .signIn(let email, let pw):
            let body: [String:Any] = [
                "email": email,
                "password": pw
            ]
            return .requestParameters(body)
            
        case .questionResult(let userId, let question, let decision, let isLiked):
            let body: [String:Any] = [
                "userId": userId,
                "question": question,
                "decision": decision,
                "isLiked": isLiked
            ]
            return .requestParameters(body)
        }
    }
}
