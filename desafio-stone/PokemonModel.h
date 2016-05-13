//
//  PokemonModel.h
//  desafio-stone
//
//  Created by Lucas M Soares on 08/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PokemonModel : NSObject

@property int pokemon_id;
@property NSString *name;
@property NSString *detail;
@property NSArray *types;
@property NSArray *weakness;
@property NSString *imageURL;
@property double price;

- (id)init:(NSDictionary *)pokemon;

@end
