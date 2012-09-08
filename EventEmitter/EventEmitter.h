//
//  EventEmitter.h
//  EventEmitter
//
//  Created by Christoph Jerolimov on 07.09.2012.
//  Copyright (c) 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EventEmitterListener.h"

/*
Node.js EventEmitter inspired, c-block-listener library.

http://nodejs.org/docs/latest/api/events.html
 */
@interface EventEmitter : NSObject
@end

@interface EventEmitter(EventEmitterListenerHandling)

/*
 Adds a listener to the end of the listeners array for the specified event.
 */
- (void) on:(NSString*) event callback:(EventEmitterDefaultCallback) callback;
- (void) on:(NSString*) event array:(EventEmitterArrayCallback) callback;
// TODO? - (void) on:(NSString*) event callback:(id) callback argumentSize:length;
// TODO? - (void) onError:(NSError*) error;

/*
 Adds a __one time__ listener for the event. This listener is invoked only
 the next time the event is fired, after which it is removed.
 */
- (void) once:(NSString*) event callback:(EventEmitterDefaultCallback) callback;
- (void) once:(NSString*) event array:(EventEmitterArrayCallback) callback;

/*
 Remove a listener from the listener array for the specified event.
 */
//- (void) removeListener:(NSString*) event callback:(id) callback;

/*
 Removes all listeners for the specified event.
 */
//- (void) removeAllListener:(NSString*) event;

/*
 Removes all listeners.
 */
//- (void) removeAllListener;

/*
 Returns an array of listeners.
 */
//- (NSArray*) listeners;

/*
 Returns an array of listeners for the specified event.
 */
//- (NSArray*) listeners:(NSString*) event;

@end

@interface EventEmitter(EventEmitterDistributionHandling)

- (void) emit:(NSString*) event;
- (void) emit:(NSString*) event data: (id) arg0;
- (void) emit:(NSString*) event arguments: (id) arg0, ...;
- (void) emit:(NSString*) event array: (NSArray*) array;

@end
