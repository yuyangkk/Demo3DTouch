//
//  PopedViewController.m
//  Demo3DTouch
//
//  Created by kk on 2018/9/14.
//  Copyright © 2018年 yuyangkk. All rights reserved.
//

#import "PopedViewController.h"

@interface PopedViewController ()

@end

@implementation PopedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Pop View Controller";
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"bgImage"];
    [self.view addSubview:imageView];
    
    // 设置我们期望被预览事的界面大小
    self.preferredContentSize = CGSizeMake(0, 300);
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    
    UIPreviewAction *firstAction = [UIPreviewAction actionWithTitle:@"选项一" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"选中了第一个action");
    }];
    
    UIPreviewAction *secondAction = [UIPreviewAction actionWithTitle:@"选项二" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"选中了第二个action");
    }];
    
    UIPreviewAction *thirdAction = [UIPreviewAction actionWithTitle:@"选项三" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"选中了第三个action");
    }];
    
    // 你可以直接返回三个选项
    // 可以返回不同的分组，当你点击分组时，会再次弹出分组中的actions
    // 当然也可以同时返回
    UIPreviewActionGroup *group = [UIPreviewActionGroup actionGroupWithTitle:@"group" style:UIPreviewActionStyleDefault actions:@[firstAction,secondAction]];
    
    return @[group,thirdAction];
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
