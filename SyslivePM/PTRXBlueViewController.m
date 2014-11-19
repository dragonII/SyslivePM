//
//  PTRXBlueViewController.m
//  SyslivePM
//
//  Created by Wang Long on 11/19/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "PTRXBlueViewController.h"
#import "PTRXMainViewController.h"
#import "PTRXYellowViewController.h"

@interface PTRXBlueViewController ()

//@property (strong, nonatomic) PTRXYellowViewController *yellowController;

@end

@implementation PTRXBlueViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)printMainController:(UIViewController *)mainController
{
    NSLog(@"MainController: %@", mainController);
}

/*
- (IBAction)blueButtonPressed
{
    PTRXYellowViewController *yellowViewController;
    for(id controller in self.mainController.childViewControllers)
    {
        if([controller isKindOfClass:[PTRXYellowViewController class]])
        {
            yellowViewController = (PTRXYellowViewController *)controller;
            NSLog(@"Blue1");
        }
    }
    NSLog(@"Yellow View 1: %@", yellowViewController);
    
    if(!yellowViewController.view.superview)
    {
        if(!yellowViewController)
        {
            yellowViewController = [self.mainController.storyboard instantiateViewControllerWithIdentifier:@"Yellow"];
            NSLog(@"Yellow View: %@", yellowViewController);
        }
        yellowViewController.mainController = self.mainController;
        [self.view removeFromSuperview];
        [self.mainController.view insertSubview:yellowViewController.view atIndex:0];
        NSLog(@"Blue pressed");
    }
}
 */

- (IBAction)bbClicked
{
    /*
    for(id controller in self.mainController.childViewControllers)
    {
        if([controller isKindOfClass:[UIViewController class]])
        {
            NSLog(@"Found Yellow");
            self.mainController.yellowViewController = (PTRXYellowViewController *)controller;
        }
    }
     */
    
    if(!self.mainController.yellowViewController.view.superview)
    {
        if(!self.mainController.yellowViewController)
        {
            self.mainController.yellowViewController = [self.mainController.storyboard instantiateViewControllerWithIdentifier:@"Yellow"];
            NSLog(@"yellowController created");
        }
        self.mainController.yellowViewController.mainController = self.mainController;
        [self.view removeFromSuperview];
        [self.mainController.view insertSubview:self.mainController.yellowViewController.view atIndex:0];
    }
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"disappear %@", self);
}

- (void)dealloc
{
    NSLog(@"dealloc: %@", self);
}

@end
