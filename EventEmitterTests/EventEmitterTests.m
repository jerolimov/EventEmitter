//
//  EventEmitterTests.m
//  EventEmitterTests
//
//  Created by Christoph Jerolimov on 07.09.2012.
//  Copyright (c) 2012. All rights reserved.
//

#import "EventEmitterTests.h"
#import "EventEmitter.h"

@implementation EventEmitterTests

- (void)testSimplestOnCallback {
	__block int i = 0;
	EventEmitter* emitter = [[EventEmitter alloc] init];
	[emitter on:@"key" callback:^(id value) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	STAssertEquals(i, 2, @"");
}

- (void)testSimplestOnceCallback {
	__block int i = 0;
	EventEmitter* emitter = [[EventEmitter alloc] init];
	[emitter once:@"key" callback:^(id value) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	STAssertEquals(i, 1, @"");
}

- (void)testSimplestOnArray {
	__block int i = 0;
	EventEmitter* emitter = [[EventEmitter alloc] init];
	[emitter on:@"key" array:^(NSArray* data) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	STAssertEquals(i, 2, @"");
}

- (void)testSimplestOnceArray {
	__block int i = 0;
	EventEmitter* emitter = [[EventEmitter alloc] init];
	[emitter once:@"key" array:^(NSArray* data) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	STAssertEquals(i, 1, @"");
}

@end
