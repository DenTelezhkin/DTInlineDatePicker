//
//  DTInlinePickerTableController.m
//  DTInlinePickerViews
//
//  Created by Denys Telezhkin on 25.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTPickerPresenter.h"
#import "DTInlinePickerTableController.h"
#import "DTInlinePickerCell.h"

@interface DTInlinePickerTableController()
@property (nonatomic, strong) NSMutableDictionary * inlinePickers;
@property (nonatomic, strong) NSIndexPath * pickerIndexPath;
@end

@implementation DTInlinePickerTableController

- (NSMutableDictionary *)inlinePickers
{
    if (!_inlinePickers)
    {
        _inlinePickers = [NSMutableDictionary new];
    }
    return _inlinePickers;
}

-(void)viewDidLoad
{
    [super viewDidLoad];

    [self registerCellClass:[DTInlinePickerCell class] forModelClass:[DTPickerViewPresenter class]];
    [self registerCellClass:[DTInlinePickerCell class] forModelClass:[DTDatePickerPresenter class]];
}

- (void)attachInlinePickerPresenter:(id)presenter toIndexPath:(NSIndexPath *)indexPath
{
    NSParameterAssert(presenter);
    NSParameterAssert(indexPath);

    self.inlinePickers[indexPath] = presenter;
}

- (void)detachInlinePickerPresenterFromIndexPath:(NSIndexPath *)indexPath
{
    NSParameterAssert(indexPath);

    [self.inlinePickers removeObjectForKey:indexPath];
}

- (void)didShowPickerForIndexPath:(NSIndexPath *)indexPath
{

}

- (void)didHidePickerForIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = [self.memoryStorage objectAtIndexPath:indexPath];
    if ([model isKindOfClass:[DTDatePickerPresenter class]] || [model isKindOfClass:[DTPickerViewPresenter class]])
    {
        return 216.0f;
    }

    return self.tableView.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = [self.memoryStorage objectAtIndexPath:indexPath];
    if ([model isKindOfClass:[DTDatePickerPresenter class]] || [model isKindOfClass:[DTPickerViewPresenter class]])
    {
        return 216.0f;
    }

    return self.tableView.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.pickerIndexPath)
    {
        if (self.pickerIndexPath.section == indexPath.section)
        {
            if (self.pickerIndexPath.row<indexPath.row)
            {
                indexPath = [NSIndexPath indexPathForRow:indexPath.row-1
                                               inSection:indexPath.section];
            }
        }
    }
    if (self.inlinePickers[indexPath])
    {
        if ([self.pickerIndexPath isEqual:indexPath])
        {
            [self removePickerFromIndexPath:indexPath];
        }
        else
        {
            if (self.pickerIndexPath)
            {
                [self removePickerFromIndexPath:self.pickerIndexPath];
            }
            [self insertPickerForIndexPath:indexPath];
        }
    }
}

- (void)insertPickerForIndexPath:(NSIndexPath *)indexPath
{
    id presenter = self.inlinePickers[indexPath];

    [self.memoryStorage insertItem:presenter toIndexPath:[NSIndexPath indexPathForRow:indexPath.row + 1
                                                                             inSection:indexPath.section]];
    [self didShowPickerForIndexPath:indexPath];
    self.pickerIndexPath = indexPath;
}

- (void)removePickerFromIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath * pickerIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
    [self.memoryStorage removeItem:[self.memoryStorage objectAtIndexPath:pickerIndexPath]];
    self.pickerIndexPath = nil;
    [self didHidePickerForIndexPath:indexPath];
}

@end
