//
//  PTRXMainViewController.m
//  SyslivePM
//
//  Created by Wang Long on 11/19/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "PTRXMainViewController.h"
#import "PTRXBlueViewController.h"
#import "PTRXYellowViewController.h"
#import "PTRXWizardViewController.h"

@interface PTRXMainViewController ()

@property (strong, nonatomic) PTRXWizardViewController *wizardViewController;

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
	
    /*
    self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
    [self.view insertSubview:self.blueViewController.view atIndex:0];
    self.blueViewController.mainController = self;
     */
    
    self.wizardViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Wizard"];
    [self.view insertSubview:self.wizardViewController.view atIndex:0];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if(!self.blueViewController.view.superview)
    {
        self.blueViewController = nil;
    } else {
        self.yellowViewController = nil;
    }
}

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

@end
