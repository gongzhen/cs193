//
//  Deck.m
//  cs193p-winter-20qe-hw0
//
//  Created by gongzhen on 1/17/15.
//  Copyright (c) 2015 gongzhen. All rights reserved.
//

#import "Deck.h"

@interface Deck()
// semi-private property cards known as an anonymous category or class extension.
// it is only visible within the scope of Deck.m.
@property (strong, nonatomic) NSMutableArray* cards;
@end

@implementation Deck

// NSMUtableArray* getCards() return _cards;
- (NSMutableArray* ) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    NSLog(@"_cards: %@\n", _cards);
    return _cards;
}

- (void) addCard:(Card *)card atTop:(BOOL)atTop
{
    if ( atTop ) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card ];
    }
    
}

- (void) addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

- (Card*) drawRandomCard
{
    
    Card* randomCard = nil;
    
    if ( [self.cards count]) {
        unsigned index = arc4random() % [self.cards count];        
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex: index];
    }
    
    return randomCard;
}


@end