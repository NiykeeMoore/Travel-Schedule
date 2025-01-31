//
//  Webview.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let lightDarkCSS = ":root { color-scheme: light dark; }"
        let request = URLRequest(url: url)
        guard let base64 = lightDarkCSS.data(using: .utf8)?.base64EncodedString() else { return }
        webView.load(request)
        
        let script = """
            javascript:(function() {
                var parent = document.getElementsByTagName('head').item(0);
                var style = document.createElement('style');
                style.type = 'text/css';
                style.innerHTML = window.atob('\(base64)');
                parent.appendChild(style);
            })()
        """
        
        let cssScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        webView.configuration.userContentController.addUserScript(cssScript)
    }
}
