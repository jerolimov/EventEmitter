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

#import "EventEmitterTests.h"
#import "EventEmitter.h"

@implementation EventEmitterTests

- (void)testSimplestOnCallback {
	__block int i = 0;
	NSObject* emitter = [[NSObject alloc] init];
	[emitter on:@"key" callback:^(id value) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	STAssertEquals(i, 2, @"");
}

- (void)testSimplestOnceCallback {
	__block int i = 0;
	NSObject* emitter = [[NSObject alloc] init];
	[emitter once:@"key" callback:^(id value) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	STAssertEquals(i, 1, @"");
}

- (void)testSimplestOnArray {
	__block int i = 0;
	NSObject* emitter = [[NSObject alloc] init];
	[emitter on:@"key" array:^(NSArray* data) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	STAssertEquals(i, 2, @"");
}

- (void)testSimplestOnceArray {
	__block int i = 0;
	NSObject* emitter = [[NSObject alloc] init];
	[emitter once:@"key" array:^(NSArray* data) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	STAssertEquals(i, 1, @"");
}

@end
