//
//  TabBarViewController.swift
//  Flix
//
//  Created by Sean Stevens on 3/4/22.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        switch tabBarController.selectedIndex {
        case 1:
            self.tabBar.barStyle = UIBarStyle.black
        default:
            self.tabBar.barStyle = UIBarStyle.default
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
