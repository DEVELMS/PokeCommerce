//
//  PokemonListModel.m
//  desafio-stone
//
//  Created by Lucas M Soares on 08/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import "PokemonListModel.h"
#import "Service.h"
#import "Constants.h"
#import "PokemonModel.h"

@implementation PokemonListModel {

    Service *service;
}

- (id)init {
    
    if ( self = [super init] ) {
        
        [self prepareModel];
    }
    return self;
}

- (void)prepareModel {
    
    service = [[Service alloc] init];
    service.delegate = self;
}

- (void)getPokemons {

    [service requestService:Get parameters:nil URL:pokemonListURL];
}

#pragma mark - ServiceProtocolDelegate methods

- (void)requestResponseComplete:(id)response_ {
    
    NSArray *response = [[NSArray alloc] initWithArray:(NSArray *)response_];
    NSMutableArray *pokemons = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < response.count; i++) {
        
        PokemonModel *pokemon = [[PokemonModel alloc] init:response[i]];
        
        [pokemons addObject:pokemon];
    }
    
    if ([self.delegate respondsToSelector:@selector(pokemonListResponse:)]) {
        
        [self.delegate pokemonListResponse:pokemons];
    }
}

- (void)requestResponseFail:(id)error {

    if ([self.delegate respondsToSelector:@selector(pokemonListResponseFail:)]) {
        
        [self.delegate pokemonListResponseFail:error];
    }
}

@end
