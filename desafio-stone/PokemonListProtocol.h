//
//  PokemonListProtocol.h
//  desafio-stone
//
//  Created by Lucas M Soares on 08/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PokemonModel.h"

@protocol PokemonListDelegate <NSObject>

- (void)pokemonListResponse:(id)response;
- (void)pokemonListResponseFail:(id)response;

@end

@protocol PokemonListActions <NSObject>

- (void)buyPokemon:(PokemonModel *)pokemon;
- (void)seePokemonDetail:(PokemonModel *)pokemon;

@end
