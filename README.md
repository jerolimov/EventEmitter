# Objective C EventEmitter

> Node.js inspired EventEmitter for Objective C.

[![Build Status](https://travis-ci.org/jerolimov/EventEmitter.svg)](https://travis-ci.org/jerolimov/EventEmitter)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/EventEmitter.svg)](https://img.shields.io/cocoapods/v/EventEmitter.svg)
[![Supported Platforms](https://img.shields.io/cocoapods/p/EventEmitter.svg?style=flat)](http://cocoadocs.org/docsets/EventEmitter)

## How to use it

Copy the EventEmitter class into your project or add this line to your [Podfile](http://cocoapods.org/):

```ruby
pod 'EventEmitter', '~> 0.1.3'
```

## Quick API overview

Register event listener on any object:

```objectivec
#import "EventEmitter.h"

NSObject* emitter = [[NSObject alloc] init];

__block BOOL ready = NO;

[emitter on:@"ready" notify:^() {
	NSLog(@"Yepp! The object is ready now!");
	ready = YES;
}];

[emitter on:@"event" callback:^(NSDictionary* data) {
	if (ready) {
		NSLog(@"Receive event with data: %@", data);
	}
}];
```

And later fire an event to the same object:

```objectivec
#import "EventEmitter.h"

NSObject* emitter = ...;

[emitter emit:@"ready"];

[emitter emit:@"event" data:@{
	@"type": @"somethinghappend",
	@"another key": @"another value",
}];
```

## Implementation details

* The "original" API: http://nodejs.org/docs/latest/api/events.html
* use ARC (could be also enabled per file if your project does not use ARC)
* pure objective c, works on OSX and iOS
* Add a category to NSObject. More here: http://developer.apple.com/library/mac/#documentation/cocoa/conceptual/objectivec/chapters/occategories.html
* Use objc_setAssociatedObject and objc_getAssociatedObject to assign event listener to any object. More here: http://oleb.net/blog/2011/05/faking-ivars-in-objc-categories-with-associative-references/
