//
//  AppDelegate.m
//  Demo3DTouch
//
//  Created by kk on 2018/9/13.
//  Copyright © 2018年 yuyangkk. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) UIApplicationShortcutItem *shortcutItemToProcess;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 如果launchOptions包含相应的启动选项键，则主屏幕快速操作负责启动应用程序。 应用完成初始化后，我们可以存储快速操作以进行处理。
    if (launchOptions[UIApplicationLaunchOptionsShortcutItemKey]) {
        UIApplicationShortcutItem *item = launchOptions[UIApplicationLaunchOptionsShortcutItemKey];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:item.localizedTitle message:[NSString stringWithFormat:@"传递过来的值是：%@",item.userInfo] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [application.keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    // 程序已经加载到内存中，点击3D Touch中的一个快速操作，会调用该代理方法，我们也可以存储快速操作，以便处理
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:shortcutItem.localizedTitle message:[NSString stringWithFormat:@"传递过来的值是：%@",shortcutItem.userInfo] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [application.keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    
}

@end
