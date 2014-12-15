//
//  AppDelegate.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UIImageView* splashView;

- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	UIViewController *home = [[MainViewController alloc]init];
	UINavigationController* navControllerHome = [[UINavigationController alloc] initWithRootViewController:home];
	[self.window setRootViewController:navControllerHome];
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
    
    self.splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    self.splashView.image = [UIImage imageNamed:@"640x1136"];
    [self.window addSubview:self.splashView];
    [self.window bringSubviewToFront:self.splashView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.window cache:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];
    self.splashView.alpha = 0.0;
    self.splashView.frame = CGRectMake(-60, -60, 440, 600);
    [UIView commitAnimations];
    
	return YES;
}

- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    [self.splashView removeFromSuperview];
}

- (void)applicationWillResignActive:(UIApplication *)application {
	
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	
}

- (void)applicationWillTerminate:(UIApplication *)application {
	
}

@end
