//
//  JMNavigationController.m
//  JMWebView
//
//  Created by zx on 2017/4/11.
//  Copyright © 2017年 zx. All rights reserved.
//

#import "JMNavigationController.h"
#import <objc/runtime.h>

@interface JMNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation JMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.获取系统的Pop手势
    UIScreenEdgePanGestureRecognizer *gesture = (UIScreenEdgePanGestureRecognizer *)self.interactivePopGestureRecognizer;
    
    // 2.获取target/action
    // 2.1.利用运行时机制查看所有的属性名称
    unsigned int count = 0;
    //获取UIGestureRecognizer里所有的成员属性
    Ivar *ivars = class_copyIvarList([UIGraphicsRenderer class], &count);
    
    for (int i = 0; i < count; i++)
    {
        // 获取成员属性
        Ivar ivar = ivars[i];
        // 获取成员属性的属性名
        NSString *name = @(ivar_getName(ivar));
        NSLog(@"%@", name);
        
    }
    
    // 2.2.取出target
    NSArray *targets = [gesture valueForKeyPath:@"_targets"];
    
    id gestureRecognizer = targets.firstObject;
    
    id target = [gestureRecognizer valueForKeyPath:@"_target"];
    
    self.interactivePopGestureRecognizer.enabled = NO;
    
    // 2.3.取出Action
    SEL action = @selector(handleNavigationTransition:);
    
    // 3.创建自己的Pan手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
    
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
