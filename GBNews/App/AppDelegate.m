//
//  AppDelegate.m
//  GBNews
//
//  Created by Vitaly Prosvetov on 10.03.2021.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame: frame];
    
    ViewController *viewController = [ViewController new];
    UINavigationController *navigatorController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self.window setRootViewController:navigatorController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
