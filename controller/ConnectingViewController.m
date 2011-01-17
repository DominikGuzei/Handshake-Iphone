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

-(void) viewDidLoad {
	
}

-(void)setDeviceVersion {
	deviceVersion = nil;
}

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidAppear:(BOOL) animated {
	
	[super viewDidAppear:animated];
	
	[self scanConnectingInformation];
	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	NSLog(@"view released!");
}


- (void)scanConnectingInformation {
		
	if(!deviceVersion) {
		UIDeviceHardware *h=[[UIDeviceHardware alloc] init];
		NSString *s = [h platformString];
		deviceVersion = [NSString stringWithFormat:@"%@", s];
		iOsModel.text = deviceVersion;
	}
	
	if([deviceVersion isEqualToString:@"iPhone3,1"] || [deviceVersion isEqualToString:@"iPhone2,1"]) { // check for QR-Code readability (only iPhone 3gs / 4 Supported!)
		
	// ADD: present a barcode reader that scans from the camera feed
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
	
	ZBarImageScanner *scanner = reader.scanner;
	// TODO: (optional) additional reader configuration here
	
	// EXAMPLE: disable rarely used I2/5 to improve performance
	[scanner setSymbology: ZBAR_I25
				   config: ZBAR_CFG_ENABLE
					   to: 0];
	
	// present and release the controller
	[self presentModalViewController: reader
							animated: YES];
	[reader release];
		
	}
	
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results =
	[info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
	
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissModalViewControllerAnimated: YES];

	NSString *connectInformation = [NSString stringWithFormat:@"%@" ,symbol.data];

	NSArray *connectArray;
	connectArray = [[connectInformation componentsSeparatedByString:@" - "] retain];

	gameId = [connectArray objectAtIndex:0];
	gameUrl = [connectArray objectAtIndex:1];

	urlTextField.text = gameUrl;
	idTextField.text = gameId;

	NSString *url = [NSString stringWithFormat:@"%@?id=%@", gameUrl, gameId];

	// CRAP
	//[finishDelegate connectingViewDidFinishWithUrl:[NSString stringWithFormat:@"%@", url]];

	ControllingViewController *webController = [[ControllingViewController alloc] initWithUrl: url];

	[webController setView:[webController view]];
	[self.view addSubview:webController.view];

	//[webController release];
	
	deviceVersion = @"iphone1,1";
	
}

- (void) showControllingViewWithUrl: (NSString *) url
{
	ControllingViewController *webController = [[ControllingViewController alloc] initWithUrl: url];
	[self presentModalViewController:webController animated:YES];
	[webController retain];
}

- (IBAction) playButtonClicked: (id) sender 
{
	NSString *url = [NSString stringWithFormat:@"%@?id=%@", urlTextField.text, idTextField.text];
	[self showControllingViewWithUrl:url];
}

- (void)dealloc {
    [super dealloc];
}

@end
