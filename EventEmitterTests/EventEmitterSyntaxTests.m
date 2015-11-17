//
//  Copyright 2012-2015 Christoph Jerolimov
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

#import "EventEmitterSyntaxTests.h"
#import "EventEmitter.h"

@implementation EventEmitterSyntaxTests

- (void)testOnSyntax {
	NSObject* emitter = [[NSObject alloc] init];
	
	[emitter on:@"event" notify:^() {
		NSLog(@"callback function without argument");
	}];
	
	[emitter on:@"event" callback:^(NSString* value) {
		NSLog(@"callback function with one argument: %@", value);
	}];
	
	// TODO callback function with two arguments
//	[emitter on:@"event" callback:^(NSString* value1, NSString* value2) {
//		NSLog(@"callback function with two arguments: %@ %@", value1, value2);
//	}];
	
	[emitter on:@"event" callback:^(NSError* error) {
		NSLog(@"callback function with one error argument: %@", error);
	}];
	
	[emitter on:@"event" array:^(NSArray* data) {
		NSLog(@"callback function contains data: %@", data);
	}];
	
	[emitter on:@"event" callback:^(NSDictionary* data) {
		NSLog(@"callback function contains data: %@", data);
	}];
	
	// TODO maybe -- add special callback function for errors?
//	[emitter onError:^(NSError* error) {
//		NSLog(@"callback received an error: %@", error);
//	}];
}

- (void)testEmitSyntax {
	NSObject* emitter = [[NSObject alloc] init];
	
	[emitter emit:@"event"];
	
	[emitter emit:@"event" data:@"value"];
	
	[emitter emit:@"event" arguments:@"value1", @"value2", @"value3", nil];
	
	[emitter emit:@"event" array:@[
		@"value1",
		@"value2",
		@"value3"
	]];
	
	[emitter emit:@"event" data:@{
		@"key1": @"value1",
		@"key2": @"value2",
		@"key3": @"value3",
	}];
}

@end
