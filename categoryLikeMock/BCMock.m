//
//  BCMock.m
//  categoryLikeMock
//
//  Created by boris charpentier on 23/08/11.
//  Copyright 2011 bcharp. All rights reserved.
//

#import "BCMock.h"


@implementation BCMock

-(id)initWithClass:(Class)myClass{


    if ((self = [super init])) {
        selectorsDico = [[NSMutableDictionary alloc] init];
        proxy = myClass;
    }

    
    return self;



}

-(void)when:(SEL)origin jumpTo:(SEL)destination On:(id)obj{
    
    NSArray *array = [NSArray arrayWithObjects:NSStringFromSelector(destination),obj, nil];
    [selectorsDico setObject:array forKey:NSStringFromSelector(origin)];
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel { 
    
    id obj = [[proxy alloc] init];
    if ([[selectorsDico allKeys] containsObject:NSStringFromSelector(sel)]){
        id other = [[selectorsDico objectForKey:NSStringFromSelector(sel)] objectAtIndex:1];
        return [other methodSignatureForSelector:NSSelectorFromString([[selectorsDico objectForKey:NSStringFromSelector(sel)] objectAtIndex:0])];
    }
    else{
        return [obj methodSignatureForSelector:sel];
    }
    
    return nil;
}


-(void)forwardInvocation:(NSInvocation *)invocation{
    
    id obj = [[proxy alloc] init];
    if ([[selectorsDico allKeys] containsObject:NSStringFromSelector([invocation selector])]) { 
        id other = [[selectorsDico objectForKey:NSStringFromSelector([invocation selector])] objectAtIndex:1];
        [other performSelector:NSSelectorFromString([[selectorsDico objectForKey:NSStringFromSelector([invocation selector])] objectAtIndex:0])];
        
    }else if([obj respondsToSelector:[invocation selector]]){
        [obj performSelector:[invocation selector]];
    }
    
}



@end
