//
//  EventEmitterSyntaxTests.m
//  EventEmitter
//
//  Created by Christoph Jerolimov on 07.09.2012.
//  Copyright (c) 2012. All rights reserved.
//

#import "EventEmitterSyntaxTests.h"
#import "EventEmitter.h"

@implementation EventEmitterSyntaxTests

- (void)testOnSyntax {
	EventEmitter* emitter = [[EventEmitter alloc] init];
	
	// TODO allow callback function without argument
//	[emitter on:@"event" callback:^() {
//		NSLog(@"callback function without argument");
//	}];
	
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
	EventEmitter* emitter = [[EventEmitter alloc] init];
	
	[emitter emit:@"ping"];
	
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
