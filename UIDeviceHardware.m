//
//  UIDeviceHardware.m
//  Handshake
//
//  Created by Manuel Gottstein on 15.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIDeviceHardware.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIDeviceHardware

- (NSString *) platform{
	size_t size;
	sysctlbyname("hw.machine", NULL, &size, NULL, 0);
	char *machine = malloc(size);
	sysctlbyname("hw.machine", machine, &size, NULL, 0);
	NSString *platform = [NSString stringWithUTF8String:machine];
	free(machine);
	return platform;
}

- (NSString *) platformString{
	NSString *platform = [self platform];
	//if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 1G";
	if ([platform isEqualToString:@"i386"])   return @"iPhone Simulator";
	return platform;
}

@end
