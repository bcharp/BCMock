//
//  categoryLikeMockAppDelegate.h
//  categoryLikeMock
//
//  Created by boris charpentier on 23/08/11.
//  Copyright 2011 bcharp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCMockViewController;

@interface BCMockAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet BCMockViewController *viewController;

@end
