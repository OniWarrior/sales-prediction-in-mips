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
                jal calculate_sales # Make function call to calculate and print total sales prediction.
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

# ------------------------------------------------------------------------------


# Function    : calculate_sales
# Description : Calculate the sales that the company will generate in the current year

calculate_sales:


               la $a0, nl                    # Load newline
               li $v0, 4
               syscall                       # Print newline.

               la $a0, dep_name              # Load dep name
               li $v0, 4
               syscall                       # Print dep name.


               li $f0, 0.62                  # Load 0.62 -- represents 62 percent -- into floating point register
               li $f1, 4600000               # Load 4.6 million into floating point register.
               mul.s $f0, $f1, $f0           # Multiply 4.6 mil by 62 percent

               move $f12, $f0                # Move total sales to $f12 to print.

               li $v0, 2
               syscall                       # Print sales prediction.

end_calculate_sales:


# ------------------------------------------------------------------------------
app_end:       # End application  