.data
	a:   .word  12,13,14,15,16,17,18,19,20,0#array declaration
	ans: .space 4 #reserve space for ans
.text
	la  $t0, a# address of the first element
	and $t1, $t1, $zero# ans -> t1 initialize to 0
	li $t3,0
	again:
		lw  $s0, 0($t0)# get an element of the array
		add $t1, $t1, $s0# ans = ans + a[]
		beqz $s0, exit# if element=0 done
		add $t0, $t0, 4# else go to the next element
		j again
	exit:
		sw $t1, ans# store your result
		li $v0,10
		syscall