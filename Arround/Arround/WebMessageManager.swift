//
//  WebMessageManager.swift
//  Arround
//
//  Created by young june Park on 2023/08/06.
//

import Foundation
import WebKit

enum WebMessage: String, CaseIterable {
    case aMessage
    case bMessage
    case cMessage

    var name: String {
        return rawValue
    }
}

enum WebFunction: String {
    case aFunction
    case bFunction
    case cFunction
}

// struct WebMessage: WKScriptMessage {
//    let name: String
//    let
// }

final class WebMessageManager: NSObject {
    var webView: WKWebView {
        let userContentController = WKUserContentController()
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        WebMessage.allCases.forEach { webMessage in
            configuration.userContentController.add(self, name: webMessage.name) // 인터페이스 등록
        }
        let tempWebView = WKWebView(frame: .zero, configuration: configuration)
        return tempWebView
    }

    func sendMessage(function: WebFunction) {
//        let dict = [
//            "token": token,
//        ]
//        let jsonData = try! JSONSerialization.data(withJSONObject: dict, options: [])
//        let jsonString = String(data: jsonData, encoding: .utf8)!
//        webView.evaluateJavaScript("JS함수이름(\(jsonString)")
    }

    func receiveMessage(message: WKScriptMessage) {
        // repository

        // handle

        let name = message.name
        guard let body = message.body as? [String: Any] else {
            return
        }
        guard let command = body["command"] as? String else {
            return
        }

        if name == "YourInterfaceName" {
            if command == "popOpened" {
                print("call back")
            }
        }
    }
}

extension WebMessageManager: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        receiveMessage(message: message)
    }
}
