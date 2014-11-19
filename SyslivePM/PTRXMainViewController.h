//
//  PTRXMainViewController.h
//  SyslivePM
//
//  Created by Wang Long on 11/19/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PTRXBlueViewController;
@class PTRXYellowViewController;

@interface PTRXMainViewController : UIViewController

@property (strong, nonatomic) PTRXBlueViewController *blueViewController;
@property (strong, nonatomic) PTRXYellowViewController *yellowViewController;

@end
