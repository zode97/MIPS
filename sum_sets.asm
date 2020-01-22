.data
	a1: .word  2, 5, 8, 11, 15, 19, 23, 27, 30, 33#array declaration
	a2: .word  45, 42, 38, 34, 29, 24, 18, 12, 5, 1#array declaration
	a3: .word  101, 110, 201, 210, 330, 333, 55, 65, 75, 85#array declaration
	i:   .word  10#number of elements
	sum: .space 4#reserve space for ans
.text
	lw  $t0, i# counter -> t0
	la  $t1, a1# address of the first element
	la  $t3, a2# address of the first element
	la  $t4, a3# address of the first element
	and $t2, $t2, $zero# ans -> t2 initialize to 0
	again:
		lw  $s0, 0($t1)# get an element of the array
		lw  $s1, 0($t3)# get an element of the array
		lw  $s2, 0($t4)# get an element of the array
		add $t2, $t2, $s0# ans = ans + a[]
		add $t2, $t2, $s1
		add $t2, $t2, $s2
		sub $t0, $t0, 1# decrement counter
		beqz $t0, exit# if counter=0 done
		add $t1, $t1, 4# else go to the next elementj again
		add $t3, $t3, 4# else go to the next elementj again
		add $t4, $t4, 4# else go to the next elementj again
		j again
	done:
		sw $t2, sum# store your result
	exit:
		
		li $v0,10
		syscall
