//
//  TRViewController.m
//  MyCardGame
//
//  Created by tarena on 14-4-1.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRCardMatchingGame.h"
#import "TRDeck.h"
#import "TRPlayingDeck.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (nonatomic) int score;

@property (nonatomic, strong)TRCardMatchingGame *game;
@property (nonatomic, strong)TRDeck *deck;
@end

@implementation TRViewController

- (void)setScore:(int)score
{
    _score = score;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.score];
}
- (TRDeck *)deck
{
    if(!_deck)_deck = [[TRPlayingDeck alloc]init];
    return _deck;
}
-(TRCardMatchingGame *)game
{
    if(!_game)_game = [[TRCardMatchingGame alloc]initWithCardCount:self.cardButtons.count usingDeck:self.deck];
    return _game;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)touchCardButton:(UIButton *)sender
{
    int chooseButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *button in self.cardButtons) {
        NSUInteger index = [self.cardButtons indexOfObject:button];
        TRCard *card = [self.game cardAtIndex:index];
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        button.enabled = !card.matched;
        self.score = self.game.score;
    }
}

- (NSString *)titleForCard:(TRCard *)card
{
   return card.chosen ? card.contents : @"";
}

- (UIImage *)imageForCard:(TRCard *)card
{
    if(card.chosen){
        return [UIImage imageNamed:@"cardfront.png"];
    }else{
        return [UIImage imageNamed:@"cardback.png"];
    }
}




@end
