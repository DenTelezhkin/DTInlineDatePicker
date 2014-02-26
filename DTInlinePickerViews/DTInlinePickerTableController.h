//
//  DTInlinePickerTableController.h
//  DTInlinePickerViews
//
//  Created by Denys Telezhkin on 25.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTTableViewController.h"

@interface DTInlinePickerTableController : DTTableViewController

-(void)attachInlinePickerPresenter:(id)presenter toIndexPath:(NSIndexPath *)indexPath;

-(void)detachInlinePickerPresenterFromIndexPath:(NSIndexPath * )indexPath;

-(void)didShowPickerForIndexPath:(NSIndexPath * )indexPath;
-(void)didHidePickerForIndexPath:(NSIndexPath * )indexPath;

@end
