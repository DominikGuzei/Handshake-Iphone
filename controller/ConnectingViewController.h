//
//  HandshakeViewController.h
//  Handshake
//
//  Created by Dominik Guzei on 14.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ControllingViewController.h"
#import "ZXingWidgetController.h"
#import "QRCodeReader.h"
#import "UIDeviceHardware.h"

@protocol ConnectingViewDelegate
	-(void) connectingViewDidFinishWithUrl: (NSString*) url;
@end

@interface ConnectingViewController : UIViewController < ZXingDelegate > {
	
	id <ConnectingViewDelegate> finishDelegate;
	IBOutlet UITextField *urlTextField;
	IBOutlet UITextField *idTextField;
	IBOutlet UIButton *playButton;
	IBOutlet UIButton *connectWithCameraButton;
	
	BOOL firstTimeScanned;
	
}

- (void) scanConnectingInformation;
- (IBAction) playButtonClicked: (id) sender;
- (IBAction) connectWithCameraButtonClicked: (id) sender;
- (void) showControllingViewWithUrl: (NSString *) url;
@end

