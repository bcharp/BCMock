//
//  categoryLikeMockAppDelegate.h
//  categoryLikeMock
//
//  Created by boris charpentier on 23/08/11.
//  Copyright 2011 bcharp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class categoryLikeMockViewController;

@interface categoryLikeMockAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet categoryLikeMockViewController *viewController;

@end
