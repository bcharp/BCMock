//
//  BCGlobalMock.m
//  BCMock
//
//  Created by boris charpentier on 25/08/11.
//  Copyright 2011 bcharp. All rights reserved.
//

#import "BCGlobalMock.h"


@implementation BCGlobalMock

static NSMutableDictionary *selectorsDico;

-(id)initWithClass:(Class)c{

    self = [super init];
    if (self) {
        if (selectorsDico == nil) {
            selectorsDico = [[NSMutableDictionary alloc] init];
        }
        proxy = c;
        mode = 0;
        
    }
    return self;
}

-(id)initWithObject:(id)obj{

    self = [super init];
    if (self) {
        
        if (selectorsDico == nil) {
            selectorsDico = [[NSMutableDictionary alloc] init];
        }
        object = [obj retain];
        mode = 1;
        
    }
    return self;
}

-(void)when:(SEL)origin jumpTo:(SEL)destination On:(id)obj{
    
    NSArray *array = [NSArray arrayWithObjects:NSStringFromSelector(destination),obj, nil];
    [selectorsDico setObject:array forKey:NSStringFromSelector(origin)];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel { 
    
    id obj;
    if (mode == 0) {
        obj = [[proxy alloc] init]; 
    }else if(mode == 1){
        obj = object;
    }
   
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
    
    id obj;
    if (mode == 0) {
        obj = [[proxy alloc] init]; 
    }else if(mode == 1){
        obj = object;
    }
    
    if ([[selectorsDico allKeys] containsObject:NSStringFromSelector([invocation selector])]) { 
        
        id other = [[selectorsDico objectForKey:NSStringFromSelector([invocation selector])] objectAtIndex:1];
        [other performSelector:NSSelectorFromString([[selectorsDico objectForKey:NSStringFromSelector([invocation selector])] objectAtIndex:0])];
        
    }else if([obj respondsToSelector:[invocation selector]]){
        
        [invocation invokeWithTarget:obj];
    }
    
}




@end
