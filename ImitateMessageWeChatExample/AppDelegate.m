//
//  AppDelegate.m
//  ImitateMessageWeChatExample
//
//  Created by fnst001 on 8/27/15.
//  Copyright (c) 2015 FUJISTU. All rights reserved.
//

#import "AppDelegate.h"
#import "FJSMessageRootViewController.h"
#import "FJSBaseNavigationController.h"
#import "FJSBaseTabBarController.h"
#import "FJSContactTableViewController.h"
#import "FJSDiscoverTableViewController.h"
#import "FJSProfileTableViewController.h"
#import "FJSFoundationMacro.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    FJSMessageRootViewController *messageRootViewController = [[FJSMessageRootViewController alloc] init];
    messageRootViewController.tabBarItem.image = [UIImage imageNamed:@"WeChat"];
    messageRootViewController.title = NSLocalizedStringFromTable(@"HUAJIEWeChat", @"MessageDisplayKitString", @"华捷微信");
    FJSBaseNavigationController *messageNavigationContrtoller = [[FJSBaseNavigationController alloc] initWithRootViewController:messageRootViewController];
    
    //contact
    FJSContactTableViewController *contactTableViewController = [[FJSContactTableViewController alloc] init];
    contactTableViewController.title = NSLocalizedStringFromTable(@"Contact", @"MessageDisplayKitString", @"联系人");
    contactTableViewController.tabBarItem.image = [UIImage imageNamed:@"Contact"];
    FJSBaseNavigationController *contactNavigationController = [[FJSBaseNavigationController alloc] initWithRootViewController:contactTableViewController];
    
    
    FJSDiscoverTableViewController *discoverTableViewController = [[FJSDiscoverTableViewController alloc] init];
    discoverTableViewController.title = NSLocalizedStringFromTable(@"News", @"MessageDisplayKitString", @"发现");
    discoverTableViewController.tabBarItem.image = [UIImage imageNamed:@"SNS"];
    FJSBaseNavigationController *discoverNavigationController = [[FJSBaseNavigationController alloc] initWithRootViewController:discoverTableViewController];
    
    
    FJSProfileTableViewController *profileTableViewController = [[FJSProfileTableViewController alloc] init];
    profileTableViewController.title = NSLocalizedStringFromTable(@"Profile", @"MessageDisplayKitString", @"");
    profileTableViewController.tabBarItem.image = [UIImage imageNamed:@"Profile"];
    FJSBaseNavigationController *profileNavigationController = [[FJSBaseNavigationController alloc] initWithRootViewController:profileTableViewController];
    
    FJSBaseTabBarController *rootTabBarController = [[FJSBaseTabBarController alloc] init];
    rootTabBarController.viewControllers = @[messageNavigationContrtoller,contactNavigationController,discoverNavigationController,profileNavigationController];
    
    //setup UI Image
    UIColor *color = [UIColor colorWithRed:0.176 green:0.576 blue:0.980 alpha:1.00];
    [rootTabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbarBkg"]];
    [rootTabBarController.tabBar setSelectedImageTintColor:color];

    if (CURRENT_SYS_VERSION >= 7.0) {
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.071 green:0.060 blue:0.086 alpha:1.000]];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    } else {
        [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0.071 green:0.060 blue:0.086 alpha:1.000]];
    }

    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                          NSFontAttributeName:[UIFont boldSystemFontOfSize:17]}];
    _window.rootViewController = rootTabBarController;
    [_window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
