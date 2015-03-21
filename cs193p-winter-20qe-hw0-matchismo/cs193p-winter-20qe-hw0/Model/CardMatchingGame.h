//
//  CardMatchingGame.h
//  cs193p-winter-20qe-hw0
//
//  Created by gongzhen on 3/8/15.
//  Copyright (c) 2015 gongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype) initWithCardCount : (NSUInteger) count usingDeck : (Deck *) deck;

- (void) chooseCardAtIndex : (NSUInteger) index;
- (Card *) cardAtIndex : (NSUInteger) index;

// no one set the score so it is read only.
@property (nonatomic, readonly) NSInteger score;

@end
