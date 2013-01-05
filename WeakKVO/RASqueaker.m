//
//  RASqueaker.m
//  WeakKVO
//
//  Created by Evadne Wu on 1/5/13.
//  Copyright (c) 2013 Radius. All rights reserved.
//

#import "RASqueaker.h"

@interface RASqueaker ()
@property (nonatomic, readonly, copy) void (^squeakBlock)(void);
@end

@implementation RASqueaker
@synthesize squeakBlock = _squeakBlock;

- (instancetype) initWithSqueak:(void (^)(void))block {

	self = [super init];
	if (!self)
		return nil;
	
	_squeakBlock = [block copy];
	
	return self;

}

- (id) init {

	return [self initWithSqueak:nil];

}

- (void) dealloc {

	if (_squeakBlock)
		_squeakBlock();

}

@end
