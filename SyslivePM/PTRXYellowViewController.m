//
//  PTRXYellowViewController.m
//  SyslivePM
//
//  Created by Wang Long on 11/19/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "PTRXYellowViewController.h"
#import "PTRXMainViewController.h"
#import "PTRXBlueViewController.h"

@interface PTRXYellowViewController ()

//@property (strong, nonatomic)PTRXBlueViewController *blueController;

@end

@implementation PTRXYellowViewController

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

/*
- (IBAction)yellowButtonPressed
{
    NSLog(@"0");
    
        PTRXBlueViewController *blueViewController;
        for(id controller in self.mainController.childViewControllers)
        {
            NSLog(@"1");
            if([controller isKindOfClass:[PTRXBlueViewController class]])
            {
                blueViewController = (PTRXBlueViewController *)controller;
                NSLog(@"2");
            }
        }
        NSLog(@"Blue View 1: %@", blueViewController);
        
        if(!blueViewController.view.superview)
        {
            if(!blueViewController)
            {
                blueViewController = [self.mainController.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
                NSLog(@"Yellow View: %@", blueViewController);
            }
            blueViewController.mainController = self.mainController;
            [self.view removeFromSuperview];
            [self.mainController.view insertSubview:blueViewController.view atIndex:0];
            NSLog(@"Yellow pressed");
    }
    
}
 */


- (IBAction)yyClicked
{
    /*
    for(id controller in self.mainController.childViewControllers)
    {
        if([controller isKindOfClass:[UIViewController class]])
        {
            NSLog(@"Found Blue");
            self.blueController = (PTRXBlueViewController *)controller;
        }
    }
     */
    
    if(!self.mainController.blueViewController.view.superview)
    {
        if(!self.mainController.blueViewController)
        {
            self.mainController.blueViewController = [self.mainController.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
            NSLog(@"blueController crearted");
        }
        self.mainController.blueViewController.mainController = self.mainController;
        [self.view removeFromSuperview];
        [self.mainController.view insertSubview:self.mainController.blueViewController.view atIndex:0];
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
