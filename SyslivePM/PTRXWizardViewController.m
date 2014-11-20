//
//  PTRXWizardViewController.m
//  SyslivePM
//
//  Created by Wang Long on 11/18/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "PTRXWizardViewController.h"
#import "PTRXLoginViewController.h"
#import "PTRXMainViewController.h"

const int TotalNumPages = 3;

@interface PTRXWizardViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation PTRXWizardViewController
{
    BOOL _firstTime;
    UIStatusBarStyle _statusBarStyle;
    //PTRXLoginViewController *_loginViewController;
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return _statusBarStyle;
}

/* Only called when xib file used */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)initCustomUI
{
    _statusBarStyle = UIStatusBarStyleDefault;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _firstTime = YES;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    if(_firstTime)
    {
        _firstTime = NO;
        [self initScrollView];
    }
}

- (void)initScrollView
{
    NSLog(@"initScrollView");
    //self.scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"LandscapeBackground"]];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width * TotalNumPages, self.scrollView.bounds.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = YES;
    
    self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    self.pageControl.numberOfPages = TotalNumPages;
    self.pageControl.currentPage = 0;
    
    [self addButtonsToScrollView];
    [self addSwipeGestureToScrollView];

}

- (void)addSwipeGestureToScrollView
{
    UISwipeGestureRecognizer *horRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(horizontalSwipe:)];
    horRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:horRecognizer];
}

- (void)horizontalSwipe:(UIGestureRecognizer *)recognizer
{
    NSLog(@"Swipe detected");
    NSInteger currentPage = self.pageControl.currentPage;
    CGFloat width = self.scrollView.bounds.size.width;
    
    if(currentPage == TotalNumPages - 1)
    {
        [self showLoginController];
        [self dismissFromParentViewController];
    } else {
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.scrollView.contentOffset = CGPointMake((currentPage + 1) * width, 0);
                         } completion:^(BOOL finished){
                             self.pageControl.currentPage++;
                         }];
    }
    
}

- (void)addButtonsToScrollView
{
    CGFloat width = self.scrollView.bounds.size.width;
    
    CGFloat buttonWidth = 80.0f;
    CGFloat buttonHeight = 40.0f;
    CGFloat margin = 10.0f;
    CGFloat buttonY = self.scrollView.bounds.size.height - buttonHeight - margin;
    CGFloat buttonX;
    
    NSString *titleString = NSLocalizedString(@"Next", @"Title text on 'next' button");
    
    for(int i = 0; i < TotalNumPages; i++)
    {
        if(i == TotalNumPages - 1)
        {
            titleString = NSLocalizedString(@"Finish", @"Title text on 'finish' button");
        }
        buttonX = (i + 1) * width - buttonWidth - margin;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 2000 + i;
        [button setTitle:titleString forState:UIControlStateNormal];
        button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
        [button addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.scrollView addSubview:button];
    }
    
}

- (void)nextButtonPressed:(UIButton *)sender
{
    NSInteger index = sender.tag - 2000;
    CGFloat width = self.scrollView.bounds.size.width;
    
    if(index < TotalNumPages - 1)
    {
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.scrollView.contentOffset = CGPointMake(width * (index + 1), 0);
                         }
                         completion:nil];
    }
    
    if(index == TotalNumPages - 1)
    {
        [self showLoginController];
    }
}

/*
- (void)showLoginController2
{
    if(_loginViewController == nil)
    {
        _loginViewController = [[PTRXLoginViewController alloc] initWithNibName:@"PTRXLoginViewController" bundle:nil];
        
        [self addChildViewController:_loginViewController];
        
        [self transitionFromViewController:self
                          toViewController:_loginViewController
                                  duration:0.3f
                                   options:UIViewAnimationOptionShowHideTransitionViews
                                animations:nil
                                completion:nil];
    }
}
 */

/*
- (void)showLoginController
{
    if(_loginViewController == nil)
    {
        _loginViewController = [[PTRXLoginViewController alloc] initWithNibName:@"PTRXLoginViewController" bundle:nil];
        _loginViewController.view.frame = self.view.bounds;
        _loginViewController.view.alpha = 0.0f;
        
        [self.view addSubview:_loginViewController.view];
        [self addChildViewController:_loginViewController];
        
        [self.scrollView removeFromSuperview];
        [self.pageControl removeFromSuperview];
        
        [UIView animateWithDuration:0.3f
                         animations:^{
                             _loginViewController.view.alpha = 1.0f;
                         } completion:^(BOOL finished) {
                             [_loginViewController didMoveToParentViewController:self];
                         }];
    }
}
 */

/*
 
 self.wizardViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Wizard"];
 self.wizardViewController.mainController = self;
 [self.view insertSubview:self.wizardViewController.view atIndex:0];
 */

- (void)showLoginController
{
    if(self.mainController.loginController == nil)
    {
        [self.view removeFromSuperview];
        self.mainController.loginController = [self.mainController.storyboard instantiateViewControllerWithIdentifier:@"Login"];
        self.mainController.loginController.mainController = self.mainController;
        [self.mainController.view insertSubview:self.mainController.loginController.view atIndex:0];
        self.mainController.loginController.view.alpha = 0.0f;
        
        [UIView animateWithDuration:0.8f
                         animations:^{
                             self.mainController.loginController.view.alpha = 1.0f;
                         }];
        //[self.mainController.view insertSubview:self.mainController.loginController.view atIndex:0];
    }
}

- (void)dismissFromParentViewController
{
    [self willMoveToParentViewController:nil];
}

/*
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = self.scrollView.bounds.size.width;
    
    //滑动四分之三才进入下一屏
    int currentPage = (self.scrollView.contentOffset.x + width * 0.25f) / width;
    self.pageControl.currentPage = currentPage;
}
 */

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"Wizard will disappear");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"dealloc: %@", self);
}

@end
