//
//  dk1.cpp
//  dk1
//
//  Created by Huion on 2020/12/18.
//

#include <os/log.h>

#include <DriverKit/IOUserServer.h>
#include <DriverKit/IOLib.h>

#include "dk1.h"

kern_return_t
IMPL(dk1, Start)
{
    kern_return_t ret;
    ret = Start(provider, SUPERDISPATCH);
    os_log(OS_LOG_DEFAULT, "Hello World");
    return ret;
}
