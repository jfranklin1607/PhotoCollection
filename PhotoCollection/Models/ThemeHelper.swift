//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Uptiie on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreferenceKey"
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let chosenTheme = userDefaults.string(forKey: themePreferenceKey)
        return chosenTheme
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}
