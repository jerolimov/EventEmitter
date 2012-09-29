//
//  Copyright 2012 Christoph Jerolimov
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License
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
