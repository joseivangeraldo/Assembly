.global main

.text
main:
    // Write syscall: write(1, msg, 14)
    mov x0, #1          // fd = 1 (stdou>
    adr x1, msg         // loads the add>
    mov x2, #14         // count = 14 by>
    mov x8, #64         // syscall 64 is>
    svc #0              // trigger syste>

    // Return safely from main to exit
    mov x0, #0          // return status>
    ret

.data
msg:
    .ascii "Hello, World!\n"

