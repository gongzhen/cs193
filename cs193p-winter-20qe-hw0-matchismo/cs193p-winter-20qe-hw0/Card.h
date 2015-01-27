//
//  Card.h
//  cs193p-winter-20qe-hw0
//
//  Created by gongzhen on 1/17/15.
//  Copyright (c) 2015 gongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;

@property (nonatomic, getter=isMached) BOOL matched;

- ( int ) match: (NSArray* ) otherCards;

@end
