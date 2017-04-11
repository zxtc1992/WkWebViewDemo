//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by zx on 2017/4/11.
//  Copyright © 2017年 zx. All rights reserved.
//

#import "ViewController.h"
#import "JMWebViewController.h"

@interface ViewController ()
@property (nonatomic, strong) JMWebViewController *webViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor redColor]];
    [self setupUI];
}

- (void)setupUI
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.center.x - 50, self.view.center.y - 25, 100, 50)];
    [btn setTitle:@"百度" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.center.x - 50, self.view.center.y + 100, 100, 50)];
    [btn1 setTitle:@"JS测试" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clickBtn1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
}
- (void)clickBtn
{
    self.webViewController = [[JMWebViewController alloc] initWebviewWithUrl:@"https://www.baidu.com"];
    self.webViewController.isNeedRefresh = YES;
    self.webViewController.isWebURL = YES;
    [self.navigationController pushViewController:self.webViewController animated:YES];
}

- (void)clickBtn1
{
    self.webViewController = [[JMWebViewController alloc] initWebviewWithUrl:[[NSBundle mainBundle] pathForResource:@"new_file" ofType:@"html"]];
    self.webViewController.isNeedRefresh = YES;
    self.webViewController.isWebURL = NO;
    self.webViewController.JSMethodNameString = @"ScanAction";
    [self.navigationController pushViewController:self.webViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
