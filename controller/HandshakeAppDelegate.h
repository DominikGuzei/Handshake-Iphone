//
//  HandshakeAppDelegate.h
//  Handshake
//
//  Created by Dominik Guzei on 14.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//

#import "ConnectingViewController.h"
#import "ControllingViewController.h"

@class ConnectingViewController;
@class ControllingViewController;

@interface HandshakeAppDelegate : NSObject <UIApplicationDelegate, ConnectingViewDelegate> {
    
	UIWindow *window;
	UIImageView *splashView;
    ConnectingViewController *connectingViewController;
	ControllingViewController *controllingViewController;
	
}

-(void) connectingViewDidFinishWithUrl: (NSString*) url;
- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ConnectingViewController *connectingViewController;
@property (nonatomic, retain) IBOutlet ControllingViewController *controllingViewController;

@end

