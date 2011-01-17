//
//  HandshakeAppDelegate.h
//  Handshake
//
//  Created by Dominik Guzei on 14.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//

#import "ConnectingViewController.h"
#import "ControllingViewController.h"
#import "QrCodeReaderViewController.h"

@interface HandshakeAppDelegate : NSObject <UIApplicationDelegate, 
											QrCodeReaderDelegate, 
											ConnectingViewDelegate, 
											ControllingViewDelegate> {
    
	UIWindow *window;
	UIImageView *splashView;
    ConnectingViewController *connectingViewController;
	ControllingViewController *controllingViewController;
	QrCodeReaderViewController *qrCodeReaderViewController;
	
}

-(void) showStartupScreen;
-(void) startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;

-(void) startReadingQrCode;
-(void) QrCodeReaderDidScanResult: (NSString *) result;
-(void) QrCodeReaderDidCancle;

-(void) startControllingModeWithUrl: (NSString *) url;
-(void) showConnectingView;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

