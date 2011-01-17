//
//  HandshakeAppDelegate.m
//  Handshake
//
//  Created by Dominik Guzei on 14.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//

#import "HandshakeAppDelegate.h"
#import "ConnectingViewController.h"
#import "ControllingViewController.h"

@implementation HandshakeAppDelegate

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    // Add the view controller's view to the window and display.
	[window makeKeyAndVisible];
	
	[self showStartupScreen];
	
	qrCodeReaderViewController = [[QrCodeReaderViewController alloc] initWithDelegate: self];
	controllingViewController = [[ControllingViewController alloc] initWithDelegate:self];
	connectingViewController = [[ConnectingViewController alloc] initWithDelegate:self];
	
	[connectingViewController retain];
	[qrCodeReaderViewController retain];
	[controllingViewController retain];
	
    return YES;
}

-(void) showStartupScreen
{
	splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
	splashView.image = [UIImage imageNamed:@"Default.png"];
	[window addSubview:splashView];
	[window bringSubviewToFront:splashView];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];
	[UIView setAnimationDelegate:self]; 
	[UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];
	splashView.alpha = 0.0;
	splashView.frame = CGRectMake(-60, -60, 440, 600);
	[UIView commitAnimations];
}

-(void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	[splashView removeFromSuperview];
	[splashView release];
	
	[window addSubview:connectingViewController.view];
	[window addSubview:controllingViewController.view];
	[window addSubview:qrCodeReaderViewController.view];
	
	[self startReadingQrCode];
}

-(void) startReadingQrCode
{
	[window bringSubviewToFront:qrCodeReaderViewController.view];
	[qrCodeReaderViewController startReadingQrCode];
}

-(void) QrCodeReaderDidScanResult: (NSString *) result
{
	[window sendSubviewToBack: qrCodeReaderViewController.view];
	[self startControllingModeWithUrl: result];
}

-(void) QrCodeReaderDidCancle {
	[window sendSubviewToBack: qrCodeReaderViewController.view];
	[self showConnectingView];
}

-(void) startControllingModeWithUrl: (NSString *) url
{
	[window bringSubviewToFront:controllingViewController.view];
	[controllingViewController openWebsiteWithUrl:url];
}

-(void) showConnectingView
{
	[window bringSubviewToFront:connectingViewController.view];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

- (void)dealloc {
	[qrCodeReaderViewController release];
    [connectingViewController release];
	[controllingViewController release];
    [window release];
    [super dealloc];
}


@end
