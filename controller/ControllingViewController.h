//
//  WebViewController.h
//  Handshake
//
//  Created by Dominik Guzei on 14.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//
#import <UIKit/UIKit.h>


@protocol ControllerViewDelegate
-(void) setDeviceVersion;
@end


@interface ControllingViewController : UIViewController <ControllerViewDelegate> {
	
	id <ControllerViewDelegate> finishDelegate;
	NSURL *url;
	IBOutlet UIWebView *webView;
	IBOutlet UIToolbar *bottomBar;
	
}

-(IBAction) chooseOtherGame;
-(IBAction) showConnectingView;

@property (nonatomic, retain) UIWebView *webView;
@property (retain) NSURL *url;

-(id) initWithUrl: (NSString*) url;

@end
