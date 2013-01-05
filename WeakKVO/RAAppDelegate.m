//
//  RAAppDelegate.m
//  WeakKVO
//
//  Created by Evadne Wu on 1/5/13.
//  Copyright (c) 2013 Radius. All rights reserved.
//

#import "RAAppDelegate.h"
#import "RAHost.h"

@interface RAAppDelegate ()
@property (nonatomic, readonly, strong) NSMutableSet *keepAlive;
@end

@implementation RAAppDelegate
@synthesize keepAlive = _keepAlive;

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	
	RAHost *host = [RAHost new];
	NSObject *expendable = [NSObject new];
	host.something = expendable;
	
	[host addObserver:self forKeyPath:@"something" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:(void *)self];
	
	[self.keepAlive addObject:host];
	[self.keepAlive addObject:expendable];
	
	__weak typeof(self) wSelf = self;
	__weak typeof(expendable) wExpandable = expendable;

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		
			NSCParameterAssert(wSelf);
			NSCParameterAssert(wExpandable);
			
			[wSelf.keepAlive removeObject:wExpandable];
			
	});
	
	return YES;
	
}

- (NSMutableSet *) keepAlive {

	if (!_keepAlive) {
	
		_keepAlive = [NSMutableSet set];
	
	}
	
	return _keepAlive;

}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {

	NSLog(@"%s %@ %@ %@ %p", __PRETTY_FUNCTION__, keyPath, object, change, context);
	
}

@end
