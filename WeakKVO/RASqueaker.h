//
//  RASqueaker.h
//  WeakKVO
//
//  Created by Evadne Wu on 1/5/13.
//  Copyright (c) 2013 Radius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RASqueaker : NSObject

- (instancetype) initWithSqueak:(void(^)(void))block;

@end
