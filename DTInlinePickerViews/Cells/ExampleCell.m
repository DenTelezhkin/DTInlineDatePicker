//
//  ExampleCell.m
//  DTInlinePickerViews
//
//  Created by Denys Telezhkin on 25.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "ExampleCell.h"

@implementation ExampleCell

- (void)updateWithModel:(id)model
{
    self.exampleLabel.text = [model description];
}

@end
