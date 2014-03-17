//
//  AppDelegate.m
//  MFDropboxExampleProject
//
//  Created by Michael Fellows on 3/17/14.
//  Copyright (c) 2014 Michael Fellows. All rights reserved.
//

#import "AppDelegate.h"
#import <Dropbox/Dropbox.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    DBAccountManager *accountManager = [[DBAccountManager alloc] initWithAppKey:@"API_KEY" secret:@"API_SECRET"];
    [DBAccountManager setSharedManager:accountManager];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    DBAccount *account = [[DBAccountManager sharedManager] handleOpenURL:url];
    if (account) {
        NSLog(@"App linked successfully!");
        return YES;
    }
    return NO;
}

@end
