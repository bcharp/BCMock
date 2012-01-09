//
//  BCGlobalMock.h
//  BCMock
//
//  Created by boris charpentier on 25/08/11.
//  Copyright 2011 bcharp. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BCGlobalMock : NSObject {
    
    id object;
    Class proxy;
    int mode;
    
}


-(id)initWithClass:(Class)c;
-(id)initWithObject:(id)obj;
-(void)when:(SEL)origin jumpTo:(SEL)destination On:(id)obj;

@end
