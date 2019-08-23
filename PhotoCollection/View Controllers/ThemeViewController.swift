//
//  ThemeViewController.swift
//  PhotoCollection
//
//  Created by Uptiie on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController {

    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTheme()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func darkButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func lightButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToLight()
        dismiss(animated: true, completion: nil)
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else {return}
        
        if theme == "Dark" {
            view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        } else {
            view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
    }

}
