-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for umkm
CREATE DATABASE IF NOT EXISTS `umkm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `umkm`;

-- Dumping structure for table umkm.detail_keranjang
CREATE TABLE IF NOT EXISTS `detail_keranjang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_keranjang` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_detail_keranjang_keranjang` (`id_keranjang`),
  KEY `FK_detail_keranjang_produk` (`id_produk`),
  CONSTRAINT `FK_detail_keranjang_keranjang` FOREIGN KEY (`id_keranjang`) REFERENCES `keranjang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_detail_keranjang_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table umkm.detail_keranjang: ~1 rows (approximately)
INSERT INTO `detail_keranjang` (`id`, `id_keranjang`, `id_produk`, `jumlah`, `harga_satuan`) VALUES
	(13, 17, 14, 2, 20000.00);

-- Dumping structure for table umkm.detail_pesanan
CREATE TABLE IF NOT EXISTS `detail_pesanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesanan` int(11) DEFAULT 0,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga_satuan` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_detail_pesanan_produk` (`id_produk`),
  KEY `FK_detail_pesanan_pesanan` (`id_pesanan`),
  CONSTRAINT `FK_detail_pesanan_pesanan` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_detail_pesanan_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table umkm.detail_pesanan: ~7 rows (approximately)
INSERT INTO `detail_pesanan` (`id`, `id_pesanan`, `id_produk`, `jumlah`, `harga_satuan`) VALUES
	(6, 11, 14, 4, 20000.00),
	(7, 11, 15, 4, 20000.00),
	(8, 12, 8, 1, 1000.00),
	(9, 12, 9, 20, 1000.00),
	(10, 12, 15, 4, 20000.00),
	(11, 13, 14, 5, 20000.00),
	(12, 14, 13, 5, 20000.00);

-- Dumping structure for table umkm.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table umkm.kategori: ~3 rows (approximately)
INSERT INTO `kategori` (`id`, `nama`, `deskripsi`) VALUES
	(3, 'Makanan', 'x'),
	(5, 'Minuman', '-'),
	(6, 'Snack', '-');

-- Dumping structure for table umkm.keranjang
CREATE TABLE IF NOT EXISTS `keranjang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_keranjang_pelanggan` (`id_pelanggan`),
  CONSTRAINT `FK_keranjang_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table umkm.keranjang: ~1 rows (approximately)
INSERT INTO `keranjang` (`id`, `id_pelanggan`) VALUES
	(17, 2);

-- Dumping structure for table umkm.pelanggan
CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `telp` varchar(24) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table umkm.pelanggan: ~5 rows (approximately)
INSERT INTO `pelanggan` (`id`, `nama`, `telp`, `alamat`) VALUES
	(1, 'Test', '081010101', 'z'),
	(2, 'Ridho Akbar', '081351941946', 'Sungai Andai'),
	(3, 'testtest', '081010101', '123134'),
	(4, 'test2', '0810101010', '-'),
	(5, 'test3', '01283018410', '-');

-- Dumping structure for table umkm.pengguna
CREATE TABLE IF NOT EXISTS `pengguna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pengguna_pelanggan` (`id_pelanggan`),
  CONSTRAINT `FK_pengguna_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table umkm.pengguna: ~6 rows (approximately)
INSERT INTO `pengguna` (`id`, `username`, `password`, `email`, `id_pelanggan`) VALUES
	(3, 'admin', '$2y$10$NreLaDwTMJlnfNXs8zzc1OvkCzyFA0Ybr8vpFGBWoUstomqCoPO5S', 'admin@mail.com', NULL),
	(4, 'jhony', '$2y$10$3A1F/eSexXTIrhEiQ1dER.e4NaCdPJ9o7uUQhKus.JgJOdy6GiNtW', 'jhon@smith.com', 1),
	(5, 'test', '$2y$10$z0ZJ68fbOPa9hN707/oVNeqD3tikTzxrEqfEG7go3cG6uRpBSnNWi', 'test@mail.com', 2),
	(6, 'siswa', '$2y$10$dmMand11bK.WS1G0nfzPPuBsKYDHbCl.rmdU5FbzaxSwGvjs8jTkq', 'siswa@mail.com', 3),
	(7, 'test2', '$2y$10$l6RsbJo6GP.nbaTfuvMR3OEAvBqS0ntnAWVlwaCVZt6MYXJ3z894a', 'test2@mail.com', NULL),
	(8, 'test3', '$2y$10$AP24o6ohSucUqFqvu8ru3.KCrjRp1ZWEpwvt7FEaTLA6HYZOOmM7q', 'test3@mail.com', 5);

-- Dumping structure for table umkm.pesanan
CREATE TABLE IF NOT EXISTS `pesanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NOT NULL,
  `tgl_pesanan` date NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__keranjang` (`id_pelanggan`) USING BTREE,
  CONSTRAINT `FK_pesanan_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table umkm.pesanan: ~5 rows (approximately)
INSERT INTO `pesanan` (`id`, `id_pelanggan`, `tgl_pesanan`, `status`) VALUES
	(11, 3, '2024-12-14', 'Pembayaran Diterima'),
	(12, 2, '2024-12-14', 'Menunggu konfirmasi'),
	(13, 2, '2024-12-14', 'Menunggu konfirmasi'),
	(14, 2, '2024-12-14', 'Menunggu konfirmasi'),
	(16, 2, '2024-12-14', 'Menunggu konfirmasi');

-- Dumping structure for table umkm.produk
CREATE TABLE IF NOT EXISTS `produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL DEFAULT '',
  `harga` double(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL,
  `deskripsi` varchar(50) NOT NULL DEFAULT '',
  `photo` mediumtext NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_produk_kategori` (`kategori_id`),
  CONSTRAINT `FK_produk_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table umkm.produk: ~7 rows (approximately)
INSERT INTO `produk` (`id`, `nama`, `harga`, `stock`, `deskripsi`, `photo`, `kategori_id`) VALUES
	(7, 'Sosis Bakar', 20000.00, 100, 'Rasa Jagung Manis', './assets/images/produk/1733932387Sosis_Bakar.jpg', 5),
	(8, 'Test', 1000.00, 100, '-', './assets/images/produk/1733932401Test.jpg', 3),
	(9, 'Test', 1000.00, 100, '-', './assets/images/produk/1733370679Test.png', 3),
	(12, 'Sosis Bakar', 20000.00, 100, 'Rasa Jagung Manis', './assets/images/produk/1733932387Sosis_Bakar.jpg', 5),
	(13, 'Sosis Bakar', 20000.00, 100, 'Rasa Jagung Manis', './assets/images/produk/1733932387Sosis_Bakar.jpg', 5),
	(14, 'Sosis Bakar', 20000.00, 100, 'Rasa Jagung Manis', './assets/images/produk/1733932387Sosis_Bakar.jpg', 5),
	(15, 'Sosis Bakar', 20000.00, 100, 'Rasa Jagung Manis', './assets/images/produk/1733932387Sosis_Bakar.jpg', 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
