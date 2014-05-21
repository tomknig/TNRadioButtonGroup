//
//  TNRadioButtonData.h
//  TNRadioButtonGroupDemo
//
//  Created by Frederik Jacques on 22/04/14.
//  Copyright (c) 2014 Frederik Jacques. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kTNDefaultRadioButtonLabelWidth 150

typedef enum : NSUInteger {
    TNRadioButtonVerticalAligmentTop,
    TNRadioButtonVerticalAligmentMiddle,
    TNRadioButtonVerticalAligmentBottom
} TNRadioButtonVerticalAligment;

@interface TNRadioButtonData : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic) NSInteger tag;
@property (nonatomic, copy) NSString *labelText;
@property (nonatomic) BOOL selected;
@property (nonatomic) TNRadioButtonVerticalAligment verticalAlignment;
@property (nonatomic) CGFloat minLabelWidth;
@property (nonatomic) CGFloat maxLabelWidth;

@property (nonatomic, strong) UIFont *labelFont;
@property (nonatomic, strong) UIColor *labelColor;

@end
