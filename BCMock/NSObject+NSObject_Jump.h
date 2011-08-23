//
//  NSObject+NSObject_Jump.h
//  categorymock
//
//  Created by Boris Charpentier on 23/08/11.
//  Copyright (c) 2011 bcharp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"

static NSMutableDictionary * selectorsDico;

@interface Test (NSObject_Jump)

+(void)when:(SEL)origin jumpTo:(SEL)destination;

@end
