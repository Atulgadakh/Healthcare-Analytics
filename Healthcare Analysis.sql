                                Healthcare Analysis using SQL
select * from healthcare

SET SQL_SAFE_UPDATES = 0;

delete from healthcare
is null

DELETE FROM healthcare
WHERE "Age" is null or "Gender" is null or "Education Level" IS NULL;

Select * from healthcare

                               ** Demographic Analysis **
                                
Que : 

SELECT "Age",
    "Gender",
    "Ethnicity",
    "Marital Status",
    COUNT(*) AS PatientCount
from
    healthcare
group by
    "Age", "Gender", "Ethnicity", "Marital Status";
    
    
    
Que : what is the avarage age of patient

select avg(Age) from healthcare

Que : How meny patient fall in the each education level category
solution : 
  select count(Education_Level) from healthcare
  
                       ** Dignostic Analysis **
Que : How meny patient degnosed with OCD
Solution :
   select count(*) as OCD_patient
   from healthcare 

Que : What is the avarage duration of symtoms among the patient with OCD
solution:
  select AVG("Duration of Symptoms (months)") AS AverageDuration
from healthcare

Que : What are the most common previous diagnoses among patients
Solution : 
    select count(*),Previous_Diagnoses
    from healthcare
    group by Previous_Diagnoses
    order by count(*) desc
    limit 1
    
                 ** Family history and syntoms types **
                 
  Que : How meny patient have family history of OCD
  Solution :
     select Count(Family_History_of_OCD) 
     from healthcare
     where Family_History_of_OCD is not null
     
 Que : What are the most prevalent type of OCD
 solution : 
      select "Obsession Type",COUNT(*) AS ObsessionCount
    from healthcare
where "Obsession Type" IS NOT NULL
group by "Obsession Type"

                    ** combination Analysis **
                     
Que : is there any relation between education level and Y-BOCS Score
solution : 
     select
    "Education Level",
    AVG("Y-BOCS Score (Obsessions)") AS AvgObsession,
    AVG("Y-BOCS Score (Compulsions)") AS AvgCompulsion
from healthcare
WHERE
    "Education Level" IS NOT NULL
    AND "Y-BOCS Score (Obsessions)" IS NOT NULL
    AND "Y-BOCS Score (Compulsions)" IS NOT NULL
GROUP BY "Education Level";

Que : How does the duration of symtoms very accross different ethnicities
solution :
    SELECT
    "Ethnicity",
    AVG("Duration of Symptoms (months)") AS AvgDuration
from healthcare
WHERE
    "Duration of Symptoms (months)" IS NOT NULL
    AND "Ethnicity" IS NOT NULL
group by "Ethnicity";

               ** Genral insigths **
                
Que : what is the ovarall percentage of patient with OCD in the Dataset
solution:
   select
    (COUNT(CASE WHEN "OCD Diagnosis Date" IS NOT NULL THEN 1 END) / COUNT(*)) * 100 AS PercentageWithOCD
from healthcare;

Que : Are there any patterns or trends in the data that standout
solution : 
    select
    Age,
    COUNT(*) 
from healthcare
where Age IS NOT NULL
group by Age
order by Age;
   

