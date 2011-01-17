//
//  QrCodeReaderViewController.m
//  Handshake
//
//  Created by Dominik Guzei on 17.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//

#import "QrCodeReaderViewController.h"

@implementation QrCodeReaderViewController

-(id) initWithDelegate:( id <QrCodeReaderDelegate>)delegate
{
	self = [super initWithNibName:@"QrCodeReaderView" bundle:nil];
	readerDelegate = delegate;
	return self;
}

-(void) startReadingQrCode
{
	ZXingWidgetController *widController = [[ZXingWidgetController alloc] initWithDelegate:self showCancel:YES OneDMode:NO];
	QRCodeReader* qrcodeReader = [[QRCodeReader alloc] init];
	NSSet *readers = [[NSSet alloc ] initWithObjects:qrcodeReader,nil];
	[qrcodeReader release];
	widController.readers = readers;
	[readers release];
	[self presentModalViewController:widController animated:YES];
	[widController release];
}

#pragma mark -
#pragma mark ZXingDelegateMethods

- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)result {
	[self dismissModalViewControllerAnimated:NO];
	[readerDelegate QrCodeReaderDidScanResult: result];
}

- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller {
	[self dismissModalViewControllerAnimated:YES];
	[readerDelegate QrCodeReaderDidCancle];
}

@end
