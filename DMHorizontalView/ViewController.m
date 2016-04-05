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
    
}


-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSMutableArray *subviewArray = [NSMutableArray array];
    
    
    // create subviews
    for (int i=0; i < 8; i++) {
        [subviewArray addObject:[self viewForSubviews]];
    }
    
    // prepare horizontal view
    [self.topView horizontalViewWithViewsArray:subviewArray withHorizontalDistribution:HorizontalDistributionFill andVerticalLocation:VerticalLocationCentered];
}



-(UIView *) viewForSubviews {
    
    CGFloat size = 25;
    
    // CGPoint is not important
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size, size)];
    [subview setBackgroundColor:[UIColor whiteColor]];
    
    return subview;
    
    
}










@end







