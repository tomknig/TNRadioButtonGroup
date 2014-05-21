//
//  TNRadioButtonData.m
//  TNRadioButtonGroupDemo
//
//  Created by Frederik Jacques on 22/04/14.
//  Copyright (c) 2014 Frederik Jacques. All rights reserved.
//

#import "TNRadioButtonData.h"


@implementation TNRadioButtonData

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        self.verticalAlignment = TNRadioButtonVerticalAligmentMiddle;
    }
    return self;
}

#pragma mark - Debug
- (NSString *)description {
    return [NSString stringWithFormat:@"[TNRadioButtonData] Identifier: %@ - Tag: %i - Selected: %d", self.identifier, self.tag, self.selected];
}

#pragma mark - Getters

- (UIFont *)labelFont
{
    if (!_labelFont) {
        _labelFont = [UIFont systemFontOfSize:14];
    }
    return _labelFont;
}

@end
