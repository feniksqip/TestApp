//
//  AppDelegate.m
//  TestApp
//
//  Created by Admin on 28/01/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "AppDelegate.h"
// GA
#import "GAI.h"
// Parse
#import <Parse/Parse.h>
// MixPanel
#import "Mixpanel.h"

#import "Constants.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//r
//- (NSUInteger) application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
//{
//    if(self.shouldRotate)
//    {
//        self.shouldRotate = NO;
//        return UIInterfaceOrientationMaskLandscapeRight;
//        //        return UIInterfaceOrientationMaskLandscapeRight;
//    }
//    return UIInterfaceOrientationMaskPortrait;
//}
- (NSUInteger)supportedInterfaceOrientations
{
    
    //    if (IS_IPAD) {
    //        return UIInterfaceOrientationMaskLandscape;
    //    }
    
    // Do not return UIInterfaceOrientationPortrait
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    //	(iOS 6)
    //	Force to portrait
    return UIInterfaceOrientationPortrait;
}
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    //	(iOS 5)
    //	Only allow rotation to portrait
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}
- (BOOL)shouldAutorotate
{
    return NO; // was YES
}
//r
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    
    // Initialize tracker. Replace with your tracking ID.
    [[GAI sharedInstance] trackerWithTrackingId:GOOGLEA_APP_ID];
    
    
    // v3 Debug mode // It can delete, ...?
    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelVerbose];
    
    
    // Parse
    [Parse setApplicationId:PARSE_COM_APP_ID
                  clientKey:PARSE_COM_CLIENT_KEY];
    
    // Register for Push Notitications
    // For iOS 8 only.
    /*
    UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                    UIUserNotificationTypeBadge |
                                                    UIUserNotificationTypeSound);
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                             categories:nil];
    [application registerUserNotificationSettings:settings];
    [application registerForRemoteNotifications];
     */
    // Let the device know we want to receive push notifications For iOS 7
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];

    // Look... which types of push notifications are enabled through
  //  UIRemoteNotificationType enabledTypes = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    
    // Initialize Mixpanel
    [Mixpanel sharedInstanceWithToken:MIXPANEL_COM_TOKEN];
    
    return YES;
}

// Parse
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
    
    NSLog(@"My token is: %@", deviceToken);
}
- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

///
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
