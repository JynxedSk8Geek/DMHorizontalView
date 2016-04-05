//
//  UIView+Shadow.m
//  LogoPogo_Ver.2_iOS
//  Created by David Martinez Lebron on 5/12/15.
//  Copyright (c) 2015 Davaur_David Martinez. All rights reserved.
//
//

#import "UIView+Shadow.h"

@implementation UIView (Shadow)

-(void) addBottomShadow {
    self.layer.shadowOffset = CGSizeMake(0, 3);
    self.layer.shadowRadius = 1;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
}

-(void) addShadow {
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    self.layer.shadowOpacity = 0.8;
    
    self.layer.shadowRadius = 2.0;
    
    self.layer.shadowOffset = CGSizeMake(0, 0);
}

@end
