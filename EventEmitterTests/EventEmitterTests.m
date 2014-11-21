//
//  Copyright 2012-2014 Christoph Jerolimov
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

- (void)testSimplestOnNotify {
	__block int i = 0;
	NSObject* emitter = [[NSObject alloc] init];
	[emitter on:@"key" notify:^() {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	XCTAssertEqual(i, 2, @"");
}

- (void)testSimplestOnceNotify {
	__block int i = 0;
	NSObject* emitter = [[NSObject alloc] init];
	[emitter once:@"key" notify:^() {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	XCTAssertEqual(i, 1, @"");
}

- (void)testSimplestOnCallback {
	__block int i = 0;
	NSObject* emitter = [[NSObject alloc] init];
	[emitter on:@"key" callback:^(id value) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	XCTAssertEqual(i, 2, @"");
}

- (void)testSimplestOnceCallback {
	__block int i = 0;
	NSObject* emitter = [[NSObject alloc] init];
	[emitter once:@"key" callback:^(id value) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	XCTAssertEqual(i, 1, @"");
}

- (void)testSimplestOnArray {
	__block int i = 0;
	NSObject* emitter = [[NSObject alloc] init];
	[emitter on:@"key" array:^(NSArray* data) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	XCTAssertEqual(i, 2, @"");
}

- (void)testSimplestOnceArray {
	__block int i = 0;
	NSObject* emitter = [[NSObject alloc] init];
	[emitter once:@"key" array:^(NSArray* data) {
		i++;
	}];
	[emitter emit:@"key"];
	[emitter emit:@"key"];
	XCTAssertEqual(i, 1, @"");
}

- (void)testSimplestOnNotifyWithRemoveBlock {
	__block int i = 0;
	id block = ^() {
		i++;
	};
	NSObject* emitter = [[NSObject alloc] init];
	[emitter on:@"key" notify:block];
	[emitter emit:@"key"];
	[emitter removeCallback:block];
	[emitter emit:@"key"];
	XCTAssertEqual(i, 1, @"");
}

- (void)testSimplestOnNotifyWithRemoveListener {
	__block int i = 0;
	id block = ^() {
		i++;
	};
	NSObject* emitter = [[NSObject alloc] init];
	[emitter on:@"key" notify:block];
	[emitter emit:@"key"];
	[emitter removeListener:@"key" callback:block];
	[emitter emit:@"key"];
	XCTAssertEqual(i, 1, @"");
}

- (void)testSimplestOnNotifyWithRemoveAllListenerForOneEvent {
	__block int i = 0;
	id block = ^() {
		i++;
	};
	NSObject* emitter = [[NSObject alloc] init];
	[emitter on:@"key" notify:block];
	[emitter emit:@"key"];
	[emitter removeAllListener:@"key"];
	[emitter emit:@"key"];
	XCTAssertEqual(i, 1, @"");
}

- (void)testSimplestOnNotifyWithRemoveAllListener {
	__block int i = 0;
	id block = ^() {
		i++;
	};
	NSObject* emitter = [[NSObject alloc] init];
	[emitter on:@"key" notify:block];
	[emitter emit:@"key"];
	[emitter removeAllListener];
	[emitter emit:@"key"];
	XCTAssertEqual(i, 1, @"");
}

- (void)testMemoryWithOnMethod {
	int loops = 1000000;
	
	__block int i = 0;
	NSObject* emitter;
	for (int j = 0; j < loops; j++) {
		emitter = [[NSObject alloc] init];
		[emitter on:@"key" callback:^(id value) {
			i++;
		}];
		[emitter emit:@"key"];
		[emitter emit:@"key"];
	}
	XCTAssertEqual(i, loops * 2, @"");
}

- (void)testMemoryWithOnceMethod {
	int loops = 1000000;
	
	__block int i = 0;
	NSObject* emitter;
	for (int j = 0; j < loops; j++) {
		emitter = [[NSObject alloc] init];
		[emitter once:@"key" callback:^(id value) {
			i++;
		}];
		[emitter emit:@"key"];
		[emitter emit:@"key"];
	}
	XCTAssertEqual(i, loops, @"");
}

- (void)testMemoryWithAnotherOnceMethod {
    int loops = 1000000;
    
    __block int i = 0;
    NSObject* emitter;
    for (int j = 0; j < loops; j++) {
        emitter = [[NSObject alloc] init];
        [emitter on:@"key" callback:^(id value) {
            i++;
        }];
        [emitter emit:@"anotherkey"];
        [emitter emit:@"key"];
    }
    XCTAssertEqual(i, loops, @"");
}

@end
