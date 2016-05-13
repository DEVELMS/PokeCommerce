//
//  PokemonListCell.h
//  desafio-stone
//
//  Created by Lucas M Soares on 07/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PokemonModel.h"
#import "PokemonListProtocol.h"

@protocol PokemonListActions;

@interface PokemonListCell : UITableViewCell

@property (nonatomic, weak) id<PokemonListActions> delegate;

@property PokemonModel *pokemon;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;

- (void)init:(PokemonModel *)pokemon;

- (IBAction)buyPokemon:(id)sender;
- (IBAction)seePokemonDetails:(id)sender;

@end