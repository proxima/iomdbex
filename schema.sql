-- MySQL dump 10.13  Distrib 8.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: iomdb_dev
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `hashed_password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_login_index` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alignment_levels`
--

DROP TABLE IF EXISTS `alignment_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alignment_levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alignment_levels_name_index` (`name`),
  UNIQUE KEY `alignment_levels_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `armor_class_levels`
--

DROP TABLE IF EXISTS `armor_class_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armor_class_levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `armor_class_levels_name_index` (`name`),
  UNIQUE KEY `armor_class_levels_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `damage_levels`
--

DROP TABLE IF EXISTS `damage_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damage_levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `damage_levels_name_index` (`name`),
  UNIQUE KEY `damage_levels_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `damage_types`
--

DROP TABLE IF EXISTS `damage_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damage_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `damage_types_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment_mob_strategies`
--

DROP TABLE IF EXISTS `equipment_mob_strategies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_mob_strategies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipment_monster_id` int DEFAULT NULL,
  `greater_tank_prot_id` int DEFAULT NULL,
  `lesser_tank_prot1_id` int DEFAULT NULL,
  `lesser_tank_prot2_id` int DEFAULT NULL,
  `greater_party_prot_id` int DEFAULT NULL,
  `lesser_party_prot1_id` int DEFAULT NULL,
  `lesser_party_prot2_id` int DEFAULT NULL,
  `additional_prot_info` text,
  `walkthrough` text,
  `quest_mob` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `fight_notes` text,
  PRIMARY KEY (`id`),
  KEY `equipment_mob_strategies_equipment_monster_id_fkey` (`equipment_monster_id`),
  CONSTRAINT `equipment_mob_strategies_equipment_monster_id_fkey` FOREIGN KEY (`equipment_monster_id`) REFERENCES `equipment_monsters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment_monsters`
--

DROP TABLE IF EXISTS `equipment_monsters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_monsters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipment_monsters_name_index` (`name`),
  KEY `index_equipment_monsters_on_id_and_name` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5902 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment_piece_list_entries`
--

DROP TABLE IF EXISTS `equipment_piece_list_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_piece_list_entries` (
  `equipment_piece_id` int DEFAULT NULL,
  `equipment_piece_list_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `dicer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_equipment_piece_list_entries_on_equipment_piece_list_id` (`equipment_piece_list_id`),
  KEY `equipment_piece_list_entries_equipment_piece_id_fkey` (`equipment_piece_id`),
  CONSTRAINT `equipment_piece_list_entries_equipment_piece_id_fkey` FOREIGN KEY (`equipment_piece_id`) REFERENCES `equipment_pieces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `equipment_piece_list_entries_equipment_piece_list_id_fkey` FOREIGN KEY (`equipment_piece_list_id`) REFERENCES `equipment_piece_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=276638 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment_piece_list_types`
--

DROP TABLE IF EXISTS `equipment_piece_list_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_piece_list_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipment_piece_list_types_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment_piece_lists`
--

DROP TABLE IF EXISTS `equipment_piece_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_piece_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `admin_user_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `equipment_piece_list_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1755 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment_pieces`
--

DROP TABLE IF EXISTS `equipment_pieces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_pieces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `equipment_monster_id` int DEFAULT NULL,
  `klass` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `special` varchar(255) DEFAULT NULL,
  `tp_value` int DEFAULT NULL,
  `rufrin_price` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_equipment_pieces_on_id_and_name` (`id`,`name`),
  KEY `equipment_pieces_equipment_monster_id_fkey` (`equipment_monster_id`),
  CONSTRAINT `equipment_pieces_equipment_monster_id_fkey` FOREIGN KEY (`equipment_monster_id`) REFERENCES `equipment_monsters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14739 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_types`
--

DROP TABLE IF EXISTS `guild_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guild_types_name_index` (`name`),
  UNIQUE KEY `guild_types_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guilds`
--

DROP TABLE IF EXISTS `guilds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guilds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `guild_type_id` int DEFAULT NULL,
  `location` text,
  `levels` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guilds_name_index` (`name`),
  KEY `index_guilds_on_id_and_name` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hunger_levels`
--

DROP TABLE IF EXISTS `hunger_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hunger_levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hunger_levels_name_index` (`name`),
  UNIQUE KEY `hunger_levels_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `races` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `strength` int DEFAULT NULL,
  `dexterity` int DEFAULT NULL,
  `constitution` int DEFAULT NULL,
  `intelligence` int DEFAULT NULL,
  `wisdom` int DEFAULT NULL,
  `stamina` int DEFAULT NULL,
  `charisma` int DEFAULT NULL,
  `hpregen` int DEFAULT NULL,
  `spregen` int DEFAULT NULL,
  `epregen` int DEFAULT NULL,
  `skill_max` int DEFAULT NULL,
  `spell_max` int DEFAULT NULL,
  `skill_rate` decimal(10,0) DEFAULT NULL,
  `spell_rate` decimal(10,0) DEFAULT NULL,
  `experience_rate` decimal(10,0) DEFAULT NULL,
  `need_dark_to_regen` tinyint(1) DEFAULT NULL,
  `need_light_to_regen` tinyint(1) DEFAULT NULL,
  `corpse_eating` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `average_height` int DEFAULT NULL,
  `average_weight` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `races_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resistance_affects`
--

DROP TABLE IF EXISTS `resistance_affects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resistance_affects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipment_piece_id` int DEFAULT NULL,
  `damage_type_id` int DEFAULT NULL,
  `value` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resistance_affects_equipment_piece_id_damage_type_id_index` (`equipment_piece_id`,`damage_type_id`),
  KEY `index_resistance_affects_on_id_and_equipment_piece_id` (`id`,`equipment_piece_id`),
  CONSTRAINT `resistance_affects_equipment_piece_id_fkey` FOREIGN KEY (`equipment_piece_id`) REFERENCES `equipment_pieces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations_elixir`
--

DROP TABLE IF EXISTS `schema_migrations_elixir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations_elixir` (
  `version` bigint NOT NULL,
  `inserted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill_affects`
--

DROP TABLE IF EXISTS `skill_affects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_affects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipment_piece_id` int DEFAULT NULL,
  `skill_id` int DEFAULT NULL,
  `value` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skill_affects_equipment_piece_id_skill_id_index` (`equipment_piece_id`,`skill_id`),
  KEY `index_skill_affects_on_id_and_equipment_piece_id` (`id`,`equipment_piece_id`),
  CONSTRAINT `skill_affects_equipment_piece_id_fkey` FOREIGN KEY (`equipment_piece_id`) REFERENCES `equipment_pieces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4223 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill_train_specs`
--

DROP TABLE IF EXISTS `skill_train_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_train_specs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `skill_id` int DEFAULT NULL,
  `guild_id` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `max` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1930 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `base_cost` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skills_name_index` (`name`),
  KEY `index_skills_on_id_and_name` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=789 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slot_affects`
--

DROP TABLE IF EXISTS `slot_affects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slot_affects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slot_id` int DEFAULT NULL,
  `equipment_piece_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slot_affects_equipment_piece_id_slot_id_index` (`equipment_piece_id`,`slot_id`),
  KEY `index_slot_affects_on_id_and_equipment_piece_id` (`id`,`equipment_piece_id`),
  CONSTRAINT `slot_affects_equipment_piece_id_fkey` FOREIGN KEY (`equipment_piece_id`) REFERENCES `equipment_pieces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14946 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slots`
--

DROP TABLE IF EXISTS `slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slots_name_index` (`name`),
  UNIQUE KEY `slots_abbreviation_index` (`abbreviation`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_affects`
--

DROP TABLE IF EXISTS `spell_affects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_affects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipment_piece_id` int DEFAULT NULL,
  `spell_id` int DEFAULT NULL,
  `value` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spell_affects_equipment_piece_id_spell_id_index` (`equipment_piece_id`,`spell_id`),
  KEY `index_spell_affects_on_id_and_equipment_piece_id` (`id`,`equipment_piece_id`),
  CONSTRAINT `spell_affects_equipment_piece_id_fkey` FOREIGN KEY (`equipment_piece_id`) REFERENCES `equipment_pieces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2504 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_train_specs`
--

DROP TABLE IF EXISTS `spell_train_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_train_specs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `spell_id` int DEFAULT NULL,
  `guild_id` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `max` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=666 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spells`
--

DROP TABLE IF EXISTS `spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spells` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `base_cost` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spells_name_index` (`name`),
  KEY `index_spells_on_id_and_name` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=591 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_affects`
--

DROP TABLE IF EXISTS `stat_affects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stat_affects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipment_piece_id` int DEFAULT NULL,
  `stat_id` int DEFAULT NULL,
  `value` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_affects_equipment_piece_id_stat_id_index` (`equipment_piece_id`,`stat_id`),
  KEY `index_stat_affects_on_id_and_equipment_piece_id` (`id`,`equipment_piece_id`),
  CONSTRAINT `stat_affects_equipment_piece_id_fkey` FOREIGN KEY (`equipment_piece_id`) REFERENCES `equipment_pieces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16503 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_levels`
--

DROP TABLE IF EXISTS `stat_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stat_levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_levels_name_index` (`name`),
  UNIQUE KEY `stat_levels_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stats_name_index` (`name`),
  UNIQUE KEY `stats_abbreviation_index` (`abbreviation`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weapon_damage_affects`
--

DROP TABLE IF EXISTS `weapon_damage_affects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapon_damage_affects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipment_piece_id` int DEFAULT NULL,
  `weapon_damage_level_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `damage_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wda_eqpid_wdlid_dt` (`equipment_piece_id`,`weapon_damage_level_id`,`damage_type_id`),
  CONSTRAINT `weapon_damage_affects_equipment_piece_id_fkey` FOREIGN KEY (`equipment_piece_id`) REFERENCES `equipment_pieces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weapon_damage_levels`
--

DROP TABLE IF EXISTS `weapon_damage_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapon_damage_levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `weapon_damage_levels_name_index` (`name`),
  UNIQUE KEY `weapon_damage_levels_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26  4:57:52
