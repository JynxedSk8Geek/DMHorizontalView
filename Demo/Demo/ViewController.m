//
//  ViewController.m
//  DMHorizontalView
//
//  Created by David Martinez Lebron on 4/3/16.
//  Copyright © 2016 Davaur. All rights reserved.
//

#import "ViewController.h"
#import "UIView+HorizontalView.h"
#import "UIImage+SocialNetworks.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *topView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.frame), 70)];
    [titleLabel setTextColor:[UIColor blackColor]];
    [titleLabel setText:@"Horizontal Distribution Fill"];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    // creates the super view
    UIView *superView = [[UIView alloc] initWithFrame:CGRectMake(0, [titleLabel frame].origin.y + CGRectGetHeight([titleLabel frame]), CGRectGetWidth(self.view.frame), 70)];
    
    
    // creates the subviews empty array
    NSMutableArray<UIView *> *viewsArray = [NSMutableArray array];
    
    [viewsArray addObject:[self imageViewWithImage:[UIImage facebookImage]]];
    [viewsArray addObject:[self imageViewWithImage:[UIImage twitterImage]]];
    [viewsArray addObject:[self imageViewWithImage:[UIImage linkedInImage]]];
    
    // call the instance method
    [superView horizontalViewWithViewsArray:viewsArray withHorizontalDistribution:HorizontalDistributionFill andVerticalLocation:VerticalLocationCentered];
    
    [self.view addSubview:titleLabel];
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
    [self.topView horizontalViewWithViewsArray:subviewArray withHorizontalDistribution:HorizontalDistributionOverlapped andVerticalLocation:VerticalLocationCentered];
//    [self.topView divideIntoSegmentsWithObjects:subviewArray];
}


-(UIImageView *) imageViewWithImage: (UIImage *) image {
    
    CGFloat size = 30;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size, size)];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setImage:image];
    
    
    return imageView;
}


-(UIColor *) randomColor {
    
    NSArray *colorArray = @[[UIColor greenColor], [UIColor blueColor], [UIColor blackColor], [UIColor redColor], [UIColor orangeColor]];
    
    return colorArray[arc4random_uniform((int)colorArray.count)];
}

-(UIView *) viewForSubviews {
    
    CGFloat size = 40;
    
    // CGPoint is not important
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size, size)];
    [subview.layer setCornerRadius:size/2];
    [subview setBackgroundColor:[self randomColor]];
    
    return subview;
}










@end







