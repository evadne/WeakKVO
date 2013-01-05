//
//  RAHost.h
//  WeakKVO
//
//  Created by Evadne Wu on 1/5/13.
//  Copyright (c) 2013 Radius. All rights reserved.
//

#import <objc/runtime.h>
#import <Foundation/Foundation.h>

@interface RAHost : NSObject

@property (nonatomic, readwrite, weak) id something;

@end
