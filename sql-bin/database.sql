-- ward : # starbucks stores

CREATE TABLE ward_starbucks AS
SELECT
	ward_id,
	COUNT(
		*) AS num_starbucks_stores
FROM
	starbucks_stores;
GROUP B
	ward_id;Y

-- # starbucks stores in wards 10-13

SELECT
	SUM(num_starbucks_stores)
FROM
	ward_starbucks
WHERE ward_id between 10 and 13

-- # starbucks stores in wards 10-13, plus outlier wards 3 and 8

SELECT
	SUM(num_starbucks_stores)
FROM
	ward_starbucks
WHERE
	ward_id in(3, 8, 10, 11, 12, 13);

-- created new column needing to be added to ward_education

UPDATE
	ward_education
SET
	ward_education. `bachelors and above` = (
		SELECT
			temp. `bachelors and above`
		FROM
			`temp`
		WHERE
			`temp`.id = ward_education.ward_id
		LIMIT 1)

-- show where each ward ranks after a 'order-by' on each column in ward_households

SELECT
	*
FROM (
	SELECT
		ward_id,
		
        -- 1.smallest...25.largest (ASC by default)
        rank() OVER (ORDER BY avg_household_size) AS avg_household_size_RANK,
		
        -- 1.highest...25.lowest (DESC)
        rank() OVER (ORDER BY avg_total_household_income DESC) AS avg_total_household_income_RANK,
		
        -- 1.highest...25.lowest (DESC)
        rank() OVER (ORDER BY median_total_household_Income DESC) AS median_total_household_income_RANK,
        
        -- 1. youngest...25.oldest (ASC by default)
		rank() OVER (ORDER BY median_age) AS median_age_RANK
	FROM
		ward_households) a
WHERE
	ward_id in(3, 8, 10, 11, 12, 13);

-- same as above, but for workforce table

CREATE TABLE ward_workforce_rank AS (
	SELECT
		*
	FROM (
		SELECT
			ward_id,
			rank() OVER (ORDER BY agriculture_forestry_fishing_and_hunting DESC) AS agriculture_forestry_fishing_and_hunting,
			rank() OVER (ORDER BY mining_quarrying_and_oil_and_gas_extraction DESC) AS mining_quarrying_and_oil_and_gas_extraction,
			rank() OVER (ORDER BY utilities DESC) AS utilities,
			rank() OVER (ORDER BY construction DESC) AS construction,
			rank() OVER (ORDER BY manufacturing DESC) AS manufacturing,
			rank() OVER (ORDER BY wholesale_trade DESC) AS wholesale_trade,
			rank() OVER (ORDER BY retail_trade DESC) AS retail_trade,
			rank() OVER (ORDER BY transportation_and_warehousing DESC) AS transportation_and_warehousing,
			rank() OVER (ORDER BY info_and_cultural_industries DESC) AS info_and_cultural_industries,
			rank() OVER (ORDER BY finance_and_insurance DESC) AS finance_and_insurance,
			rank() OVER (ORDER BY real_estate_and_rental_and_leasing DESC) AS real_estate_and_rental_and_leasing,
			rank() OVER (ORDER BY professional_scientific_and_technical_services DESC) AS professional_scientific_and_technical_services,
			rank() OVER (ORDER BY management_of_companies_and_enterprises DESC) AS management_of_companies_and_enterprises,
			rank() OVER (ORDER BY admin_and_support_waste_mgmt_services DESC) AS admin_and_support_waste_mgmt_services,
			rank() OVER (ORDER BY educational_services DESC) AS educational_services,
			rank() OVER (ORDER BY health_care_and_social_assistance DESC) AS health_care_and_social_assistance,
			rank() OVER (ORDER BY arts_entertainment_and_recreation DESC) AS arts_entertainment_and_recreation,
			rank() OVER (ORDER BY accommodation_and_food_services DESC) AS accommodation_and_food_services,
			rank() OVER (ORDER BY other_services_except_public_administration DESC) AS other_services_except_public_administration,
			rank() OVER (ORDER BY public_administration DESC) AS public_administration,
			rank() OVER (ORDER BY in_labour_force DESC) AS in_labour_force,
			rank() OVER (ORDER BY employed DESC) AS employed,
			rank() OVER (ORDER BY unemployed DESC) AS unemployed,
			rank() OVER (ORDER BY not_in_labour_force DESC) AS not_in_labour_force,
			rank() OVER (ORDER BY unemployment_rate DESC) AS unemployment_rate
		FROM
			ward_workforce) a
	WHERE
		ward_id in(3, 8, 10, 11, 12, 13)
);

-- same as above, but for ward dwellings

CREATE TABLE ward_dwellings_ranks AS (
	SELECT
		*
	FROM (
		SELECT
			ward_id,
			rank() OVER (ORDER BY single_detached_house DESC) AS single_detached_house_RANK,
			rank() OVER (ORDER BY semi_detached_house DESC) AS semi_detached_house_RANK,
			rank() OVER (ORDER BY row_house DESC) AS row_house_RANK,
			rank() OVER (ORDER BY apartment_or_flat_in_a_duplex DESC) AS apartment_or_flat_in_a_duplex_RANK,
			rank() OVER (ORDER BY apartment_in_a_building_that_has_fewer_than_five_storeys DESC) AS apartment_in_a_building_that_has_fewer_than_five_storeys_RANK,
			rank() OVER (ORDER BY apartment_in_a_building_that_has_five_or_more_storeys DESC) AS apartment_in_a_building_that_has_five_or_more_storeys_RANK,
			rank() OVER (ORDER BY other_single_attached_house DESC) AS other_single_attached_house_RANK
		FROM
			ward_dwellings) a
	WHERE
		ward_id in(3, 8, 10, 11, 12, 13)
);

-- same as above, but for ward education

CREATE TABLE ward_education_ranks AS (
	SELECT
		*
	FROM (
		SELECT
			ward_id,
			rank() OVER (ORDER BY no_certificate_diploma_degree DESC) AS no_certificate_diploma_degree,
			rank() OVER (ORDER BY high_school_level DESC) AS high_school_level,
			rank() OVER (ORDER BY postsecondary_level DESC) AS postsecondary_level,
			rank() OVER (ORDER BY apprenticeship_or_trades_certificate_or_college_diploma DESC) AS apprenticeship_or_trades_certificate_or_college_diploma,
			rank() OVER (ORDER BY bachelors DESC) AS bachelors,
			rank() OVER (ORDER BY degree_in_medicine_dentistry_veterinary_medicine_or_optometry DESC) AS degree_in_medicine_dentistry_veterinary_medicine_or_optometry,
			rank() OVER (ORDER BY masters DESC) AS masters,
			rank() OVER (ORDER BY doctorate DESC) AS doctorate,
			rank() OVER (ORDER BY bachelors_and_above DESC) AS bachelors_and_above
		FROM
			ward_education) a
	WHERE
		ward_id in(3, 8, 10, 11, 12, 13)
);