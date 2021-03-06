//
//  PTRXAppDelegate.h
//  SyslivePM
//
//  Created by Wang Long on 11/18/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PTRXWizardViewController;
@class PTRXLoginViewController;

@interface PTRXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PTRXWizardViewController *wizardController;
@property (strong, nonatomic) PTRXLoginViewController *loginController;

@end
