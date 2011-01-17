//
//  HandshakeViewController.h
//  Handshake
//
//  Created by Dominik Guzei on 14.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "UIDeviceHardware.h"
#import "ControllingViewController.h"

@protocol ConnectingViewDelegate
	-(void) connectingViewDidFinishWithUrl: (NSString*) url;
@end

@interface ConnectingViewController : UIViewController < ZBarReaderDelegate, ControllerViewDelegate > {
	
	id <ConnectingViewDelegate> finishDelegate;
	IBOutlet UITextField *urlTextField;
	IBOutlet UITextField *idTextField;
	IBOutlet UIButton *playButton;
	
	IBOutlet UILabel *iOsModel;
	
	NSString *deviceVersion;
	NSString *gameId;
	NSString *gameUrl;
	
}

-(void)setDeviceVersion;

- (void) scanConnectingInformation;
- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info;
- (IBAction) playButtonClicked: (id) sender;
- (void) showControllingViewWithUrl: (NSString *) url;
@end

