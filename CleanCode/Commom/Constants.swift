//
//  Constants.swift
//  CleanCode
//
//  Created by Jose Martins on 22/03/21.
//

import Foundation
import UIKit

class Constants: NSObject {
    struct API {
        static let BaseURL = "https://api.github.com"
        
        struct Endpoint {
            static let UserData = "/users/{userName}"
            static let Followers = "/users/{userName}/followers"
            static let Repos = "/users/{userName}/repos"
        }
    }
    
    struct Strings {
        static let Login = "Login"
    }
    
    struct ScreenTitles {
        static let Repos = "Repositórios"
        static let Followers = "Seguidores"
    }
    
    struct Message {
        static let GitHubUserRequired = "O campo usuário do GitHub é Obrigatório"
        static let GitHubLoadUserError = "Um erro ocorreu ou tentar encontrar seus dados no GitHub"
        static let FollowerLoadError = "Um erro ocorreu ou tentar emcontrar seus seguidores no GitHub"
        static let ReposLoadError = "Um erro ocorreu ou tentar emcontrar seus repositórios no GitHub"
    }
}
