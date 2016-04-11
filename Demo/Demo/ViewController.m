//
//  ViewController.m
//  DMHorizontalView
//
//  Created by David Martinez Lebron on 4/3/16.
//  Copyright © 2016 Davaur. All rights reserved.
//

#import "ViewController.h"
#import "UIView+HorizontalView.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *topView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // creates the super view
    UIView *superView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.frame), 70)];
    
    
    // creates the subviews empty array
    NSMutableArray<UIView *> *viewsArray = [NSMutableArray array];
    
    // populates the subviews array
    for (int i=0; i < 5; i++) {
        [viewsArray addObject:[self viewForSubviews]];
    }
    
    // call the instance method
    [superView horizontalViewWithViewsArray:viewsArray withHorizontalDistribution:HorizontalDistributionFill andVerticalLocation:VerticalLocationCentered];
    
    
    // add super view to view controller
    [self.view addSubview:superView];
}


-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSMutableArray *subviewArray = [NSMutableArray array];
    
    
    // create subviews
    for (int i=0; i < 8; i++) {
        [subviewArray addObject:[self viewForSubviews]];
    }
    
    [self.topView setBackgroundColor:[UIColor whiteColor]];
    // prepare horizontal view
    [self.topView horizontalViewWithViewsArray:subviewArray withHorizontalDistribution:HorizontalDistributionFill andVerticalLocation:VerticalLocationCentered];
//    [self.topView divideIntoSegmentsWithObjects:subviewArray];
}



-(UIView *) viewForSubviews {
    
    CGFloat size = 40;
    
    // CGPoint is not important
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size, size)];
    [subview setBackgroundColor:[UIColor redColor]];
    
    return subview;
    
    
}










@end







