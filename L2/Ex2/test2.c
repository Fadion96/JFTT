#include "test/*asdf*/header.h"
#include <stdio.h>

int main(int argc, const char* argv)
{
    printf("/* foo bar");
    //*/ bar();

    // \
    /*
    baz();
    /*/
    foo();
    //*/

    return 1;
}
