//
//  ExampleController.m
//  DTInlinePickerViews
//
//  Created by Denys Telezhkin on 25.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <DTPickerPresenter/DTDatePickerPresenter.h>
#import "ExampleController.h"
#import "ExampleCell.h"
#import "DateModel.h"

@implementation ExampleController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self registerCellClass:[ExampleCell class] forModelClass:[NSString class]];
    [self registerCellClass:[ExampleCell class] forModelClass:[DateModel class]];
    [self.memoryStorage addItems:@[@"foo", [DateModel modelWithDate:[NSDate date]],[DateModel modelWithDate:[NSDate date]], @"bar"]];
    
    NSIndexPath * indexPath =[NSIndexPath indexPathForRow:1 inSection:0];
    DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:[self changeBlockForIndexPath:indexPath]];
    
    NSIndexPath * indexPath2 =[NSIndexPath indexPathForRow:2 inSection:0];
    DTDatePickerPresenter * presenter2 = [DTDatePickerPresenter presenterWithChangeBlock:[self changeBlockForIndexPath:indexPath2]];
    
    [self attachInlinePickerPresenter:presenter toIndexPath:indexPath];
    [self attachInlinePickerPresenter:presenter2 toIndexPath:indexPath2];
}

-(DTDatePickerChangeBlock)changeBlockForIndexPath:(NSIndexPath * )indexPath
{
    __weak typeof (self) weakSelf = self;
    return ^(NSDate * selectedDate)
    {
        [weakSelf updateDateCellWithDate:selectedDate
                              aIndexPath:indexPath];
    };
}

-(void)updateDateCellWithDate:(NSDate *)date aIndexPath:(NSIndexPath * )indexPath
{
    DateModel * model = [self.memoryStorage objectAtIndexPath:indexPath];
    model.date = date;

    UITableViewCell<DTModelTransfer> * cell = (UITableViewCell <DTModelTransfer> *)[self.tableView cellForRowAtIndexPath:indexPath];
    [cell updateWithModel:model];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    /**
     It's important to call super after deselection, cause super call may cause picker cells to be deleted,
     thus changing indexPath of the cell, that needs to be deselected
     */
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (void)didShowPickerForIndexPath:(NSIndexPath *)indexPath
{
    ExampleCell * cell = (ExampleCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    cell.selected = YES;
}

- (void)didHidePickerForIndexPath:(NSIndexPath *)indexPath
{
    ExampleCell * cell = (ExampleCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
}

@end
