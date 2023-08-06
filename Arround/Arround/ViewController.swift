//
//  ViewController.swift
//  Arround
//
//  Created by young june Park on 2023/08/06.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    let webMessageManager = WebMessageManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        webMessageManager.webView.frame = view.frame
        view = webMessageManager.webView
    }
}
