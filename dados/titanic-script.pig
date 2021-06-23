
dataset = LOAD '/trabalho/dados/titanic.csv' USING PigStorage(',') as (number:chararray,name:chararray,pclass:chararray,age:int,sex:chararray,survived:chararray,sexcode:chararray);

passengers = FOREACH dataset GENERATE pclass AS class, sex, (CASE WHEN survived == '1' THEN true WHEN survived == '0'THEN false END) AS survived;

/* 1. Quantidade total de passageiros */
total_passengers_g = GROUP passengers ALL;
total_passengers = FOREACH total_passengers_g GENERATE CONCAT('1. Total number of passengers = ', (chararray) COUNT(passengers));

/* 2. Quantidade de sobreviventes */
survivers = FILTER passengers BY survived == TRUE;
survivers_g = GROUP survivers ALL;
total_survivers = FOREACH survivers_g GENERATE CONCAT('2. Total survivers = ', (chararray) COUNT(survivers));

/* 3. Quantos homens sobreviveram */
male_survivers = FILTER survivers BY sex == 'male';
male_survivers_g = GROUP male_survivers ALL;
total_male_survivers = FOREACH male_survivers_g GENERATE CONCAT('3. Total male survivers = ', (chararray) COUNT(male_survivers));

/* 4. Quantas mulheres sobreviveram */
female_survivers = FILTER survivers BY sex == 'female';
female_survivers_g = GROUP female_survivers ALL;
total_female_survivers = FOREACH female_survivers_g GENERATE CONCAT('4. Total female survivers = ', (chararray) COUNT(female_survivers));

/* 5. Numero de sobreviventes por classe */
surviver_class = GROUP survivers BY class;
surviver_counts_by_class = FOREACH surviver_class GENERATE CONCAT('5. Total survivers for ',group,' = ',(chararray) COUNT(survivers));

/* Sump dos resultados */
results = UNION total_passengers, total_survivers, total_male_survivers, total_female_survivers, surviver_counts_by_class;
sorted_results = ORDER results BY $0;
DUMP sorted_results;
