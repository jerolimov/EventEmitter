//
//  EventEmitterListener.h
//  EventEmitter
//
//  Created by Christoph Jerolimov on 07.09.2012.
//  Copyright (c) 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EventEmitterDefaultCallback)(id arg0);
typedef void (^EventEmitterArrayCallback)(NSArray* data);

@protocol EventEmitterListener <NSObject>
@property BOOL once;
@property id callback;
- (void) notify: (NSArray*) data;
@end

@interface EventEmitterDefaultCallbackListener : NSObject <EventEmitterListener>
@end

@interface EventEmitterArrayCallbackListener : NSObject <EventEmitterListener>
@end
