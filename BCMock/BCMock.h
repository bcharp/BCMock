//
//  BCMock.h
//  categoryLikeMock
//
//  Created by boris charpentier on 23/08/11.
//  Copyright 2011 bcharp. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BCMock : NSObject {
    
    NSMutableDictionary *selectorsDico;
    id object;
    Class proxy;
    int mode;
}


-(id)initWithClass:(Class)myClass;
-(id)initWithObject:(id)obj;
-(void)when:(SEL)origin jumpTo:(SEL)destination On:(id)obj;


@end
