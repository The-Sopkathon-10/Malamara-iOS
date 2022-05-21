//
//  ArchiveRouter.swift
//  Client-iOS
//
//  Created by 김수연 on 2022/05/22.
//

import Foundation
import Alamofire

/*
 AuthRouter : 여러 Endpoint들을 갖고 있는 enum
 BaseRouter를 채택해서 path, method, header, parameter를 각 라우터에 맞게 request를 만든다.
 */

enum ArchiveRouter {
    case getUserArchive(id: String)
}

extension ArchiveRouter: BaseRouter {

    var path: String {
        return "/user/:6288f9cbaa918a3a19832bc4/decision"
    }

    var method: HTTPMethod {
        return .get
    }

    var header: HeaderType {
        return .basic
    }

    var parameters: RequestParams {
        return .query("")
    }
}
