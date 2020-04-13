#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    // good luck
    
    if ([number integerValue] < 0) {
        return nil;
    }
    NSMutableArray *sepArr = [[NSMutableArray alloc] init];
    NSDictionary<NSString *, NSArray<NSString *> *> *myDict = @{@"1" : @[@"2", @"4"],
                                                                @"2" : @[@"1", @"5", @"3"],
                                                                @"3" : @[@"2", @"6"],
                                                                @"4" : @[@"1", @"5", @"7"],
                                                                @"5" : @[@"2", @"4", @"6", @"8"],
                                                                @"6" : @[@"3", @"5", @"9"],
                                                                @"7" : @[@"4", @"8"],
                                                                @"8" : @[@"0", @"5", @"7", @"9"],
                                                                @"9" : @[@"8", @"6"],
                                                                @"0" : @[@"8"] };
    
    [number enumerateSubstringsInRange:(NSRange){0, [number length]} options: NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        [sepArr addObject:substring];
    }];
    
    NSMutableArray<NSString *> *arrOfNumbers = [[NSMutableArray alloc] init];
    
    for (long i = 0; i < number.length; i++) {
        NSArray *arr = myDict[sepArr[i]];
        for (long j = 0; j < arr.count; j++) {
            NSMutableArray *copy = [NSMutableArray arrayWithArray:sepArr];
            copy[i] = arr[j];
            [arrOfNumbers addObject:[copy componentsJoinedByString:@""]];
        }
    }
    
    
    return arrOfNumbers;
}
@end
