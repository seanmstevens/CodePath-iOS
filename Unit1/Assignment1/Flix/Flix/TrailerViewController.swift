//
//  TrailerViewController.swift
//  Flix
//
//  Created by Sean Stevens on 3/4/22.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var trailerUrl: URL!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let request = URLRequest(url: trailerUrl!)
        webView.load(request)
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
