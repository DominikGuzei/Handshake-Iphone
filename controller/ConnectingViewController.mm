//
//  HandshakeViewController.m
//  Handshake
//
//  Created by Dominik Guzei on 14.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//

#import "ConnectingViewController.h"

@implementation ConnectingViewController

- (id) initWithDelegate: (id <ConnectingViewDelegate>) delegate
{
	self = [super initWithNibName:@"ConnectingView" bundle:nil];
	actionDelegate = delegate;
	return self;
}

- (IBAction) connectWithCameraButtonClicked: (id) sender
{
	[actionDelegate startReadingQrCode];
}

- (IBAction) playButtonClicked: (id) sender 
{
	[actionDelegate startControllingModeWithUrl: urlTextField.text];
}

- (void)dealloc {
    [super dealloc];
}

@end
