//
//  MainViewController.m
//  Demo3DTouch
//
//  Created by kk on 2018/9/13.
//  Copyright © 2018年 yuyangkk. All rights reserved.
//

#import "MainViewController.h"
#import "PopedViewController.h"

// 遵循协议
@interface MainViewController ()<UIViewControllerPreviewingDelegate>
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Add Home Screen Quick Action Demo code
    UIApplicationShortcutItem *shareItem = [[UIApplicationShortcutItem alloc] initWithType:@"com.yuyangkk.share" localizedTitle:@"分享" localizedSubtitle:@"分享副标题" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare] userInfo:@{@"Name":@"Hello world"}];
    [UIApplication sharedApplication].shortcutItems = @[shareItem];
    
    
    // Peek & Pop Demo code
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(150, 200, 150, 40)];
    // 开启用户交互
    label.userInteractionEnabled = YES;
    label.text = @"Peek & Pop";
    label.textColor = [UIColor blueColor];
    [self.view addSubview:label];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // 注册代理，并传入响应3D Touch的视图
    [self registerForPreviewingWithDelegate:self sourceView:label];
}

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
    PopedViewController *popVC = [[PopedViewController alloc] init];
    
    // 启用其他UI元素的模糊，区域内不被虚化，并在预览时放大动画。
    // 在每次调用之前，此rect将设置为sourceView的边界previewingContext：viewControllerForLocation:
    // 如果不设置，将使用系统提供的合适区域。
    previewingContext.sourceRect = CGRectMake(150, 200, 150, 40);
    // 如果返回的是nil，则不会执行预览(Peek)操作
    return popVC;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    // 将配置好的控制器推入导航栈
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
