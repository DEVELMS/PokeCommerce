//
//  PokemonListCell.m
//  desafio-stone
//
//  Created by Lucas M Soares on 07/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import "PokemonListCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation PokemonListCell

- (void)awakeFromNib
{
    //Changes done directly here, we have an object
}

- (void)init:(PokemonModel *)pokemon {

    self.pokemon = pokemon;
    
    self.name.text = self.pokemon.name;
    self.price.text = [NSString stringWithFormat:@"R$ %.00lf,00",self.pokemon.price];
    
    [self.image sd_setImageWithURL:[NSURL URLWithString:_pokemon.imageURL] placeholderImage:[UIImage imageNamed:@"pokemon_img"]];
}

- (IBAction)buyPokemon:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(buyPokemon:)]) {
        
        [self.delegate buyPokemon:self.pokemon];
    }
}

- (IBAction)seePokemonDetails:(id)sender {

    if ([self.delegate respondsToSelector:@selector(seePokemonDetail:)]) {
        
        [self.delegate seePokemonDetail:self.pokemon];
    }
}

@end
