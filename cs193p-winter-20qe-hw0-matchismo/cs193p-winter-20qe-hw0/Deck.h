//
//  Deck.h
//  cs193p-winter-20qe-hw0
//
//  Created by gongzhen on 1/17/15.
//  Copyright (c) 2015 gongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"


@interface Deck : NSObject

- (void) addCard : (Card* ) card atTop: (BOOL) atTop;

- (void) addCard : (Card* ) card;

- (Card*) drawRandomCard;

@end
