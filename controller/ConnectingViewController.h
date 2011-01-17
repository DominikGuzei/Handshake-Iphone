//
//  HandshakeViewController.h
//  Handshake
//
//  Created by Dominik Guzei on 14.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ControllingViewController.h"
#import "UIDeviceHardware.h"

@protocol ConnectingViewDelegate

-(void) startReadingQrCode;
-(void) startControllingModeWithUrl: (NSString *) url;

@end

@interface ConnectingViewController : UIViewController {
	
	id <ConnectingViewDelegate> actionDelegate;
	IBOutlet UITextField *urlTextField;
	IBOutlet UITextField *idTextField;
	IBOutlet UIButton *playButton;
	IBOutlet UIButton *connectWithCameraButton;
	
}
- (id) initWithDelegate: (id <ConnectingViewDelegate>) delegate;
- (IBAction) playButtonClicked: (id) sender;
- (IBAction) connectWithCameraButtonClicked: (id) sender;

@end

