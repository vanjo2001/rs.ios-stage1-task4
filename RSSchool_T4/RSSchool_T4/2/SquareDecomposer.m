#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber *> *)decomposeNumber:(NSNumber *)number {
    
    if ([number integerValue] < 3) {
        return nil;
    }
    
    NSInteger first = [number integerValue] - 1;
    NSMutableArray *finalArr = nil;
        
    finalArr = [self finalRes:[self intPow:[number integerValue] degree:2]
                              curr:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInteger:first], nil]];
    
    NSArray *sorted = [finalArr sortedArrayUsingSelector:@selector(compare:)];
    
    return sorted;
}

- (NSMutableArray *)finalRes:(NSInteger)target curr:(NSMutableArray *)curr {
    NSInteger sumOfel = [self computeValue: curr];
    
    if (sumOfel == target) {
        return curr;
    } else {
        
        NSMutableArray *newArr = nil;
        NSInteger nochValue = MIN([self intSquare:target-sumOfel], [curr.lastObject integerValue] - 1);
        
        while (nochValue > 0) {
            newArr = [curr mutableCopy];
            NSNumber *newVal = [[NSNumber alloc] initWithInteger:nochValue];
            
            [newArr addObject:newVal];
            newArr = [self finalRes:target curr:newArr];
            
            if (newArr != nil) {
                return newArr;
            }
            nochValue--;
        }
        return nil;
    }
}


- (NSInteger)computeValue:(NSMutableArray *)arr {
    NSInteger accum = 0;
    for (NSInteger i = 0; i < arr.count; i++) {
        accum += [self intPow:[arr[i] integerValue] degree:2];
    }
    return accum;
}


- (NSInteger)intPow:(NSInteger)num degree:(NSInteger)degree {
    return pow(num, degree);
}

- (NSInteger)intSquare:(NSInteger)num {
    return sqrt(num);
}

@end
