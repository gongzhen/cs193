//
//  PlayingCardDeck.m
//  cs193p-winter-20qe-hw0
//
//  Created by gongzhen on 1/18/15.
//  Copyright (c) 2015 gongzhen. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

// no public API. only overwrite THE METHOD that
// inherits indirectly from NSObject.
- (instancetype) init
{
    self = [super init];
    // test what object of self is.
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 0; rank < [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];            
            }
        }
    }
    
    // init alawys return itself.
    // return instancetype of itself.
    return self;
}

@end

