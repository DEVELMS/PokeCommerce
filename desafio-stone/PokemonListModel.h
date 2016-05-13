//
//  PokemonListModel.h
//  desafio-stone
//
//  Created by Lucas M Soares on 08/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceProtocol.h"
#import "PokemonListProtocol.h"

@protocol PokemonListDelegate;

@interface PokemonListModel : NSObject <ServiceProtocolDelegate>

@property (nonatomic, weak) id<PokemonListDelegate> delegate;

- (void)getPokemons;

@end
