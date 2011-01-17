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

-(id) initWithDelegate: (id <ControllingViewDelegate>) delegate
{
	self = [super initWithNibName:@"ControllingView" bundle:nil];
	actionDelegate = delegate;
	return self;
}

-(void) openWebsiteWithUrl: (NSString*) urlString
{
	url = [NSURL URLWithString:urlString];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[webView loadRequest:request];
}

-(IBAction) chooseOtherGame {
	[actionDelegate startReadingQrCode];
}

-(IBAction) showConnectingView {
	[actionDelegate showConnectingView];
}

- (void) dealloc
{
	[url dealloc];
	[webView dealloc];
	[super dealloc];
}


@end
