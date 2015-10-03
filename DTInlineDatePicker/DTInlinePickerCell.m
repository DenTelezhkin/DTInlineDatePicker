//
// Created by Denys Telezhkin on 25.02.14.
// Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTInlinePickerCell.h"
#import "DTPickerPresenter.h"

@implementation DTInlinePickerCell

- (void)updateWithModel:(id)model
{
    if ([model isKindOfClass:[DTDatePickerPresenter class]])
    {
        DTDatePickerPresenter * presenter = model;
        self.pickerView = presenter.datePicker;
        [self.contentView addSubview:self.pickerView];
        
        NSLayoutConstraint *topConstraints = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.pickerView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        
        NSLayoutConstraint *bottomConstraints = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.pickerView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        
        NSLayoutConstraint *leadingConstraints = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.pickerView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
        
        NSLayoutConstraint *trailingConstraints = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.pickerView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
        
        self.pickerView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraints:@[topConstraints, bottomConstraints, leadingConstraints, trailingConstraints]];
    }
}

- (void)prepareForReuse
{
    [self.pickerView removeFromSuperview];
    [super prepareForReuse];
}

@end