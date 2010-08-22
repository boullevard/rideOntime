//
//  TabAppDelegate.h
//  Tab
//
//  Created by Nabil Mouzannar on 6/19/10.
//  Copyright Boullevard 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchXML.h"


@interface TabAppDelegate : NSObject <UIApplicationDelegate, UIAlertViewDelegate> {
    UIWindow *window;
	UITabBarController *rootController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController;

- (NSString *) getBody ;
@end

