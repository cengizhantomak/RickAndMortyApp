//
//  SplashViewController.swift
//  RickAndMortyApp
//
//  Created by Cengizhan Tomak on 1.05.2023.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard

        if defaults.object(forKey: "isFirstLaunch") == nil {
            defaults.set(false, forKey: "isFirstLaunch")
            print("Welcome")
            self.label.text = "Welcome!"
        } else {
            print("Hello")
            self.label.text = "Hello!"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mainVC = mainStoryboard.instantiateViewController(withIdentifier: "UINavigationController")
            mainVC.modalPresentationStyle = .fullScreen
            self.present(mainVC, animated: true, completion: nil)
        }
    }
}
