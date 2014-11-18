//
//  PTRXWizardViewController.m
//  SyslivePM
//
//  Created by Wang Long on 11/18/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "PTRXWizardViewController.h"

const int TotalNumPages = 3;

@interface PTRXWizardViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation PTRXWizardViewController
{
    BOOL _firstTime;
    UIStatusBarStyle _statusBarStyle;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return _statusBarStyle;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _firstTime = YES;
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
    
    [self addSwipeGestureToScrollView];
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
    NSInteger currentPage = self.pageControl.currentPage;
    CGFloat width = self.scrollView.bounds.size.width;
    
    if(currentPage == TotalNumPages - 1)
    {
        NSLog(@"Last Page");
    } else {
        [UIView animateWithDuration:0.3
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
    
    for(int i = 0; i < TotalNumPages; i++)
    {
        buttonX = (i + 1) * width - buttonWidth - margin;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 2000 + i;
        [button setTitle:[NSString stringWithFormat:@"Next %d", i] forState:UIControlStateNormal];
        button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
        [button addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.scrollView addSubview:button];
    }
    
}

- (void)nextButtonPressed:(UIButton *)sender
{
    int index = sender.tag - 2000;
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
        NSLog(@"Finished");
    }
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

@end
