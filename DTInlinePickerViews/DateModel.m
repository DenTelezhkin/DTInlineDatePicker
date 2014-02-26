//
// Created by Denys Telezhkin on 26.02.14.
// Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DateModel.h"


@implementation DateModel
{

}

+ (instancetype)modelWithDate:(NSDate *)date
{
    DateModel * model = [self new];

    model.date = date;

    return model;
}

- (NSString *)description
{
    return [self.date description];
}

@end