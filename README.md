# WKWebView调用url跳转到其他AppDemo

demo通过WKWebView加载支付宝查违章的url跳转到支付宝中的查违章功能

## 流程

打开WKWebView

* —>如果安装支付宝—>打开支付宝并跳转到查违章页面
* —>如果没有安装支付宝—>点击页面‘下载支付宝‘按钮，跳转到App Store支付宝下载页面




## 使用

在Info.plist `LSApplicationQueriesSchemes`中添加`alipays`