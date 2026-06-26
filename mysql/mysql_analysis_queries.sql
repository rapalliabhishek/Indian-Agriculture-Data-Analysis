-- number of crops
select distinct crop from crop_data;
-- top 5 highest yeild recods by state
select state,`Yield (Quintal/ Hectare)`from crop_data order by `Yield (Quintal/ Hectare)` desc limit 5;
-- top 5 lowest yeild recods by state
select state,`Yield (Quintal/ Hectare)`from crop_data order by `Yield (Quintal/ Hectare)` asc limit 5;
-- Average Yield by Crop
select crop, round(avg(`Yield (Quintal/ Hectare)`),2) as average_yield from crop_data group by crop order by average_yield desc;
-- Average Yield by State
select state, round(avg(`Yield (Quintal/ Hectare)`),2) as average_yield from crop_data group by state order by average_yield desc;
-- most expensive crop by state
select state,crop as expensive_crop, `Total Cultivation Cost (Hectare)` 
from crop_data where(state,`Total Cultivation Cost (Hectare)`) 
in(select state,max(`Total Cultivation Cost (Hectare)`) as 
max_cost from crop_data group by state);
-- least  expensive crop by state
select state,crop as inexpensive_crop, `Total Cultivation Cost (Hectare)` 
from crop_data where(state,`Total Cultivation Cost (Hectare)`) 
in(select state,min(`Total Cultivation Cost (Hectare)`) as 
max_cost from crop_data group by state);
-- average totalcost by crop
select crop , round(avg(`Total Cultivation Cost (Hectare)`),2) as avg_total_cost from crop_data group by crop order by avg_total_cost desc;
-- top 10  higest extra cost by state and crop
select crop,state, `Extra Cultivation Cost(Hector)` from crop_data order by `Extra Cultivation Cost(Hector)` desc limit 10;
-- top 10  lowest extra cost by state and crop
select crop,state, `Extra Cultivation Cost(Hector)` from crop_data order by `Extra Cultivation Cost(Hector)` asc limit 10;
-- Average extra Cost by Crop
select crop, round(avg(`Extra Cultivation Cost(Hector)`),2) as extra_cost from crop_data group by crop order by extra_cost desc;
-- Top 10 Most yield Efficient Records
select state, crop,`Yield Efficiency` from crop_data order by `Yield Efficiency` desc limit 10;
-- Bottom 10 Least yield Efficient Records
select state, crop,`Yield Efficiency` from crop_data order by `Yield Efficiency` asc limit 10;
-- Average yield Efficiency by Crop
 select crop,  round(avg(`Yield Efficiency`),2) as avg_effiency from crop_data group by crop order by avg_effiency desc;
 -- average yield efficiency by state
 select state,  round(avg(`Yield Efficiency`),2) as avg_effiency from crop_data group by state order by avg_effiency desc;
 -- High Efficiency Records Only
 select state,crop,`Yield Efficiency` from crop_data where `Yield Efficiency Category` ="high" order by `Yield Efficiency` desc;
 -- low Efficiency Records Only
  select state,crop,`Yield Efficiency` from crop_data where `Yield Efficiency Category` ="low" order by `Yield Efficiency` asc;
  --  medium Efficiency Records Only
    select state,crop,`Yield Efficiency` from crop_data where `Yield Efficiency Category` ="medium" order by `Yield Efficiency` desc;
    -- andrapradesh records
    select * from crop_data where state="Andhra Pradesh";
    -- sum of total cultvation cost in andra pradesh including all crops
    select state, sum(`Total Cultivation Cost (Hectare)`) as total_cost from crop_data where state="Andhra Pradesh";
    -- extra cost crops in andra pradesh
    select crop as crops_from_andrapradesh, `Extra Cultivation Cost(Hector)` from crop_data where state="Andhra Pradesh" order by`Extra Cultivation Cost(Hector)` desc;
    