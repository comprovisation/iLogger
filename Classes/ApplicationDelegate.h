//
//  iLoggerAppDelegate.h
//  iLogger
//
//  Created by Thomas Dohmke on 06.10.09.
//  Copyright Thomas Dohmke 2009. All rights reserved.
//

@interface ApplicationDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

