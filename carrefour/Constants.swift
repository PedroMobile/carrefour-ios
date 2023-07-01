//
//  Constants.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import Foundation

struct Constants {
    
    enum Home: String {
        
        var localized: String { rawValue.localized(bundle: Resources.bundle) }
        
        case searchTextField = "home_search_text_field"
    }
    
    enum User: String {
        
        var localized: String { rawValue.localized(bundle: Resources.bundle) }
        
        case reposButton = "repos_button"
    }
    
    enum Repo: String {
        
        var localized: String { rawValue.localized(bundle: Resources.bundle) }
        
        case title = "repos_title"
    }
}
