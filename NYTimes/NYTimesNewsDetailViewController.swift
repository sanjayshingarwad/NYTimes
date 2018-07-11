//
//  NYTimesNewsDetailViewController.swift
//  NYTimes
//
//  Created by Sanjay Shingarwad on 12/07/18.
//  Copyright © 2018 Sanjay Shingarwad. All rights reserved.
//

import UIKit
import WebKit

var myContext = 0

class NYTimesNewsDetailViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    var progressView: UIProgressView!
    var news: News?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
        view = self.webView
        
        // add progresbar to navigation bar
        self.progressView = UIProgressView(progressViewStyle: .default)
        self.progressView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        self.progressView.tintColor = #colorLiteral(red: 0.6576176882, green: 0.7789518833, blue: 0.2271372974, alpha: 1)
        navigationController?.navigationBar.addSubview(self.progressView)
        let navigationBarBounds = self.navigationController?.navigationBar.bounds
        self.progressView.frame = CGRect(x: 0, y: navigationBarBounds!.size.height - 2, width: navigationBarBounds!.size.width, height: 2)
    }
    
    // deinit
    deinit {
        // remove all observers
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        // remove progress bar from navigation bar
        progressView.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlString = news?.url, let webUrl = URL(string: urlString) {
            let myRequest = URLRequest(url: webUrl)
            self.webView.load(myRequest)
            webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: &myContext)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // observer
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let change = change else { return }
        if context != &myContext {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        
        if keyPath == "estimatedProgress" {
            if let progress = (change[NSKeyValueChangeKey.newKey] as AnyObject).floatValue {
                self.progressView.progress = progress
            }
            return
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.progressView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.progressView.isHidden = false
    }
    
}
