//
//  main.m
//  CGDisplayDetection
//
//  Created by Pete Shanahan on 29/08/2016.
//  Copyright © 2016 Pete Shanahan. All rights reserved.
//

#import <Foundation/Foundation.h>

boolean_t is_asleep() {
    boolean_t asleep = true;
    CGDirectDisplayID ids[20];
    uint32_t num_ids;
    if (kCGErrorSuccess != CGGetActiveDisplayList(20, ids, &num_ids)) {
        printf("Oops\n");
        return false;
    }
    for (int i = 0; i < num_ids; i++) {
        asleep &= CGDisplayIsAsleep(ids[i]);
    }
    return asleep;
}
int main(int argc, const char * argv[]) {
    boolean_t asleep = is_asleep();
    printf("%s\n", asleep ? "Asleep" : "Awake");
    return asleep ? 1 : 0;
}
