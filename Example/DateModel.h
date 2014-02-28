//
// Created by Denys Telezhkin on 26.02.14.
// Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DateModel : NSObject

@property (nonatomic, strong) NSDate * date;

+(instancetype)modelWithDate:(NSDate * )date;

@end