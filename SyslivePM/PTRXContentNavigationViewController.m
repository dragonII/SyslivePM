//
//  PTRXContentNavigationViewController.m
//  SyslivePM
//
//  Created by Wang Long on 11/20/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "PTRXContentNavigationViewController.h"
#import "PTRXMainViewController.h"

@interface PTRXContentNavigationViewController ()

@end

@implementation PTRXContentNavigationViewController

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

    self.mainController.loginController = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    [self initContentNavigationButtons];
}

/*
 Buttons Layout chart
 +-------+----+----+
 |       |    |    |
 |   B1  | B4 | B7 |
 |-------+----+----+
 |       |    |    |
 |   B2  | B5 | B8 |
 |       |    |    |
 |-------+----+----+
 |       |    |    |
 |       |    |    |
 |   B3  | B6 | B9 |
 |       |    |    |
 |       |    |    |
 +-------+----+----+
 */

- (void)initContentNavigationButtons
{
    CGFloat topMargin = 20.0f;
    CGFloat bottomMargin = 20.0f;
    CGFloat margin = 10.0f;
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    NSInteger totalRows = 3;
    NSInteger totalCols = 3;
    NSInteger totalButs = 9;
    
    
    NSInteger rowIndex = 0;
    NSInteger colIndex = 0;
    
    for(int butIndex = 0; butIndex < totalButs; butIndex++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:[NSString stringWithFormat:@"%d", butIndex] forState:UIControlStateNormal];
        if(colIndex == 0)
        {
            
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
