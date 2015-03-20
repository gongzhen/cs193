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

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

- (void) setRank:(NSUInteger)rank;

// Class method: PlayingCard validSuites
// public method
+ (NSArray *) validSuites;

+ (NSUInteger) maxRank;


@end
