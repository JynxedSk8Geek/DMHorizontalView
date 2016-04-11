# DMHorizontalView
Ever found yourself making calculations to make horizontal distributions of UIImageView, UIView, UIButton or any other UIView subclass inside a superview?
If so, this is a really simple solution for you.
It allows you to make distributions horizontally in a super view and select vertical location.

![Screenshot of Demo App](https://github.com/davamale/DMHorizontalView/blob/master/images/Simulator%20Screen%20Shot%20Apr%2011%2C%202016%2C%201.44.14%20PM.png)

# Description
A very simple and easy to use tool to make horizontal distribution of subviews.

# Usage
  *Create a superview (the UIView which will contain the subviews). It can be created using storyboards or programmatically. 
  *Crete an array of the subviews intended to be distributed on the superview.
  *Call the instance method `horizontalViewWithViewsArray` and that's it.

If all the subviews won't fit in the superview, automatically adds a three dots label (..) for you.

# Installation
Drag to your project all files inside DMHorizontalView folder. If using swift, add `UIView+HorizontalView.h` to you bridging header file.

# Example
```
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


-(UIView *) viewForSubviews {

CGFloat size = 40;

// CGPoint is not important
UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size, size)];
[subview.layer setCornerRadius:size/2];
[subview setBackgroundColor:[self randomColor]];

return subview;
}
```

# Options

### Horizontal options
```
/**
 Horizontal distribution of subviews distribution in superview in the x axis
 */
typedef enum {
    /** Distributes subviews uniformally in superview */
    HorizontalDistributionFill,
    /** Distributes subviews with overlapping with the right on top of the left in superview */
    HorizontalDistributionOverlapped,
    /** Distributes subviews from left to right leaving 0 from subview to subview */
    HorizontalDistributionNormal
} HorizontalDistribution;
```

### Vertical options
```
/**
 Vertical Location of subviews in superview in the y axis
 */
typedef enum {
    /** Top location in superview */
    VerticalLocationTop,
    /** Centered location in superview */
    VerticalLocationCentered,
    /** Bottom location in superview */
    VerticalLocationBottom
} VerticalLocation;
```
