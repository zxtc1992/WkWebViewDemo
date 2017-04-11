//
//  JMWebViewController.h
//  Ueater_v0.1_20170405
//
//  Created by zx on 2017/4/7.
//  Copyright © 2017年 符琼林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMWebViewController : UIViewController

//调用 JS 方法的名称
@property (nonatomic, copy) NSString *JSMethodNameString;
//调用 JS 代码 执行一些 JS 需要实现的方法
@property (nonatomic, copy) NSString *JSSourceString;
//是否需要刷新
@property (nonatomic, assign) BOOL isNeedRefresh;
//网络 URL 还是本地 URL
@property (nonatomic, assign) BOOL isWebURL;
//调用网址
- (instancetype)initWebviewWithUrl:(NSString *)url;
@end
