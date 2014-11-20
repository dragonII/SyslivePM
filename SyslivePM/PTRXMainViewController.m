//
//  PTRXMainViewController.m
//  SyslivePM
//
//  Created by Wang Long on 11/19/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "PTRXMainViewController.h"
//#import "PTRXBlueViewController.h"
//#import "PTRXYellowViewController.h"
#import "PTRXWizardViewController.h"
#import "PTRXLoginViewController.h"

@interface PTRXMainViewController ()

@end

@implementation PTRXMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.wizardController = [self.storyboard instantiateViewControllerWithIdentifier:@"Wizard"];
    self.wizardController.mainController = self;
    [self.view insertSubview:self.wizardController.view atIndex:0];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    /*
    if(!self.blueViewController.view.superview)
    {
        self.blueViewController = nil;
    } else {
        self.yellowViewController = nil;
    }
     */
}

/*
- (IBAction)switchViews:(id)sender
{
    if(!self.yellowViewController.view.superview)
    {
        if(!self.yellowViewController)
        {
            self.yellowViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Yellow"];
            self.yellowViewController.mainController = self;
            NSLog(@"yellowController created");
        }
        
        [self.blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
        [self addChildViewController:self.blueViewController];
    } else {
        if(!self.blueViewController)
        {
            self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
            self.blueViewController.mainController = self;
            NSLog(@"blueController created");
        }
        [self.yellowViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
    }
}
 */

@end
