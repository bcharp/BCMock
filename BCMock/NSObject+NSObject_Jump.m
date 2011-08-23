//
//  NSObject+NSObject_Jump.m
//  categorymock
//
//  Created by Boris Charpentier on 23/08/11.
//  Copyright (c) 2011 bcharp. All rights reserved.
//

#import "NSObject+NSObject_Jump.h"

@implementation Test (NSObject_Jump)


+(void)initialize{

    NSLog(@"init");
    selectorsDico = [[NSMutableDictionary alloc] init];

}


+(void)when:(SEL)origin jumpTo:(SEL)destination{
    NSLog(@"new");
    [selectorsDico setObject:NSStringFromSelector(destination) forKey:NSStringFromSelector(origin)];

}

+ (BOOL)resolveInstanceMethod:(SEL)name{
    NSLog(@"resolve");
    return NO;

}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel { 
    NSLog(@"hi");
    
    if ([[selectorsDico allKeys] containsObject:NSStringFromSelector(sel)]) 
        return [super methodSignatureForSelector:NSSelectorFromString([selectorsDico objectForKey:NSStringFromSelector(sel)])];  
    else
        return [super methodSignatureForSelector:sel];
    
    return nil;
}


-(void)forwardInvocation:(NSInvocation *)invocation{
    NSLog(@"forward");
    if ([[selectorsDico allKeys] containsObject:NSStringFromSelector([invocation selector])]) { 
       [self performSelector:NSSelectorFromString([selectorsDico objectForKey:NSStringFromSelector([invocation selector])])];
    }
    
    /*
    if (parameterCount == 1) { 
        id value; 
        [invocation getArgument:&value atIndex:2];
        id key = [NSString stringWithFormat:@"%@%@",  [[stringSelector substringWithRange:NSMakeRange(3, 1)] lowercaseString], [stringSelector substringWithRange:NSMakeRange(4, [stringSelector length]-5)]];   
        [self setValue:value forKey:key]; 
    }*/
    
    
}

@end
