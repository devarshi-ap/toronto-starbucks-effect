CREATE TABLE `starbucks_stores` (
  `ward_id` integer,
  `zip` integer
);

CREATE TABLE `wards` (
  `ward_id` integer PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `ward_dwellings` (
  `ward_id` integer PRIMARY KEY,
  `single_detached_house` integer,
  `semi_detached_house` integer,
  `row_house` integer,
  `apartment_or_flat_in_a_duplex` integer,
  `apartment_in_a_building_that_has_fewer_than_five_storeys` integer,
  `apartment_in_a_building_that_has_five_or_more_storeys` integer,
  `other_single_attached_house` integer
);

CREATE TABLE `ward_households` (
  `ward_id` integer PRIMARY KEY,
  `average_household_size` integer,
  `avg_total_household_income` integer,
  `median_total_household_Income` integer,
  `median_age` integer
);

CREATE TABLE `ward_education` (
  `ward_id` integer PRIMARY KEY,
  `no_education` integer,
  `high_school_level` integer,
  `postsecondary_level` integer,
  `bachelors` integer,
  `masters` integer,
  `doctorate` integer,
  `apprenticeship_or_trades_certificate_or_diploma` integer,
  `trades_certificate_or_diploma_other_than_certificate_of_apprenticeship_or_certificate_of_qualification` integer,
  `certificate_of_apprenticeship_or_certificate_of_qualification` integer,
  `college__cegep` integer,
  `university_below_bachelors_level` integer,
  `university_at_bachelor_level_or_above` integer,
  `university_above_bachelor_level` integer,
  `degree_in_medicine_dentistry_veterinary_medicine_or_optometry` integer
);

CREATE TABLE `ward_workforce` (
  `ward_id` integer PRIMARY KEY,
  `in_labour_force` integer,
  `employed` integer,
  `unemployed` integer,
  `unemployment_rate` integer,
  `not_in_labour_force` integer,
  `agriculture_forestry_fishing_and_hunting` integer,
  `mining_quarrying_and_oil_and_gas_extraction` integer,
  `utilities` integer,
  `construction` integer,
  `manufacturing` integer,
  `wholesale_trade` integer,
  `retail_trade` integer,
  `transportation_and_warehousing` integer,
  `info_and_cultural_industries` integer,
  `finance_and_insurance` integer,
  `real_estate_and_rental_and_leasing` integer,
  `professional_scientific_and_technical_services` integer,
  `management_of_companies_and_enterprises` integer,
  `administrative_and_support_waste_management_and_remediation_services` integer,
  `educational_services` integer,
  `health_care_and_social_assistance` integer,
  `arts_entertainment_and_recreation` integer,
  `accommodation_and_food_services` integer,
  `public_administration` integer,
  `other_services_except_public_administration` integer
);

ALTER TABLE `starbucks_stores` ADD FOREIGN KEY (`ward_id`) REFERENCES `wards` (`ward_id`);

ALTER TABLE `wards` ADD FOREIGN KEY (`ward_id`) REFERENCES `ward_dwellings` (`ward_id`);

ALTER TABLE `wards` ADD FOREIGN KEY (`ward_id`) REFERENCES `ward_households` (`ward_id`);

ALTER TABLE `wards` ADD FOREIGN KEY (`ward_id`) REFERENCES `ward_education` (`ward_id`);

ALTER TABLE `wards` ADD FOREIGN KEY (`ward_id`) REFERENCES `ward_workforce` (`ward_id`);
