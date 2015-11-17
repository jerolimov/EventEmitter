# Objective C EventEmitter

> Node.js inspired EventEmitter for Objective C.

## Use it

Copy the EventEmitter class into your project or add this line to your Podfile

```ruby
pod 'EventEmitter', '~> 0.1.1'
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
