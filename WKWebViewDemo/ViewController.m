//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by 吴恺 on 2017/8/3.
//  Copyright © 2017年 wukai. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
@interface ViewController () <WKNavigationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://ur.alipay.com/4rwQ"]]];
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    UIApplication *app = [UIApplication sharedApplication];
    NSURL         *url = navigationAction.request.URL;

    NSString *alipayUrl = @"alipays://";
    NSString *alipayAppStoreUrl = @"itms-apps://";
    
    if ([url.absoluteString hasPrefix:alipayUrl] || [url.absoluteString hasPrefix:alipayAppStoreUrl]) {
        
        if ([app canOpenURL:url]) {
            [app openURL:url options:@{UIApplicationOpenURLOptionUniversalLinksOnly: @NO} completionHandler:^(BOOL success) {
              
            }];
        }
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
        
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
