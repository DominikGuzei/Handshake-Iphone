//
//  WebViewController.m
//  Handshake
//
//  Created by Dominik Guzei on 14.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//

#import "ControllingViewController.h"
#import "ConnectingViewController.h"


@implementation ControllingViewController

@synthesize webView;
@synthesize url;

-(id) initWithUrl: (NSString*) urlString
{
	NSLog(urlString);
	self = [super initWithNibName:@"ControllingView" bundle:nil];
	// Example 1, loading the content from a URLNSURL
	url = [NSURL URLWithString:urlString];
	return self;
}

-(void) setDeviceVersion {
	
}

-(IBAction) chooseOtherGame {
	ConnectingViewController *connectingViewController = [[ConnectingViewController alloc] init];
	[self presentModalViewController:connectingViewController animated:YES];
	[connectingViewController retain];
	[finishDelegate setDeviceVersion];
}

-(IBAction) showConnectingView {
	NSLog(@"bla");
}

-(void) viewDidLoad
{
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[webView loadRequest:request];
}

- (void) dealloc
{
	[url dealloc];
	[webView dealloc];
	[super dealloc];
}


@end
