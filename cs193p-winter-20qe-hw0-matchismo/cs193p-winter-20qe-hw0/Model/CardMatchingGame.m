//
//  CardMatchingGame.m
//  cs193p-winter-20qe-hw0
//
//  Created by gongzhen on 3/8/15.
//  Copyright (c) 2015 gongzhen. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

// rewrite the score property with readwrite which it is the default.
// we only use readwrite when we use readonly
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i ++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards[i] addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMached) {
        // get chosen
        if (card.isChosen) {
            // setter chosen
            card.chosen = NO;
        } else {
            // @todo match against another card
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMached) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }
                } else {
                    self.score -= MISMATCH_PENALTY;
                    otherCard.chosen = NO;
                }
                // Once find two cards match, we can break up from here.
                break;
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

-(Card *) cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
