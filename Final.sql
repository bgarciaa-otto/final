--1. Value (1.75)

--You are given an array of n integers, array = [ar[0],ar[1],ar[2],...,ar[n-1]], and a positive integer, k. 
--Find and print the number of (i,j) pairs where i < j and ar[i] + ar[j] is divisible by k.

--For example, array = [1,2,3,4,5,6] and k = 5. Our three pairs meeting the criteria are [1,4], [2,3] and [4,6].

--Function description

--Execute this:

CREATE TYPE number_array AS VARRAY(100) OF INTEGER;

declare
   array number_array := number_array(1,2,3,4,5,6);
   k integer := 5;
begin
    for i in 1..array.count loop
        for j in 1..array.count loop
            if ((i < j) and (MOD(array(i) + array(j), k) = 0)) then
                dbms_output.put_line('['||array(i)||','||array(j)||']');
            end if;
        end loop;
    end loop;
end;

--You will write a function called "divisible_sum_pairs", it should return the integer count of pairs meeting the criteria. The parameters are:

--* 1 <= k <= 100
--* 1 <= ar[i] <= 100

--You should raise exceptions if:

--* The length of the array doesn't meet the criteria 1 <= ar[i] <= 100
--* The value of k doesn't meet the criteria 1 <= k <= 100

--Output

--Print the number of (i,j) pairs where i < j and a[i] + a[j] is evenly divisible by k.

--Sample input
--k = 3
--array = [1 3 2 6 1 2]

--Sample output
--5

--Here are the valid 5 pairs when k = 3
--* (0,2) -> ar[0] + ar[2] -> 1 + 2 = 3
--* (0,5) -> ar[0] + ar[5] -> 1 + 2 = 3
--* (1,3) -> ar[1] + ar[3] -> 3 + 6 = 9
--* (2,4) -> ar[2] + ar[4] -> 2 + 1 = 3
--* (4,5) -> ar[4] + ar[5] -> 1 + 2 = 3

---__________________________________________________________________________

--2. Value (1.75)

--An integer d is a divisor of an integer n if the remainder of n / d = 0.

--Given an integer, for each digit that makes up the integer determine whether it is a divisor. Count the number of divisors occurring within the integer.

--Note: Each digit is considered to be unique, so each occurrence of the same digit should be counted (e.g. for n = 111, 1 is a divisor of 111 each time it occurs so the answer is 3).

--Function Description:

--Create a function called find_digits. It should return an integer representing the number of digits of d that are divisors of d. The parameters are:

--* n: an integer to analyze

--Examples

--Sample input n = 12. Sample output = 2
--Sample input n = 1012. Sample output = 3

--Explanation

--The number 12 is broken into two digits, 1 and 2. When 12 is divided by either of those two digits, the remainder is 0 so they are both divisors.

--The number 1012 is broken into four digits, 1, 0, 1, and 2. 1012 is evenly divisible by its digits 1, 1, and 2, but it is not divisible by 0 as division by zero is undefined

--3. Stored Procedure (0.5)

--create table digits (n integer, pairs integer);

--Insert some records in the table just for the first column.

--Create a stored procedure called "CALCULATE_FIND_DIGITS" which will open a cursor for all the records which are in the digits table, for each row you should call the function find_digits; you will update the column. "pairs" with the result of the function.