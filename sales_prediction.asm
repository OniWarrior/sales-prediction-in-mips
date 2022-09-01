# Author      : Stephen Aranda
# File        : sales_prediction.asm
# Date        : 9/1/2022
# Description : Simple sales prediction app originally written in C ++ -- translated
#             : into MIPS.

               .data
welcome_txt:   .asciiz "***********Welcome to Sales prediction app*****************\n" # name directive    -- Print app name.
nl:            .asciiz "\n"                                                            # newline directive -- For printing newlines.
dep_name:      .asciiz "East Coast Sales Division sales prediction: "                  # name directive    -- Company division name.
               .text
               .globl main
main:
                jal print_title     # Make function call to print title on console. 
                j   app_end         # End the app
end_main:


# Function   : print_title
# Description: Prints the title of the application on to the console.

print_title:
               la $a0, welcome_txt   # Load base address for welcome text.
               li $v0, 4           
               syscall               # Print welcome text to console.
end_print_title:
               jr $ra                # Return 


app_end:       # End application  