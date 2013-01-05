//
//  RAHost.m
//  WeakKVO
//
//  Created by Evadne Wu on 1/5/13.
//  Copyright (c) 2013 Radius. All rights reserved.
//

#import "RAHost.h"
#import "RASqueaker.h"

@implementation RAHost

- (id) something {
	
	static const void *kObserver = &kObserver;
	
	if (_something) {
		
		if (!objc_getAssociatedObject(_something, kObserver)) {
			
			__weak typeof(self) wSelf = self;
			
			objc_setAssociatedObject(_something, kObserver, [[RASqueaker alloc] initWithSqueak:^{
				
				[wSelf willChangeValueForKey:@"something"];
				[wSelf didChangeValueForKey:@"something"];
				
			}], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
			
		}
		
	}
	
	return _something;

}

@end
