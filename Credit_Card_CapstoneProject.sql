# CREDIT CARD - CAPSTONE PROJECT

# Already imported credit_card database
USE credit_card;

# Looking at the credit_card_clean table
SELECT * FROM credit_card_clean;

########################################################################################################################################
# Task 1 : Group the customers based on their income type and find the average of their annual income.

SELECT Type_Income, AVG(Annual_Income) AS Avg_Annual_Income FROM credit_card_clean
GROUP BY Type_Income;

#########################################################################################################################################
# Task 2 : Find the female owners of cars and property.

SELECT Ind_Id, Car_Owner, Property_Owner, Gender FROM credit_card_clean
WHERE Gender = 'F'AND Car_Owner = 'Y' AND Property_Owner = 'Y';

##########################################################################################################################################
# Task 3 : Find the male customers who are staying with their families.

SELECT Ind_Id, Gender, Family_Members FROM credit_card_clean
WHERE Gender = 'M' AND Family_Members > 0;

##########################################################################################################################################
# Task 4 : Please list the top five people having the highest income.

SELECT Ind_Id, Annual_Income, Ranked_Row FROM
(SELECT *, RANK() OVER (ORDER BY Annual_Income DESC) AS Ranked_Row
FROM credit_card_clean) AS Ranked_Annual_Income
WHERE Ranked_Row <= 5;

#######################################################################################################################################
# Task 5 : How many married people are having bad credit?

SELECT COUNT(*) AS Married_Bad_Credits_Count FROM
(SELECT Ind_Id, Marital_Status, Label FROM credit_card_clean
WHERE Label = 1 AND Marital_Status = 'Married') AS Sub_Query_1;

########################################################################################################################################
# Task 6 : What is the highest education level and what is the total count?

# Finding all education levels
SELECT DISTINCT Education FROM credit_card_clean;

# Finding the highest education level
SELECT Ind_Id, Education FROM credit_card_clean
WHERE Education = 'Academic degree';

# The count of highest education level
SELECT COUNT(*) AS Highest_Education_Count FROM
(SELECT Ind_Id, Education FROM credit_card_clean
WHERE Education = 'Academic degree') AS Sub_Query_1;

#########################################################################################################################################
# Task 7 : Between married males and females, who is having more bad credit?

SELECT Gender, Marital_Status, Label, COUNT(Ind_Id) AS Gender_Count FROM credit_card_clean
WHERE Label = 1 AND Marital_Status = 'Married'
GROUP BY Gender;

##########################################################################################################################################