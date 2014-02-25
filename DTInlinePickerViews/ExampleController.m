//
//  ExampleController.m
//  DTInlinePickerViews
//
//  Created by Denys Telezhkin on 25.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <DTPickerPresenter/DTPickerViewPresenter.h>
#import <DTPickerPresenter/DTDatePickerPresenter.h>
#import "ExampleController.h"
#import "ExampleCell.h"
#import "DTInlinePickerCell.h"

@interface ExampleController ()
@property (nonatomic, strong) NSIndexPath * pickerIndexPath;
@end

@implementation ExampleController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self registerCellClass:[ExampleCell class] forModelClass:[NSString class]];
    [self registerCellClass:[ExampleCell class] forModelClass:[NSDate class]];
    [self registerCellClass:[DTInlinePickerCell class] forModelClass:[DTPickerViewPresenter class]];
    [self registerCellClass:[DTInlinePickerCell class] forModelClass:[DTDatePickerPresenter class]];
    [self.memoryStorage addItems:@[@"foo", [NSDate date], @"bar"]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[ExampleCell class]])
    {
        if ([self.pickerIndexPath isEqual:indexPath])
        {
            [self removePickerFromIndexPath:indexPath];
        }
        else {
            [self insertPickerForIndexPath:indexPath];
        }

    }
}

- (void)insertPickerForIndexPath:(NSIndexPath *)indexPath
{
    id model = [self.memoryStorage objectAtIndexPath:indexPath];
    if ([model isKindOfClass:[NSDate class]])
    {
        __weak typeof (self) weakSelf = self;
        DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:^(NSDate * selectedDate)
        {
            [weakSelf.memoryStorage replaceItem:[weakSelf.memoryStorage itemAtIndexPath:indexPath]
                                       withItem:selectedDate];
        }];
        [self.memoryStorage insertItem:presenter toIndexPath:[NSIndexPath indexPathForRow:indexPath.row + 1
                                                                                inSection:indexPath.section]];
        self.pickerIndexPath = indexPath;
    }

}

- (void)removePickerFromIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath * pickerIndexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
    [self.memoryStorage removeItem:[self.memoryStorage objectAtIndexPath:pickerIndexPath]];
    self.pickerIndexPath = nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = [self.memoryStorage objectAtIndexPath:indexPath];
    if ([model isKindOfClass:[DTDatePickerPresenter class]] || [model isKindOfClass:[DTPickerViewPresenter class]])
    {
        return 216.0f;
    }

    return self.tableView.rowHeight;
}

@end
