//
//  RadioButton.m
//  TNRadioButtonGroupDemo
//
//  Created by Frederik Jacques on 22/04/14.
//  Copyright (c) 2014 Frederik Jacques. All rights reserved.
//

#import "TNRadioButton.h"

@interface TNRadioButton()
@property (nonatomic) CGRect labelRect;
@property (nonatomic) CGFloat lineHeight;
@end

@implementation TNRadioButton

- (instancetype)initWithData:(TNRadioButtonData *)data {
    
    self = [super init];
    
    if (self) {
        self.labelRect = CGRectZero;
        self.lineHeight = 0;
        self.data = data;
    }
    
    return self;
}

- (void)setup {
    
    [self createLabel];
    [self createHiddenButton];
    
    [self selectWithAnimation:NO];
    self.frame = self.btnHidden.frame;
}

- (void)createRadioButton {}

- (void)createLabel {
    self.lblLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.radioButton.frame.origin.x + self.radioButton.frame.size.width + 15, 0, self.labelRect.size.width, self.labelRect.size.height)];
    self.lblLabel.numberOfLines = 0;
    self.lblLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.lblLabel.font = self.data.labelFont;
    self.lblLabel.textColor = self.data.labelColor;
    self.lblLabel.text = self.data.labelText;
    [self addSubview:self.lblLabel];
}

- (void)createHiddenButton {
    
    int height = MAX(self.lblLabel.frame.size.height, self.radioButton.frame.size.height);
    
    self.btnHidden = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnHidden.frame = CGRectMake(0, 0, self.lblLabel.frame.origin.x + self.lblLabel.frame.size.width, height);
    [self addSubview:self.btnHidden];
    
    [self.btnHidden addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonTapped:(id)sender {
    
    if( !self.data.selected ){
        self.data.selected = !self.data.selected;
        
        if ([self.delegate respondsToSelector:@selector(radioButtonDidChange:)]) {
            [self.delegate radioButtonDidChange:self];
        }
        
    }
}

- (CGFloat)verticalButtonOriginForHeight:(CGFloat)height
{
    CGFloat y = 0;
    
    switch (self.data.verticalAlignment) {
        case TNRadioButtonVerticalAligmentTop:
            y = self.lineHeight / 2.f - height / 2.f;
            break;
        case TNRadioButtonVerticalAligmentMiddle:
            y = self.labelRect.size.height / 2.f - height / 2.f;
            break;
        case TNRadioButtonVerticalAligmentBottom:
            y = self.labelRect.size.height - height - self.lineHeight / 2.f + height / 2.f;
            break;
    }
    
    return y;
}

#pragma mark - Animations
- (void)selectWithAnimation:(BOOL)animated {}

#pragma mark - Getters

- (CGRect)labelRect
{
    if (CGRectEqualToRect(_labelRect, CGRectZero)) {
        _labelRect = [self.data.labelText boundingRectWithSize:CGSizeMake(150, CGFLOAT_MAX)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName:self.data.labelFont}
                                                       context:nil];
    }
    return _labelRect;
}

- (CGFloat)lineHeight
{
    if (!_lineHeight) {
        NSString *stringThatFitsToOneLine = @"-";
        _lineHeight = [stringThatFitsToOneLine boundingRectWithSize:CGSizeMake(150, CGFLOAT_MAX)
                                                            options:NSStringDrawingUsesLineFragmentOrigin
                                                         attributes:@{NSFontAttributeName:self.data.labelFont}
                                                            context:nil].size.height;
    }
    return _lineHeight;
}

@end
