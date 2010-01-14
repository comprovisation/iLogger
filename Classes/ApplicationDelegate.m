//
//  iLoggerAppDelegate.m
//  iLogger
//
//  Created by Thomas Dohmke on 06.10.09.
//  Copyright Thomas Dohmke 2009. All rights reserved.
//

#import "ApplicationDelegate.h"
#import "TweetsViewController.h"

@implementation ApplicationDelegate

@synthesize window;
@synthesize navigationController;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	[window addSubview:[navigationController view]];
  [window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

