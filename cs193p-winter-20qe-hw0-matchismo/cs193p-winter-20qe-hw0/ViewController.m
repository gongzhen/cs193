//
//  ViewController.m
//  cs193p-winter-20qe-hw0
//
//  Created by gongzhen on 1/17/15.
//  Copyright (c) 2015 gongzhen. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

/* flipsLabel*/
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

/* flipCount */
@property (nonatomic) int flipCount;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButton;

@end

@implementation ViewController

-(CardMatchingGame *) game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButton count]
                                                  usingDeck: [self createDeck]];
    }
    return _game;
}


- ( Deck *) deck
{
    if (!_deck)
        _deck = [self createDeck];
        return _deck;
}

- ( Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.    
}

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"FLips : %d", self.flipCount];
    NSLog(@"Flips update to %d\n", self.flipCount);
}


- (IBAction) touchCardButton:(UIButton *)sender
{
    // UIImage *cardImage = [UIImage imageNamed:@"jj"];    
    // NSLog(@"sender currentTitle: %@\n", sender.currentTitle);
    
    // if( [sender.currentTitle length]) {
    //     [sender setBackgroundImage:[UIImage imageNamed:@"cardbacksmall"] forState:UIControlStateNormal];
    //     [sender setTitle:@"" forState:UIControlStateNormal];
    //     self.flipCount++;
    // } else {
    //     Card *card = [self.deck drawRandomCard];
    //     if (card) {
    //         [sender setBackgroundImage:[UIImage imageNamed:@"cardfrontsmall"] forState:UIControlStateNormal];
    //         [sender setTitle:card.contents forState:UIControlStateNormal];
    //         self.flipCount++;
    //     }
    // }

    // NSUInteger not int, it will lose integer precision.
    NSUInteger cardIndex = [self.cardButton indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardButton) {
        NSUInteger cardIndex = [self.cardButton indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMached;
    }
}

- (NSString *) titleForCard:(Card *) card
{
    return card.isChosen ? card.contents : @"";

}

-(UIImage *) backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
 