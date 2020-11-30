//
//  ViewController.swift
//  testTask
//
//  Created by Виктор Кобыхно on 11/30/20.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private let loaderView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3982084394, green: 0.698545754, blue: 0.9996132255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loaderText: UILabel = {
        let label = UILabel()
        label.text = "LOADING..."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        view.addSubview(loaderView)
        loaderView.addSubview(loaderText)
        setupLayout()
        
        // загрузка URL
        if let url = URL(string: "http://site.com") {
            webView.load(URLRequest(url: url))
        }
    }
    
    //Выставляем констрейты
    private func setupLayout() {
        
        webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        loaderView.topAnchor.constraint(equalTo: webView.topAnchor).isActive = true
        loaderView.bottomAnchor.constraint(equalTo: webView.bottomAnchor).isActive = true
        loaderView.leadingAnchor.constraint(equalTo: webView.leadingAnchor).isActive = true
        loaderView.trailingAnchor.constraint(equalTo: webView.trailingAnchor).isActive = true
        
        loaderText.centerYAnchor.constraint(equalTo: loaderView.centerYAnchor).isActive = true
        loaderText.centerXAnchor.constraint(equalTo: loaderView.centerXAnchor).isActive = true
        
    }
    
    //Отслеживаем загрузку страницы через Delegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loaderView.removeFromSuperview()
    }
}

