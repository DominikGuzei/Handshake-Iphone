//
//  QrCodeReaderViewController.h
//  Handshake
//
//  Created by Dominik Guzei on 17.01.11.
//  Copyright 2011 Fh Salzburg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXingWidgetController.h"
#import "QRCodeReader.h"

@protocol QrCodeReaderDelegate

-(void) QrCodeReaderDidScanResult: (NSString *) result;
-(void) QrCodeReaderDidCancle;

@end


@interface QrCodeReaderViewController : UIViewController < ZXingDelegate > {
	id <QrCodeReaderDelegate> readerDelegate;
}

- (id) initWithDelegate: (id <QrCodeReaderDelegate>) delegate;
- (void) startReadingQrCode;
- (void) zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)result;
- (void) zxingControllerDidCancel:(ZXingWidgetController*)controller;
 
@end
