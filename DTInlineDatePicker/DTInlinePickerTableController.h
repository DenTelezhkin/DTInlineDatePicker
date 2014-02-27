//
//  DTInlinePickerTableController.h
//  DTInlinePickerViews
//
//  Created by Denys Telezhkin on 25.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTTableViewController.h"

/**
 DTInlinePickerTableController allows easily attach inline date picker behaviour to any UITableViewCell. It requires using DTTableViewManager and DTPickerPresenter libraries to work.
 */
@interface DTInlinePickerTableController : DTTableViewController

/**
 Attaching inline picker to indexPath. UIDatePicker cell(DTInlinePickerCell) will be inserted under this indexPath. Keep in mind, picker will not show until this indexPath get's selected by the user. Good place to call this method is viewDidLoad method.
 
 @param presenter date picker presenter object
 
 @param indexPath indexPath of the cell, that contains some date information.
 */
-(void)attachInlinePickerPresenter:(DTDatePickerPresenter *)presenter toIndexPath:(NSIndexPath *)indexPath;

/**
 Detach inline picker from indexPath. This method does not remove date picker cell, if it is presented.
 
 @param indexPath indexPath of cell, that no longer needs UIDatePicker
 */
-(void)detachInlinePickerPresenterFromIndexPath:(NSIndexPath * )indexPath;

/**
 Implement this method, if you want to be notified when date picker will be shown. Default implementation of this method does nothing.
 */
-(void)didShowPickerForIndexPath:(NSIndexPath * )indexPath;

/**
 Implement this method, if you want to be notified when date picker will be hidden. Default implementation of this method does nothing.
 */
-(void)didHidePickerForIndexPath:(NSIndexPath * )indexPath;

@end
