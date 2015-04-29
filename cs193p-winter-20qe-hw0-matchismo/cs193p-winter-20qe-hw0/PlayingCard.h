//
//  PlayingCard.h
//  cs193p-winter-20qe-hw0
//
//  Created by gongzhen on 1/18/15.
//  Copyright (c) 2015 gongzhen. All rights reserved.
//

#import "Card.h"

// inherited from Card class
@interface PlayingCard : Card

/* Property */
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

// Class method: validSuites
// + is public method
+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
