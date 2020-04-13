#import "ArrayCalculator.h"


@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    // good luck
    
    NSMutableArray *mutArr = [self filterArr:[[NSMutableArray alloc] initWithArray:array]];
    
    long accum = 1;
    
    if (!mutArr.count) {
        return 0;
    }
    
    for (long i = 0; i < mutArr.count; i++) {
        
        long one = [mutArr[i] integerValue];
        
        if (numberOfItems >= mutArr.count) {
            accum *= one;
            
        } else {
            NSInteger stopper = 0;
            NSArray *arr = [[[mutArr sortedArrayUsingSelector:@selector(compare:)] reverseObjectEnumerator] allObjects];
            
            for (long i = 0, j = arr.count-1; i < arr.count;) {
                if (!(stopper < numberOfItems)) {
                    goto loop1;
                }
                long first = [arr[i] integerValue] * [arr[i+1] integerValue];
                long last = [arr[j] integerValue] * [arr[--j] integerValue];
                
                if (numberOfItems-stopper == 1) {
                    if ([arr[i] integerValue] > [arr[j] integerValue]) {
                        accum *= [arr[i] integerValue];
                        i++;
                    } else {
                        accum *= [arr[j] integerValue];
                        j--;
                    }
                    stopper++;
                } else {
                    if (first > last) {
                        accum *= first;
                        i+=2;
                    } else {
                        accum *= last;
                        j-=2;
                    }
                    stopper+=2;
                }
            }
            
            NSLog(@"");
        }
        
    }
    
loop1:
    
    return accum;
}

+ (NSMutableArray *)filterArr:(NSMutableArray *)arr {
    for (long i = 0; i < arr.count; i++) {
        if ([arr[i] isKindOfClass:NSString.self]) {
            [arr removeObjectAtIndex:i];
            --i;
        }
    }
    
    return arr;
}

@end
