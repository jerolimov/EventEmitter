//
//  EventEmitterListener.m
//  EventEmitter
//
//  Created by Christoph Jerolimov on 07.09.2012.
//  Copyright (c) 2012. All rights reserved.
//

#import "EventEmitterListener.h"

@implementation EventEmitterDefaultCallbackListener
@synthesize once;
@synthesize callback;
- (void) notify: (NSArray*) data {
	if (data.count == 0) {
		((EventEmitterDefaultCallback) callback)(nil);
	} else if (data.count == 1) {
		((EventEmitterDefaultCallback) callback)(data[0]);
	} else {
		NSLog(@"Could not call block callback with array length > 1");
	}
	/*
	if (data.count == 0) {
		NSLog(@"call callback %@ with zero arguments", callback);
	} else if (data.count == 1) {
		NSLog(@"call callback %@ with one argument", callback);
		((void (^)()) callback)(data[0], data[0]);
	} else if (data.count == 2) {
		NSLog(@"call callback %@ with two arguments", callback);
	} else if (data.count == 3) {
		NSLog(@"call callback %@ with three arguments", callback);
	} else {
		NSLog(@"does NOT call callback %@ with %li arguments", callback, data.count);
	}
	*/
}
- (void) notifyWithDict: (NSDictionary*) dict{}
@end

@implementation EventEmitterArrayCallbackListener
@synthesize once;
@synthesize callback;
- (void) notify: (NSArray*) data {
	((EventEmitterArrayCallback) callback)(data);
}
@end
