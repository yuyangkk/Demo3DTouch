//
//  MainViewController.m
//  Demo3DTouch
//
//  Created by kk on 2018/9/13.
//  Copyright © 2018年 yuyangkk. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIApplicationShortcutItem *shareItem = [[UIApplicationShortcutItem alloc] initWithType:@"com.yuyangkk.share" localizedTitle:@"分享" localizedSubtitle:@"分享副标题" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare] userInfo:@{@"Name":@"Hello world"}];
    [UIApplication sharedApplication].shortcutItems = @[shareItem];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
