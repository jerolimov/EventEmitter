//
//  EventEmitter.m
//  EventEmitter
//
//  Created by Christoph Jerolimov on 07.09.2012.
//  Copyright (c) 2012. All rights reserved.
//

#import "EventEmitter.h"

@interface EventEmitter()
@property NSMutableDictionary* eventListeners;
@end

@implementation EventEmitter

- (id)init {
	self = [super init];
	if (self) {
		self.eventListeners = [NSMutableDictionary dictionary];
	}
	return self;
}

@end

@implementation EventEmitter(EventEmitterListenerHandling)

- (void) on:(NSString*) event callback:(EventEmitterDefaultCallback) callback {
	[self addListener:[[EventEmitterDefaultCallbackListener alloc] init] callback:callback event:event once:NO];
}

- (void) on:(NSString*) event array:(EventEmitterArrayCallback) callback {
	[self addListener:[[EventEmitterArrayCallbackListener alloc] init] callback:callback event:event once:NO];
}

- (void) once:(NSString*) event callback:(EventEmitterDefaultCallback) callback {
	[self addListener:[[EventEmitterDefaultCallbackListener alloc] init] callback:callback event:event once:YES];
}

- (void) once:(NSString*) event array:(EventEmitterArrayCallback) callback {
	[self addListener:[[EventEmitterArrayCallbackListener alloc] init] callback:callback event:event once:YES];
}

/*
 Internal helper function.
 */
- (void) addListener:(NSObject<EventEmitterListener>*) listener callback:(id) callback event:(NSString*) event once:(BOOL) once {
	NSMutableArray* eventListener = [self.eventListeners objectForKey:event];
	if (eventListener == nil) {
		eventListener = [NSMutableArray array];
		[self.eventListeners setValue:eventListener forKey:event];
	}
	listener.once = once;
	listener.callback = callback;
	[eventListener addObject:listener];
}

@end

@implementation EventEmitter(EventEmitterDistributionHandling)

- (void) emit:(NSString*) event {
	[self emit:event array:[NSArray array]];
}

- (void) emit:(NSString*) event data: (id) arg0 {
	[self emit:event array:[NSArray arrayWithObject:arg0]];
}

- (void) emit:(NSString*) event arguments: (id) arg0, ... {
	NSMutableArray* array = [NSMutableArray array];
	
	id arg;
	va_list args;
	va_start(args, arg0);
	while ((arg = va_arg(args, id)) != nil) {
		[array addObject:arg];
	}
	va_end(args);
	
	[self emit:event array:array];
}

- (void) emit:(NSString*) event array: (NSArray*) array {
	for (NSObject<EventEmitterListener>* listener in [self eventListeners:event]) {
		[listener notify:array];
		if (listener.once) {
			[[self eventListeners:event] removeObject:listener];
		}
	}
}

- (NSMutableArray*) eventListeners:(NSString*) event {
	if (self.eventListeners == nil) {
		return nil;
	}
	return [self.eventListeners valueForKey:event];
}

@end
