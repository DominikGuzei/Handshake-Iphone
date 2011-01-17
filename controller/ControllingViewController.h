//
//  WebViewController.h
//  Handshake
//
//  Created by Dominik Guzei on 14.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol ControllingViewDelegate

-(void) startReadingQrCode;
-(void) showConnectingView;

@end

@interface ControllingViewController : UIViewController  {
	
	id <ControllingViewDelegate> actionDelegate;
	NSURL *url;
	IBOutlet UIWebView *webView;
	IBOutlet UIToolbar *bottomBar;
	
}

-(id) initWithDelegate: (id <ControllingViewDelegate>) delegate;
-(IBAction) chooseOtherGame;
-(IBAction) showConnectingView;

@property (nonatomic, retain) UIWebView *webView;
@property (retain) NSURL *url;

-(void) openWebsiteWithUrl: (NSString*) urlString;

@end
