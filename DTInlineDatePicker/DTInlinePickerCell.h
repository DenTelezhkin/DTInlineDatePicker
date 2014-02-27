//
// Created by Denys Telezhkin on 25.02.14.
// Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTTableViewCell.h"

/**
 DTInlinePickerCell is intended to be used with DTDatePickerPresenter class. It automatically manages presentation of UIDatePicker inside the cell.
 */

@interface DTInlinePickerCell : DTTableViewCell

/**
 UIDatePicker object, that is presented.
 */
@property (nonatomic, strong) UIDatePicker * pickerView;

@end