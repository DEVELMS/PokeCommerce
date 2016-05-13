//
//  PokemonModel.m
//  desafio-stone
//
//  Created by Lucas M Soares on 08/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import "PokemonModel.h"

@implementation PokemonModel

- (id)init {
    
    return self;
}

- (id)init:(NSDictionary *)pokemon {
    
    if ( self = [super init] ) {
     
        self.pokemon_id = [pokemon[@"id"] intValue];
        self.name = pokemon[@"name"];
        self.types = (NSArray *)pokemon[@"type"];
        self.weakness = (NSArray *)pokemon[@"weakness"];
        self.detail = pokemon[@"description"];
        self.price = [pokemon[@"price"] doubleValue];
        self.imageURL = pokemon[@"image"];
    }
    
    return self;
}

@end

