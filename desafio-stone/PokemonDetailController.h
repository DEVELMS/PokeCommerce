//
//  PokemonController.h
//  desafio-stone
//
//  Created by Lucas M Soares on 07/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PokemonModel.h"

@interface PokemonDetailController : UIViewController

@property PokemonModel *pokemon;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UITextView *detail;

- (IBAction)buyPokemon:(id)sender;

@end
