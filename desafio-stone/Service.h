//
//  Service.h
//  desafio-stone
//
//  Created by Lucas M Soares on 08/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceProtocol.h"

@protocol ServiceProtocolDelegate;

@interface Service : NSObject

@property (nonatomic, weak) id<ServiceProtocolDelegate> delegate;

- (void)requestService:(requestType)type parameters:(NSDictionary *)parameters URL:(NSString *)url;

@end
