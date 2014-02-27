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
    }
}

- (void)prepareForReuse
{
    [self.pickerView removeFromSuperview];
    [super prepareForReuse];
}

@end