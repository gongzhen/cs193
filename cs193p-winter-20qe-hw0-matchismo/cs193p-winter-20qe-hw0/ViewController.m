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


// @todo: 
// flip cards task. the unmatched card needs to be flip back.
// score counting board shows the current score.
//
@interface ViewController ()

/* flipsLabel*/
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

/* flipCount */
@property (nonatomic) int flipCount;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;

/* scorelabel */
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

// Outlet collection for many buttons.
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation ViewController

- (CardMatchingGame *) game
{
    if (!_game) {
        /* - (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck */
        _game = [[CardMatchingGame alloc] initWithCardCount: [self.cardButtons count] usingDeck: [self createDeck]];
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
}

/* sender function build the connection between controller and button UI. */
- (IBAction) touchCardButton:(UIButton *)sender
{
    
    NSUInteger cardIndex = [self.cardButtons indexOfObject: sender];
    [self.game chooseCardAtIndex: cardIndex];
    [self updateUI];
}

- (void) updateUI 
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject: cardButton];
        Card *card = [self.game cardAtIndex: cardIndex];
        [cardButton setTitle: [self titleForCard:card]
                    forState: UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMached;
    }
    
    self.flipCount++;
    /* update the score board */
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    
}

- (NSString *) titleForCard: (Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *) backgroundImageForCard : (Card *) card
{
    // the name of image must be set up correctly, otherwrise the cards will not display.
    return [UIImage imageNamed:card.isChosen ? @"cardfrontsmall" : @"cardbacksmall"];
}
@end
 
