//
//  HandshakeViewController.m
//  Handshake
//
//  Created by Dominik Guzei on 14.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//

#import "ConnectingViewController.h"
#import "ControllingViewController.h"

@implementation ConnectingViewController

- (void)viewDidLoad
{
	firstTimeScanned = false;
}

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidAppear:(BOOL) animated {
	
	[super viewDidAppear:animated];
	if(!firstTimeScanned) [self scanConnectingInformation];
	
}

- (IBAction) connectWithCameraButtonClicked: (id) sender
{
	[self scanConnectingInformation];
}

- (IBAction) playButtonClicked: (id) sender 
{
	NSString *url = [NSString stringWithFormat:@"%@?id=%@", urlTextField.text, idTextField.text];
	[self showControllingViewWithUrl:url];
}

- (void) showControllingViewWithUrl: (NSString *) url
{
	ControllingViewController *webController = [[ControllingViewController alloc] initWithUrl: url];
	[self presentModalViewController:webController animated:YES];
	[webController retain];
	firstTimeScanned = false;
}

- (void)scanConnectingInformation {
	
	firstTimeScanned = true;
	
	ZXingWidgetController *widController = [[ZXingWidgetController alloc] initWithDelegate:self showCancel:YES OneDMode:NO];
	QRCodeReader* qrcodeReader = [[QRCodeReader alloc] init];
	NSSet *readers = [[NSSet alloc ] initWithObjects:qrcodeReader,nil];
	[qrcodeReader release];
	widController.readers = readers;
	[readers release];
	/*widController.soundToPlay =
	[NSURL fileURLWithPath:[mainBundle pathForResource:@"beep-beep" ofType:@"aiff"] isDirectory:NO];*/
	[self presentModalViewController:widController animated:YES];
	[widController release];
	
}

#pragma mark -
#pragma mark ZXingDelegateMethods

- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)result {
	[self dismissModalViewControllerAnimated:NO];
	[self showControllingViewWithUrl:result];
}

- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
    [super dealloc];
}

@end
