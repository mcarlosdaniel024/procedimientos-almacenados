-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-03-2025 a las 20:08:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospitaldb`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelarCita` (IN `p_id_cita` INT)   BEGIN
    DELETE FROM citas WHERE id_cita = p_id_cita;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCitasPaciente` (IN `p_id_paciente` INT, IN `p_fecha` DATE)   BEGIN
    SELECT * FROM citas
    WHERE id_paciente = p_id_paciente
    AND DATE(fecha_hora) = p_fecha;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarCita` (IN `p_id_paciente` INT, IN `p_id_medico` INT, IN `p_fecha_hora` DATETIME, IN `p_consultorio_id` INT)   BEGIN
    INSERT INTO citas (id_paciente, id_medico, fecha_hora, consultorio_id)
    VALUES (p_id_paciente, p_id_medico, p_fecha_hora, p_consultorio_id);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `consultorio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_paciente`, `id_medico`, `fecha_hora`, `consultorio_id`) VALUES
(1, 2, 2, '2025-02-20 20:54:08', 1),
(3, 4, 3, '2025-01-01 23:42:42', 1),
(4, 10, 6, '2025-02-26 10:50:09', 1),
(5, 8, 4, '2025-02-05 23:54:00', 1),
(6, 7, 7, '2025-03-30 23:57:12', 1),
(7, 3, 9, '2025-03-27 00:13:14', 8),
(8, 9, 3, '2025-03-27 00:13:14', 5),
(9, 1, 1, '2025-02-27 00:35:48', 3),
(10, 1, 1, '2025-02-27 00:35:48', 3),
(11, 1, 1, '2025-02-27 00:35:48', 3),
(12, 1, 1, '2025-02-27 00:35:48', 3),
(13, 1, 1, '2025-02-27 00:35:48', 3),
(14, 6, 1, '2025-06-19 21:20:01', 1),
(15, 7, 8, '2025-02-27 03:24:55', 6),
(16, 5, 10, '2025-02-27 03:24:55', 6),
(17, 12, 3, '2025-02-27 03:47:50', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `id_consultorio` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `piso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultorios`
--

INSERT INTO `consultorios` (`id_consultorio`, `numero`, `piso`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermeros`
--

CREATE TABLE `enfermeros` (
  `id_enfermero` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `enfermeros`
--

INSERT INTO `enfermeros` (`id_enfermero`, `nombre`, `apellido`, `telefono`) VALUES
(1, 'STIVEN', 'MOSQUERA', '6789'),
(2, 'PEDRO', 'MARTINEZ', '19837'),
(3, 'KEVIN', 'FATI', '82711'),
(4, 'OLIVER', 'GIROUD', '91723'),
(5, 'IVAN', 'PERISIC', '172134'),
(6, 'LEO', 'MESSI', '718334'),
(7, 'LUIS', 'DIAZ', '821628'),
(8, 'MOHAMED', 'SALAH', '91733'),
(9, 'ALEXIS ', 'MAC ALLISTER', '782183'),
(10, 'HARRY', 'MAGUIRE', '91723');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidad`, `nombre`) VALUES
(1, 'OPTOMETRA'),
(2, 'DERMATOLOGIA'),
(3, 'GINECOLOGIA'),
(4, 'ODONTOLOGIA'),
(5, 'OFTALMOLOGIA'),
(6, 'OTORRINOLARINGOLOGIA'),
(7, 'TRAUMATOLOGIA '),
(8, 'UROLOGIA'),
(9, 'ESTOMATOLOGIA'),
(10, 'ANGIOLOGIA'),
(11, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `id_factura` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `fecha_emision` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `detalle` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturacion`
--

INSERT INTO `facturacion` (`id_factura`, `id_paciente`, `fecha_emision`, `monto`, `detalle`) VALUES
(1, 1, '2025-02-26', 45000.00, NULL),
(2, 2, '2025-02-18', 85000.00, 'Consulta médica general: $50,000\r\nExamen de glucosa: $25,000\r\nMedicación (Acetaminofén): $10,000\r\nTotal: $85,000\r\n'),
(3, 3, '2025-02-21', 670000.00, 'Consulta médica de urgencias: $60,000\r\nRayos X de tórax: $90,000\r\nHospitalización (2 días en habitación compartida): $400,000\r\nTratamiento antibiótico: $120,000\r\nTotal: $670,000'),
(4, 4, '2025-02-28', 5050000.00, 'Cirugía de apendicectomía: $3,500,000\r\nAnestesia general: $800,000\r\nHospitalización (3 días): $600,000\r\nMedicación postoperatoria: $150,000\r\nTotal: $5,050,000\r\n'),
(5, 5, '2025-02-11', 360000.00, 'Atención en urgencias: $70,000\r\nRadiografía de muñeca: $90,000\r\nInmovilización con yeso: $150,000\r\nMedicamentos para el dolor: $50,000\r\nTotal: $360,000'),
(6, 6, '2025-05-13', 3600000.00, 'Atención del parto: $2,500,000\r\nHospitalización (2 días en habitación privada): $800,000\r\nExámenes del recién nacido: $300,000\r\nTotal: $3,600,000'),
(7, 7, '2025-06-17', 240000.00, 'Consulta odontológica: $50,000\r\nExtracción de muela: $150,000\r\nMedicación (antibiótico y analgésico): $40,000\r\nTotal: $240,000\r\n'),
(8, 8, '2025-02-02', 560.00, 'Evaluación médica: $60,000\r\n10 sesiones de fisioterapia: $500,000\r\nTotal: $560,000'),
(9, 9, '2025-02-26', 220.00, 'Consulta médica: $50,000\r\nExámenes de sangre: $80,000\r\nMedicación (antibióticos y antigripales): $90,000\r\nTotal: $220,000'),
(10, 10, '2025-01-21', 300.00, 'Atención en urgencias: $100,000\r\nCuraciones y medicamentos: $200,000\r\nTotal: $300,000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historias_clinicas`
--

CREATE TABLE `historias_clinicas` (
  `id_historia` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `diagnostico` text DEFAULT NULL,
  `tratamiento` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historias_clinicas`
--

INSERT INTO `historias_clinicas` (`id_historia`, `id_paciente`, `fecha`, `diagnostico`, `tratamiento`) VALUES
(1, 1, '2025-02-14', 'Angina de pecho.', 'Aspirina, nitroglicerina sublingual, betabloqueadores y cambio en el estilo de vida (dieta y ejercicio).'),
(2, 2, '2025-02-14', 'Amigdalitis bacteriana.', 'Amoxicilina 500 mg cada 8 horas por 7 días, ibuprofeno para el dolor y reposo.'),
(3, 3, '2025-02-14', 'Diabetes mellitus tipo 2.', 'Metformina 850 mg al día, cambio en la alimentación y actividad física.'),
(4, 4, '2025-02-19', 'Crisis asmática.', 'Salbutamol inhalado cada 4 horas según necesidad, corticoides inhalados y control pediátrico.\r\n\r\n'),
(5, 5, '2025-02-21', 'Lumbalgia mecánica.', 'Reposo relativo, analgésicos (naproxeno), fisioterapia.'),
(6, 6, '2025-02-28', 'Artritis reumatoide.', 'AINEs, metotrexato, terapia física y seguimiento reumatológico.'),
(7, 7, '2025-02-28', 'Apendicitis aguda.', 'Cirugía de apendicectomía, antibióticos y analgesia postoperatoria.\r\n\r\n'),
(8, 8, '2025-03-11', 'Trastorno de ansiedad.', ' Terapia cognitivo-conductual, técnicas de relajación, y en casos severos, ansiolíticos bajo supervisión médica.\r\n\r\n'),
(9, 9, '2025-06-18', 'Crisis hipertensiva.', 'Administración de antihipertensivos de acción rápida y ajuste en la medicación de base.\r\n\r\n'),
(10, 10, '2025-02-19', 'Embarazo ectópico.', 'Cirugía laparoscópica y seguimiento ginecológico.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospitalizaciones`
--

CREATE TABLE `hospitalizaciones` (
  `id_hospitalizacion` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `fecha_egreso` datetime DEFAULT NULL,
  `habitacion` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hospitalizaciones`
--

INSERT INTO `hospitalizaciones` (`id_hospitalizacion`, `id_paciente`, `fecha_ingreso`, `fecha_egreso`, `habitacion`) VALUES
(1, 2, '2025-02-25 10:47:52', '2025-02-03 14:47:52', '15'),
(2, 9, '2025-02-27 04:08:24', '2025-03-13 22:08:24', '1'),
(3, 9, '2025-04-09 22:08:24', '2025-08-13 22:08:24', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_medicamento` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id_medicamento`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Acetaminofén', 'Analgésico y antipirético utilizado para aliviar dolores leves a moderados y reducir la fiebre.', 1000.00),
(2, 'Ibuprofeno', 'Antiinflamatorio no esteroideo (AINE) que se emplea para reducir la inflamación, aliviar el dolor y bajar la fiebre.\r\n\r\n', 5000.00),
(3, 'Amoxicilina', 'Antibiótico de amplio espectro utilizado en el tratamiento de diversas infecciones bacterianas.\r\n\r\n', 6000.00),
(4, 'Loratadina', 'Antihistamínico indicado para aliviar los síntomas de alergias, como estornudos, picazón y secreción nasal.', 2000.00),
(5, 'Omeprazol', 'Inhibidor de la bomba de protones que se utiliza para tratar problemas gástricos como el reflujo ácido y las úlceras estomacales.\r\n\r\n', 2500.00),
(6, 'Losartán', 'Antihipertensivo que ayuda a controlar la presión arterial alta y a proteger los riñones en pacientes con diabetes tipo 2.', 7000.00),
(7, 'Metformina', 'Medicamento oral que se utiliza para el control de la glucosa en pacientes con diabetes tipo 2.', 5500.00),
(8, 'Salbutamol', 'Broncodilatador empleado en el tratamiento del asma y otras afecciones respiratorias que causan broncoespasmo.', 3200.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_medico` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `especialidad_id` int(11) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_medico`, `nombre`, `apellido`, `especialidad_id`, `telefono`) VALUES
(1, 'Dana', 'Dunlap', 1, '12345'),
(2, 'Alejandra', 'Caicedo', 2, '54321'),
(3, 'JORGE', 'CAICEDO', 3, '9272'),
(4, 'VICTOR', 'HOYOS', 4, '81423'),
(5, 'LEIDI', 'GAMBOA', 5, '262421'),
(6, 'JHOANA', 'PALACIOS', 6, '87122'),
(7, 'YANETH', 'CASAS', 7, '765158'),
(8, 'ESTEBAN ', 'PALOMEQUE', 8, '461729'),
(9, 'PATRICIA', 'AGUILAR', 9, '8172532'),
(10, 'SOFIA', 'DUQUE', 10, '97731'),
(11, 'STEVEN', 'HARDER', 3, '7832789'),
(12, 'LUKA', 'BRONSON', 0, '91230');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` enum('Masculino','Femenino','Otro') NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `nombre`, `apellido`, `fecha_nacimiento`, `genero`, `telefono`, `direccion`) VALUES
(1, 'carlos', 'martinez', '2015-04-20', 'Masculino', '1234567890', 'Buenos Aires'),
(2, 'daniel', 'palacios', '2025-02-09', 'Masculino', '9876543210', 'Silencio'),
(3, 'YOSUAR', 'CORDOBA', '2015-02-01', 'Masculino', '73338', 'CASCORBA'),
(4, 'SOFIA', 'IBARGUEN', '2016-02-18', 'Femenino', '0338', 'JARDIN'),
(5, 'CAMILA', 'SANABRIA', '2017-02-13', 'Femenino', '8232', 'JARDIN'),
(6, 'MAICOL', 'PALACIOS', '2016-02-01', 'Masculino', '09382', 'MEDRANO'),
(7, 'DAVID', 'SALAZAR', '2016-02-21', 'Masculino', '198232', 'POBLADO'),
(8, 'LAURA', 'MOSQUERA', '2017-02-22', 'Femenino', NULL, 'CASCORBA'),
(9, 'JUAN', 'ASPRILLA', '2025-02-04', 'Masculino', '21422', 'ZONA MINERA'),
(10, 'MANUEL', 'RAMIREZ', '2025-02-17', 'Masculino', '8162178', 'LOS CASTILLOS'),
(11, 'RUEBN', 'DIAS', '2015-04-20', 'Masculino', '245234', 'CASA BLANCA'),
(12, 'MELISSA', 'MARTINEZ', '2025-02-25', 'Femenino', '37456', 'LOS CASTILLOS');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas` (
`id_cita` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_hora` datetime
,`consultorio_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_detalle`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_detalle` (
`id_cita` int(11)
,`paciente` varchar(100)
,`medico` varchar(100)
,`fecha_hora` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_dias_festivos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_dias_festivos` (
`id_cita` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_hora` datetime
,`consultorio_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_futuras`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_futuras` (
`id_cita` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_hora` datetime
,`consultorio_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_hoy`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_hoy` (
`id_cita` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_hora` datetime
,`consultorio_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_medicos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_medicos` (
`id_cita` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`especialidad` varchar(100)
,`fecha_hora` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_medico_por_dia`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_medico_por_dia` (
`id_medico` int(11)
,`dia_semana` varchar(9)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_pacientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_pacientes` (
`id_cita` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`fecha_hora` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_por_dia`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_por_dia` (
`fecha` date
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_por_dia_semana`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_por_dia_semana` (
`dia_semana` varchar(9)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_por_especialidad_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_por_especialidad_mes` (
`id_especialidad` int(11)
,`nombre` varchar(100)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_por_medico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_por_medico` (
`id_medico` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_por_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_por_mes` (
`mes` varchar(9)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_proximas_semana`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_proximas_semana` (
`id_cita` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_hora` datetime
,`consultorio_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_recientes_paciente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_recientes_paciente` (
`id_paciente` int(11)
,`nombre` varchar(100)
,`fecha_hora` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_ultimos_30_dias`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_ultimos_30_dias` (
`id_cita` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_hora` datetime
,`consultorio_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consultorios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consultorios` (
`id_consultorio` int(11)
,`numero` int(11)
,`piso` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consultorios_citas_hoy`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consultorios_citas_hoy` (
`consultorio_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consultorios_disponibles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consultorios_disponibles` (
`id_consultorio` int(11)
,`total_disponibles` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consultorios_disponibles_proxima_hora`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consultorios_disponibles_proxima_hora` (
`id_consultorio` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consultorios_mas_citas_semana`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consultorios_mas_citas_semana` (
`consultorio_id` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consultorios_mas_ocupados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consultorios_mas_ocupados` (
`consultorio_id` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consultorios_mas_usados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consultorios_mas_usados` (
`consultorio_id` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consultorios_mas_utilizados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consultorios_mas_utilizados` (
`consultorio_id` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consultorios_ocupados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consultorios_ocupados` (
`consultorio_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consultorios_sin_citas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consultorios_sin_citas` (
`id_consultorio` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_enfermeros`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_enfermeros` (
`id_enfermero` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`telefono` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_especialidades`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_especialidades` (
`id_especialidad` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_especialidades_mas_medicos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_especialidades_mas_medicos` (
`especialidad_id` int(11)
,`total_medicos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_especialidades_mayor_demanda`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_especialidades_mayor_demanda` (
`especialidad` varchar(100)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_especialidades_pocas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_especialidades_pocas` (
`id_especialidad` int(11)
,`nombre` varchar(100)
,`total_medicos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_especialidades_sin_citas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_especialidades_sin_citas` (
`id_especialidad` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_especialidad_mas_consultas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_especialidad_mas_consultas` (
`especialidad` varchar(100)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_estadisticas_generales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_estadisticas_generales` (
`total_pacientes` bigint(21)
,`total_medicos` bigint(21)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_evolucion_citas_anio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_evolucion_citas_anio` (
`mes` varchar(7)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_facturacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_facturacion` (
`id_factura` int(11)
,`id_paciente` int(11)
,`fecha_emision` date
,`monto` decimal(10,2)
,`detalle` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_facturacion_pacientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_facturacion_pacientes` (
`id_factura` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`fecha_emision` date
,`monto` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_historial_citas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_historial_citas` (
`id_cita` int(11)
,`nombre` varchar(100)
,`fecha_hora` datetime
,`medico` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_historiasclinicas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_historiasclinicas` (
`id_historia` int(11)
,`id_paciente` int(11)
,`fecha` date
,`diagnostico` text
,`tratamiento` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_horarios_baja_afluencia`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_horarios_baja_afluencia` (
`hora` int(2)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_horas_pico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_horas_pico` (
`hora` int(2)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_hospitalizaciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_hospitalizaciones` (
`id_hospitalizacion` int(11)
,`id_paciente` int(11)
,`fecha_ingreso` datetime
,`fecha_egreso` datetime
,`habitacion` varchar(10)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_hospitalizaciones_por_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_hospitalizaciones_por_mes` (
`mes` int(2)
,`total_hospitalizaciones` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicamentos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicamentos` (
`id_medicamento` int(11)
,`nombre` varchar(100)
,`descripcion` text
,`precio` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos` (
`id_medico` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`especialidad` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_citas_hoy`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_citas_hoy` (
`id_medico` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_citas_proximo_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_citas_proximo_mes` (
`id_medico` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_disponibles_hoy`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_disponibles_hoy` (
`id_medico` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_especialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_especialidad` (
`id_medico` int(11)
,`nombre` varchar(100)
,`especialidad` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_mas_citas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_mas_citas` (
`id_medico` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_mas_citas_anio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_mas_citas_anio` (
`id_medico` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_mas_citas_semana`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_mas_citas_semana` (
`id_medico` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_mas_citas_trimestre`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_mas_citas_trimestre` (
`id_medico` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_mas_pacientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_mas_pacientes` (
`id_medico` int(11)
,`nombre` varchar(100)
,`total_pacientes` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_multiconsultorio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_multiconsultorio` (
`id_medico` int(11)
,`total_consultorios` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_pacientes_menores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_pacientes_menores` (
`id_medico` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_pacientes_recurrentes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_pacientes_recurrentes` (
`id_medico` int(11)
,`id_paciente` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_pocas_citas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_pocas_citas` (
`id_medico` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_pocas_citas_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_pocas_citas_mes` (
`id_medico` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_sin_citas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_sin_citas` (
`id_medico` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_sin_citas_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_sin_citas_mes` (
`id_medico` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_sin_especialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_sin_especialidad` (
`id_medico` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_tarde`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_tarde` (
`id_medico` int(11)
,`citas_tarde` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicos_varios_consultorios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicos_varios_consultorios` (
`id_medico` int(11)
,`total_consultorios` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes` (
`id_paciente` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`fecha_nacimiento` date
,`genero` enum('Masculino','Femenino','Otro')
,`telefono` varchar(15)
,`direccion` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_citas_mismo_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_citas_mismo_mes` (
`id_paciente` int(11)
,`mes` varchar(7)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_citas_pendientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_citas_pendientes` (
`id_paciente` int(11)
,`nombre` varchar(100)
,`fecha_hora` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_citas_proximo_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_citas_proximo_mes` (
`id_paciente` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_citas_recurrentes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_citas_recurrentes` (
`id_paciente` int(11)
,`fecha` date
,`citas_en_dia` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_frecuentes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_frecuentes` (
`id_paciente` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_frecuentes_anio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_frecuentes_anio` (
`id_paciente` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_genero`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_genero` (
`genero` enum('Masculino','Femenino','Otro')
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_historias`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_historias` (
`id_paciente` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`fecha` date
,`diagnostico` text
,`tratamiento` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_mas_citas_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_mas_citas_mes` (
`id_paciente` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_mas_consultas_anio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_mas_consultas_anio` (
`id_paciente` int(11)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_mayores_60`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_mayores_60` (
`id_paciente` int(11)
,`nombre` varchar(100)
,`fecha_nacimiento` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_menores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_menores` (
`id_paciente` int(11)
,`nombre` varchar(100)
,`fecha_nacimiento` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_multiespecialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_multiespecialidad` (
`id_paciente` int(11)
,`total_especialidades` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_multihospitalizados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_multihospitalizados` (
`id_paciente` int(11)
,`total_hospitalizaciones` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_por_consultorio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_por_consultorio` (
`consultorio_id` int(11)
,`total_pacientes` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_por_especialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_por_especialidad` (
`especialidad` varchar(100)
,`total_pacientes` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_por_medico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_por_medico` (
`id_medico` int(11)
,`nombre` varchar(100)
,`total_pacientes` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_por_rango_edad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_por_rango_edad` (
`id_paciente` int(11)
,`nombre` varchar(100)
,`rango_edad` varchar(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_recurrentes_hospitalizados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_recurrentes_hospitalizados` (
`id_paciente` int(11)
,`total_hospitalizaciones` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_sin_citas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_sin_citas` (
`id_paciente` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_sin_citas_6m`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_sin_citas_6m` (
`id_paciente` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_sin_citas_anio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_sin_citas_anio` (
`id_paciente` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_sin_hospitalizaciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_sin_hospitalizaciones` (
`id_paciente` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_varios_consultorios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_varios_consultorios` (
`id_paciente` int(11)
,`total_consultorios` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pacientes_varios_medicos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pacientes_varios_medicos` (
`id_paciente` int(11)
,`total_medicos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_promedio_citas_consultorio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_promedio_citas_consultorio` (
`consultorio_id` int(11)
,`promedio_diario_citas` decimal(24,4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_promedio_citas_dia_semana`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_promedio_citas_dia_semana` (
`dia_semana` varchar(9)
,`promedio_diario` decimal(24,4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_promedio_citas_medico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_promedio_citas_medico` (
`id_medico` int(11)
,`promedio_citas` decimal(24,4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_promedio_citas_medico_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_promedio_citas_medico_mes` (
`id_medico` int(11)
,`promedio_citas_diarias` decimal(24,4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_promedio_edad_pacientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_promedio_edad_pacientes` (
`edad_promedio` decimal(24,4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_total_citas_especialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_total_citas_especialidad` (
`especialidad` varchar(100)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ultima_cita_paciente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ultima_cita_paciente` (
`id_paciente` int(11)
,`nombre` varchar(100)
,`ultima_cita` datetime
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas`
--
DROP TABLE IF EXISTS `vista_citas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas`  AS SELECT `citas`.`id_cita` AS `id_cita`, `citas`.`id_paciente` AS `id_paciente`, `citas`.`id_medico` AS `id_medico`, `citas`.`fecha_hora` AS `fecha_hora`, `citas`.`consultorio_id` AS `consultorio_id` FROM `citas` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_detalle`
--
DROP TABLE IF EXISTS `vista_citas_detalle`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_detalle`  AS SELECT `c`.`id_cita` AS `id_cita`, `p`.`nombre` AS `paciente`, `m`.`nombre` AS `medico`, `c`.`fecha_hora` AS `fecha_hora` FROM ((`citas` `c` join `pacientes` `p` on(`c`.`id_paciente` = `p`.`id_paciente`)) join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_dias_festivos`
--
DROP TABLE IF EXISTS `vista_citas_dias_festivos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_dias_festivos`  AS SELECT `citas`.`id_cita` AS `id_cita`, `citas`.`id_paciente` AS `id_paciente`, `citas`.`id_medico` AS `id_medico`, `citas`.`fecha_hora` AS `fecha_hora`, `citas`.`consultorio_id` AS `consultorio_id` FROM `citas` WHERE date_format(`citas`.`fecha_hora`,'%m-%d') in ('01-01','07-20','12-25') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_futuras`
--
DROP TABLE IF EXISTS `vista_citas_futuras`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_futuras`  AS SELECT `citas`.`id_cita` AS `id_cita`, `citas`.`id_paciente` AS `id_paciente`, `citas`.`id_medico` AS `id_medico`, `citas`.`fecha_hora` AS `fecha_hora`, `citas`.`consultorio_id` AS `consultorio_id` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() + interval 1 month ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_hoy`
--
DROP TABLE IF EXISTS `vista_citas_hoy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_hoy`  AS SELECT `citas`.`id_cita` AS `id_cita`, `citas`.`id_paciente` AS `id_paciente`, `citas`.`id_medico` AS `id_medico`, `citas`.`fecha_hora` AS `fecha_hora`, `citas`.`consultorio_id` AS `consultorio_id` FROM `citas` WHERE cast(`citas`.`fecha_hora` as date) = curdate() ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_medicos`
--
DROP TABLE IF EXISTS `vista_citas_medicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_medicos`  AS SELECT `c`.`id_cita` AS `id_cita`, `m`.`nombre` AS `nombre`, `m`.`apellido` AS `apellido`, `e`.`nombre` AS `especialidad`, `c`.`fecha_hora` AS `fecha_hora` FROM ((`citas` `c` join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) join `especialidades` `e` on(`m`.`especialidad_id` = `e`.`id_especialidad`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_medico_por_dia`
--
DROP TABLE IF EXISTS `vista_citas_medico_por_dia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_medico_por_dia`  AS SELECT `citas`.`id_medico` AS `id_medico`, dayname(`citas`.`fecha_hora`) AS `dia_semana`, count(0) AS `total_citas` FROM `citas` GROUP BY `citas`.`id_medico`, dayname(`citas`.`fecha_hora`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_pacientes`
--
DROP TABLE IF EXISTS `vista_citas_pacientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_pacientes`  AS SELECT `c`.`id_cita` AS `id_cita`, `p`.`nombre` AS `nombre`, `p`.`apellido` AS `apellido`, `c`.`fecha_hora` AS `fecha_hora` FROM (`citas` `c` join `pacientes` `p` on(`c`.`id_paciente` = `p`.`id_paciente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_por_dia`
--
DROP TABLE IF EXISTS `vista_citas_por_dia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_por_dia`  AS SELECT cast(`citas`.`fecha_hora` as date) AS `fecha`, count(0) AS `total_citas` FROM `citas` GROUP BY cast(`citas`.`fecha_hora` as date) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_por_dia_semana`
--
DROP TABLE IF EXISTS `vista_citas_por_dia_semana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_por_dia_semana`  AS SELECT dayname(`citas`.`fecha_hora`) AS `dia_semana`, count(0) AS `total_citas` FROM `citas` GROUP BY dayname(`citas`.`fecha_hora`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_por_especialidad_mes`
--
DROP TABLE IF EXISTS `vista_citas_por_especialidad_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_por_especialidad_mes`  AS SELECT `e`.`id_especialidad` AS `id_especialidad`, `e`.`nombre` AS `nombre`, count(0) AS `total_citas` FROM ((`citas` `c` join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) join `especialidades` `e` on(`m`.`especialidad_id` = `e`.`id_especialidad`)) WHERE `c`.`fecha_hora` >= current_timestamp() - interval 1 month GROUP BY `e`.`id_especialidad`, `e`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_por_medico`
--
DROP TABLE IF EXISTS `vista_citas_por_medico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_por_medico`  AS SELECT `citas`.`id_medico` AS `id_medico`, count(0) AS `total_citas` FROM `citas` GROUP BY `citas`.`id_medico` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_por_mes`
--
DROP TABLE IF EXISTS `vista_citas_por_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_por_mes`  AS SELECT monthname(`citas`.`fecha_hora`) AS `mes`, count(0) AS `total_citas` FROM `citas` GROUP BY month(`citas`.`fecha_hora`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_proximas_semana`
--
DROP TABLE IF EXISTS `vista_citas_proximas_semana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_proximas_semana`  AS SELECT `citas`.`id_cita` AS `id_cita`, `citas`.`id_paciente` AS `id_paciente`, `citas`.`id_medico` AS `id_medico`, `citas`.`fecha_hora` AS `fecha_hora`, `citas`.`consultorio_id` AS `consultorio_id` FROM `citas` WHERE `citas`.`fecha_hora` between current_timestamp() and current_timestamp() + interval 7 day ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_recientes_paciente`
--
DROP TABLE IF EXISTS `vista_citas_recientes_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_recientes_paciente`  AS SELECT `c`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre`, `c`.`fecha_hora` AS `fecha_hora` FROM (`citas` `c` join `pacientes` `p` on(`c`.`id_paciente` = `p`.`id_paciente`)) WHERE `c`.`fecha_hora` = (select max(`citas`.`fecha_hora`) from `citas` where `citas`.`id_paciente` = `c`.`id_paciente`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_ultimos_30_dias`
--
DROP TABLE IF EXISTS `vista_citas_ultimos_30_dias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_ultimos_30_dias`  AS SELECT `citas`.`id_cita` AS `id_cita`, `citas`.`id_paciente` AS `id_paciente`, `citas`.`id_medico` AS `id_medico`, `citas`.`fecha_hora` AS `fecha_hora`, `citas`.`consultorio_id` AS `consultorio_id` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 30 day ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consultorios`
--
DROP TABLE IF EXISTS `vista_consultorios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consultorios`  AS SELECT `consultorios`.`id_consultorio` AS `id_consultorio`, `consultorios`.`numero` AS `numero`, `consultorios`.`piso` AS `piso` FROM `consultorios` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consultorios_citas_hoy`
--
DROP TABLE IF EXISTS `vista_consultorios_citas_hoy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consultorios_citas_hoy`  AS SELECT DISTINCT `citas`.`consultorio_id` AS `consultorio_id` FROM `citas` WHERE cast(`citas`.`fecha_hora` as date) = curdate() ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consultorios_disponibles`
--
DROP TABLE IF EXISTS `vista_consultorios_disponibles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consultorios_disponibles`  AS SELECT `c`.`id_consultorio` AS `id_consultorio`, count(0) AS `total_disponibles` FROM (`consultorios` `c` left join `citas` `ci` on(`c`.`id_consultorio` = `ci`.`consultorio_id` and `ci`.`fecha_hora` >= current_timestamp())) WHERE `ci`.`id_cita` is null GROUP BY `c`.`id_consultorio` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consultorios_disponibles_proxima_hora`
--
DROP TABLE IF EXISTS `vista_consultorios_disponibles_proxima_hora`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consultorios_disponibles_proxima_hora`  AS SELECT `consultorios`.`id_consultorio` AS `id_consultorio` FROM `consultorios` WHERE !(`consultorios`.`id_consultorio` in (select `citas`.`consultorio_id` from `citas` where `citas`.`fecha_hora` between current_timestamp() and current_timestamp() + interval 1 hour)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consultorios_mas_citas_semana`
--
DROP TABLE IF EXISTS `vista_consultorios_mas_citas_semana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consultorios_mas_citas_semana`  AS SELECT `citas`.`consultorio_id` AS `consultorio_id`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 7 day GROUP BY `citas`.`consultorio_id` ORDER BY count(0) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consultorios_mas_ocupados`
--
DROP TABLE IF EXISTS `vista_consultorios_mas_ocupados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consultorios_mas_ocupados`  AS SELECT `citas`.`consultorio_id` AS `consultorio_id`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 1 month GROUP BY `citas`.`consultorio_id` ORDER BY count(0) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consultorios_mas_usados`
--
DROP TABLE IF EXISTS `vista_consultorios_mas_usados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consultorios_mas_usados`  AS SELECT `citas`.`consultorio_id` AS `consultorio_id`, count(0) AS `total_citas` FROM `citas` GROUP BY `citas`.`consultorio_id` ORDER BY count(0) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consultorios_mas_utilizados`
--
DROP TABLE IF EXISTS `vista_consultorios_mas_utilizados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consultorios_mas_utilizados`  AS SELECT `citas`.`consultorio_id` AS `consultorio_id`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 3 month GROUP BY `citas`.`consultorio_id` ORDER BY count(0) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consultorios_ocupados`
--
DROP TABLE IF EXISTS `vista_consultorios_ocupados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consultorios_ocupados`  AS SELECT DISTINCT `citas`.`consultorio_id` AS `consultorio_id` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consultorios_sin_citas`
--
DROP TABLE IF EXISTS `vista_consultorios_sin_citas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consultorios_sin_citas`  AS SELECT `c`.`id_consultorio` AS `id_consultorio` FROM (`consultorios` `c` left join `citas` `ci` on(`c`.`id_consultorio` = `ci`.`consultorio_id` and `ci`.`fecha_hora` >= current_timestamp() - interval 3 month)) WHERE `ci`.`id_cita` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_enfermeros`
--
DROP TABLE IF EXISTS `vista_enfermeros`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_enfermeros`  AS SELECT `enfermeros`.`id_enfermero` AS `id_enfermero`, `enfermeros`.`nombre` AS `nombre`, `enfermeros`.`apellido` AS `apellido`, `enfermeros`.`telefono` AS `telefono` FROM `enfermeros` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_especialidades`
--
DROP TABLE IF EXISTS `vista_especialidades`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_especialidades`  AS SELECT `especialidades`.`id_especialidad` AS `id_especialidad`, `especialidades`.`nombre` AS `nombre` FROM `especialidades` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_especialidades_mas_medicos`
--
DROP TABLE IF EXISTS `vista_especialidades_mas_medicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_especialidades_mas_medicos`  AS SELECT `medicos`.`especialidad_id` AS `especialidad_id`, count(0) AS `total_medicos` FROM `medicos` GROUP BY `medicos`.`especialidad_id` ORDER BY count(0) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_especialidades_mayor_demanda`
--
DROP TABLE IF EXISTS `vista_especialidades_mayor_demanda`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_especialidades_mayor_demanda`  AS SELECT `e`.`nombre` AS `especialidad`, count(0) AS `total_citas` FROM ((`citas` `c` join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) join `especialidades` `e` on(`m`.`especialidad_id` = `e`.`id_especialidad`)) GROUP BY `e`.`nombre` ORDER BY count(0) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_especialidades_pocas`
--
DROP TABLE IF EXISTS `vista_especialidades_pocas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_especialidades_pocas`  AS SELECT `e`.`id_especialidad` AS `id_especialidad`, `e`.`nombre` AS `nombre`, count(`m`.`id_medico`) AS `total_medicos` FROM (`especialidades` `e` left join `medicos` `m` on(`e`.`id_especialidad` = `m`.`especialidad_id`)) GROUP BY `e`.`id_especialidad` HAVING `total_medicos` < 5 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_especialidades_sin_citas`
--
DROP TABLE IF EXISTS `vista_especialidades_sin_citas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_especialidades_sin_citas`  AS SELECT `e`.`id_especialidad` AS `id_especialidad`, `e`.`nombre` AS `nombre` FROM ((`especialidades` `e` left join `medicos` `m` on(`e`.`id_especialidad` = `m`.`especialidad_id`)) left join `citas` `c` on(`m`.`id_medico` = `c`.`id_medico` and `c`.`fecha_hora` >= current_timestamp() - interval 1 month)) WHERE `c`.`id_cita` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_especialidad_mas_consultas`
--
DROP TABLE IF EXISTS `vista_especialidad_mas_consultas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_especialidad_mas_consultas`  AS SELECT `e`.`nombre` AS `especialidad`, count(0) AS `total_citas` FROM ((`citas` `c` join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) join `especialidades` `e` on(`m`.`especialidad_id` = `e`.`id_especialidad`)) WHERE `c`.`fecha_hora` >= current_timestamp() - interval 1 month GROUP BY `e`.`nombre` ORDER BY count(0) DESC LIMIT 0, 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_estadisticas_generales`
--
DROP TABLE IF EXISTS `vista_estadisticas_generales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_estadisticas_generales`  AS SELECT (select count(0) from `pacientes`) AS `total_pacientes`, (select count(0) from `medicos`) AS `total_medicos`, (select count(0) from `citas`) AS `total_citas` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_evolucion_citas_anio`
--
DROP TABLE IF EXISTS `vista_evolucion_citas_anio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_evolucion_citas_anio`  AS SELECT date_format(`citas`.`fecha_hora`,'%Y-%m') AS `mes`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 1 year GROUP BY date_format(`citas`.`fecha_hora`,'%Y-%m') ORDER BY date_format(`citas`.`fecha_hora`,'%Y-%m') ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_facturacion`
--
DROP TABLE IF EXISTS `vista_facturacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_facturacion`  AS SELECT `facturacion`.`id_factura` AS `id_factura`, `facturacion`.`id_paciente` AS `id_paciente`, `facturacion`.`fecha_emision` AS `fecha_emision`, `facturacion`.`monto` AS `monto`, `facturacion`.`detalle` AS `detalle` FROM `facturacion` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_facturacion_pacientes`
--
DROP TABLE IF EXISTS `vista_facturacion_pacientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_facturacion_pacientes`  AS SELECT `f`.`id_factura` AS `id_factura`, `p`.`nombre` AS `nombre`, `p`.`apellido` AS `apellido`, `f`.`fecha_emision` AS `fecha_emision`, `f`.`monto` AS `monto` FROM (`facturacion` `f` join `pacientes` `p` on(`f`.`id_paciente` = `p`.`id_paciente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_historial_citas`
--
DROP TABLE IF EXISTS `vista_historial_citas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_historial_citas`  AS SELECT `c`.`id_cita` AS `id_cita`, `p`.`nombre` AS `nombre`, `c`.`fecha_hora` AS `fecha_hora`, `m`.`nombre` AS `medico` FROM ((`citas` `c` join `pacientes` `p` on(`c`.`id_paciente` = `p`.`id_paciente`)) join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_historiasclinicas`
--
DROP TABLE IF EXISTS `vista_historiasclinicas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_historiasclinicas`  AS SELECT `historias_clinicas`.`id_historia` AS `id_historia`, `historias_clinicas`.`id_paciente` AS `id_paciente`, `historias_clinicas`.`fecha` AS `fecha`, `historias_clinicas`.`diagnostico` AS `diagnostico`, `historias_clinicas`.`tratamiento` AS `tratamiento` FROM `historias_clinicas` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_horarios_baja_afluencia`
--
DROP TABLE IF EXISTS `vista_horarios_baja_afluencia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_horarios_baja_afluencia`  AS SELECT hour(`citas`.`fecha_hora`) AS `hora`, count(0) AS `total_citas` FROM `citas` GROUP BY hour(`citas`.`fecha_hora`) ORDER BY count(0) ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_horas_pico`
--
DROP TABLE IF EXISTS `vista_horas_pico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_horas_pico`  AS SELECT hour(`citas`.`fecha_hora`) AS `hora`, count(0) AS `total_citas` FROM `citas` GROUP BY hour(`citas`.`fecha_hora`) ORDER BY count(0) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_hospitalizaciones`
--
DROP TABLE IF EXISTS `vista_hospitalizaciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_hospitalizaciones`  AS SELECT `hospitalizaciones`.`id_hospitalizacion` AS `id_hospitalizacion`, `hospitalizaciones`.`id_paciente` AS `id_paciente`, `hospitalizaciones`.`fecha_ingreso` AS `fecha_ingreso`, `hospitalizaciones`.`fecha_egreso` AS `fecha_egreso`, `hospitalizaciones`.`habitacion` AS `habitacion` FROM `hospitalizaciones` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_hospitalizaciones_por_mes`
--
DROP TABLE IF EXISTS `vista_hospitalizaciones_por_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_hospitalizaciones_por_mes`  AS SELECT month(`hospitalizaciones`.`fecha_ingreso`) AS `mes`, count(0) AS `total_hospitalizaciones` FROM `hospitalizaciones` WHERE `hospitalizaciones`.`fecha_ingreso` >= current_timestamp() - interval 1 year GROUP BY month(`hospitalizaciones`.`fecha_ingreso`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicamentos`
--
DROP TABLE IF EXISTS `vista_medicamentos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicamentos`  AS SELECT `medicamentos`.`id_medicamento` AS `id_medicamento`, `medicamentos`.`nombre` AS `nombre`, `medicamentos`.`descripcion` AS `descripcion`, `medicamentos`.`precio` AS `precio` FROM `medicamentos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos`
--
DROP TABLE IF EXISTS `vista_medicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos`  AS SELECT `m`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre`, `m`.`apellido` AS `apellido`, `e`.`nombre` AS `especialidad` FROM (`medicos` `m` join `especialidades` `e` on(`m`.`especialidad_id` = `e`.`id_especialidad`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_citas_hoy`
--
DROP TABLE IF EXISTS `vista_medicos_citas_hoy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_citas_hoy`  AS SELECT DISTINCT `m`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre` FROM (`medicos` `m` join `citas` `c` on(`m`.`id_medico` = `c`.`id_medico`)) WHERE cast(`c`.`fecha_hora` as date) = curdate() ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_citas_proximo_mes`
--
DROP TABLE IF EXISTS `vista_medicos_citas_proximo_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_citas_proximo_mes`  AS SELECT DISTINCT `m`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre` FROM (`medicos` `m` join `citas` `c` on(`m`.`id_medico` = `c`.`id_medico`)) WHERE `c`.`fecha_hora` >= current_timestamp() AND `c`.`fecha_hora` < current_timestamp() + interval 1 month ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_disponibles_hoy`
--
DROP TABLE IF EXISTS `vista_medicos_disponibles_hoy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_disponibles_hoy`  AS SELECT `m`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre` FROM `medicos` AS `m` WHERE !exists(select 1 from `citas` `c` where `c`.`id_medico` = `m`.`id_medico` AND cast(`c`.`fecha_hora` as date) = curdate() limit 1) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_especialidad`
--
DROP TABLE IF EXISTS `vista_medicos_especialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_especialidad`  AS SELECT `m`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre`, `e`.`nombre` AS `especialidad` FROM (`medicos` `m` join `especialidades` `e` on(`m`.`especialidad_id` = `e`.`id_especialidad`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_mas_citas`
--
DROP TABLE IF EXISTS `vista_medicos_mas_citas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_mas_citas`  AS SELECT `citas`.`id_medico` AS `id_medico`, count(0) AS `total_citas` FROM `citas` GROUP BY `citas`.`id_medico` HAVING `total_citas` > 10 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_mas_citas_anio`
--
DROP TABLE IF EXISTS `vista_medicos_mas_citas_anio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_mas_citas_anio`  AS SELECT `citas`.`id_medico` AS `id_medico`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 1 year GROUP BY `citas`.`id_medico` HAVING `total_citas` > 100 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_mas_citas_semana`
--
DROP TABLE IF EXISTS `vista_medicos_mas_citas_semana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_mas_citas_semana`  AS SELECT `citas`.`id_medico` AS `id_medico`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 7 day GROUP BY `citas`.`id_medico` HAVING `total_citas` > 10 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_mas_citas_trimestre`
--
DROP TABLE IF EXISTS `vista_medicos_mas_citas_trimestre`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_mas_citas_trimestre`  AS SELECT `citas`.`id_medico` AS `id_medico`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 3 month GROUP BY `citas`.`id_medico` HAVING `total_citas` > 50 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_mas_pacientes`
--
DROP TABLE IF EXISTS `vista_medicos_mas_pacientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_mas_pacientes`  AS SELECT `c`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre`, count(distinct `c`.`id_paciente`) AS `total_pacientes` FROM (`citas` `c` join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) GROUP BY `c`.`id_medico` ORDER BY count(distinct `c`.`id_paciente`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_multiconsultorio`
--
DROP TABLE IF EXISTS `vista_medicos_multiconsultorio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_multiconsultorio`  AS SELECT `citas`.`id_medico` AS `id_medico`, count(distinct `citas`.`consultorio_id`) AS `total_consultorios` FROM `citas` GROUP BY `citas`.`id_medico` HAVING `total_consultorios` > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_pacientes_menores`
--
DROP TABLE IF EXISTS `vista_medicos_pacientes_menores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_pacientes_menores`  AS SELECT DISTINCT `c`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre`, `m`.`apellido` AS `apellido` FROM ((`citas` `c` join `pacientes` `p` on(`c`.`id_paciente` = `p`.`id_paciente`)) join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) WHERE timestampdiff(YEAR,`p`.`fecha_nacimiento`,curdate()) < 18 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_pacientes_recurrentes`
--
DROP TABLE IF EXISTS `vista_medicos_pacientes_recurrentes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_pacientes_recurrentes`  AS SELECT `citas`.`id_medico` AS `id_medico`, `citas`.`id_paciente` AS `id_paciente`, count(0) AS `total_citas` FROM `citas` GROUP BY `citas`.`id_medico`, `citas`.`id_paciente` HAVING `total_citas` > 3 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_pocas_citas`
--
DROP TABLE IF EXISTS `vista_medicos_pocas_citas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_pocas_citas`  AS SELECT `citas`.`id_medico` AS `id_medico`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 1 month GROUP BY `citas`.`id_medico` HAVING `total_citas` < 5 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_pocas_citas_mes`
--
DROP TABLE IF EXISTS `vista_medicos_pocas_citas_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_pocas_citas_mes`  AS SELECT `citas`.`id_medico` AS `id_medico`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 1 month GROUP BY `citas`.`id_medico` HAVING `total_citas` < 5 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_sin_citas`
--
DROP TABLE IF EXISTS `vista_medicos_sin_citas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_sin_citas`  AS SELECT `m`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre` FROM (`medicos` `m` left join `citas` `c` on(`m`.`id_medico` = `c`.`id_medico` and `c`.`fecha_hora` >= current_timestamp() - interval 1 month)) WHERE `c`.`id_cita` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_sin_citas_mes`
--
DROP TABLE IF EXISTS `vista_medicos_sin_citas_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_sin_citas_mes`  AS SELECT `m`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre` FROM (`medicos` `m` left join `citas` `c` on(`m`.`id_medico` = `c`.`id_medico` and `c`.`fecha_hora` >= current_timestamp() - interval 1 month)) WHERE `c`.`id_cita` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_sin_especialidad`
--
DROP TABLE IF EXISTS `vista_medicos_sin_especialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_sin_especialidad`  AS SELECT `medicos`.`id_medico` AS `id_medico`, `medicos`.`nombre` AS `nombre`, `medicos`.`apellido` AS `apellido` FROM `medicos` WHERE `medicos`.`especialidad_id` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_tarde`
--
DROP TABLE IF EXISTS `vista_medicos_tarde`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_tarde`  AS SELECT `citas`.`id_medico` AS `id_medico`, count(0) AS `citas_tarde` FROM `citas` WHERE hour(`citas`.`fecha_hora`) between 12 and 18 GROUP BY `citas`.`id_medico` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicos_varios_consultorios`
--
DROP TABLE IF EXISTS `vista_medicos_varios_consultorios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicos_varios_consultorios`  AS SELECT `citas`.`id_medico` AS `id_medico`, count(distinct `citas`.`consultorio_id`) AS `total_consultorios` FROM `citas` GROUP BY `citas`.`id_medico` HAVING `total_consultorios` > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes`
--
DROP TABLE IF EXISTS `vista_pacientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre`, `pacientes`.`apellido` AS `apellido`, `pacientes`.`fecha_nacimiento` AS `fecha_nacimiento`, `pacientes`.`genero` AS `genero`, `pacientes`.`telefono` AS `telefono`, `pacientes`.`direccion` AS `direccion` FROM `pacientes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_citas_mismo_mes`
--
DROP TABLE IF EXISTS `vista_pacientes_citas_mismo_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_citas_mismo_mes`  AS SELECT `citas`.`id_paciente` AS `id_paciente`, date_format(`citas`.`fecha_hora`,'%Y-%m') AS `mes`, count(0) AS `total_citas` FROM `citas` GROUP BY `citas`.`id_paciente`, date_format(`citas`.`fecha_hora`,'%Y-%m') HAVING `total_citas` > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_citas_pendientes`
--
DROP TABLE IF EXISTS `vista_pacientes_citas_pendientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_citas_pendientes`  AS SELECT `p`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre`, `c`.`fecha_hora` AS `fecha_hora` FROM (`pacientes` `p` join `citas` `c` on(`p`.`id_paciente` = `c`.`id_paciente`)) WHERE `c`.`fecha_hora` >= current_timestamp() ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_citas_proximo_mes`
--
DROP TABLE IF EXISTS `vista_pacientes_citas_proximo_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_citas_proximo_mes`  AS SELECT DISTINCT `citas`.`id_paciente` AS `id_paciente` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() + interval 1 month ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_citas_recurrentes`
--
DROP TABLE IF EXISTS `vista_pacientes_citas_recurrentes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_citas_recurrentes`  AS SELECT `citas`.`id_paciente` AS `id_paciente`, cast(`citas`.`fecha_hora` as date) AS `fecha`, count(0) AS `citas_en_dia` FROM `citas` GROUP BY `citas`.`id_paciente`, cast(`citas`.`fecha_hora` as date) HAVING `citas_en_dia` > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_frecuentes`
--
DROP TABLE IF EXISTS `vista_pacientes_frecuentes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_frecuentes`  AS SELECT `citas`.`id_paciente` AS `id_paciente`, count(0) AS `total_citas` FROM `citas` GROUP BY `citas`.`id_paciente` HAVING `total_citas` > 5 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_frecuentes_anio`
--
DROP TABLE IF EXISTS `vista_pacientes_frecuentes_anio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_frecuentes_anio`  AS SELECT `citas`.`id_paciente` AS `id_paciente`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 1 year GROUP BY `citas`.`id_paciente` HAVING `total_citas` > 10 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_genero`
--
DROP TABLE IF EXISTS `vista_pacientes_genero`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_genero`  AS SELECT `pacientes`.`genero` AS `genero`, count(0) AS `total` FROM `pacientes` GROUP BY `pacientes`.`genero` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_historias`
--
DROP TABLE IF EXISTS `vista_pacientes_historias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_historias`  AS SELECT `p`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre`, `p`.`apellido` AS `apellido`, `h`.`fecha` AS `fecha`, `h`.`diagnostico` AS `diagnostico`, `h`.`tratamiento` AS `tratamiento` FROM (`pacientes` `p` join `historias_clinicas` `h` on(`p`.`id_paciente` = `h`.`id_paciente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_mas_citas_mes`
--
DROP TABLE IF EXISTS `vista_pacientes_mas_citas_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_mas_citas_mes`  AS SELECT `citas`.`id_paciente` AS `id_paciente`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 1 month GROUP BY `citas`.`id_paciente` ORDER BY count(0) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_mas_consultas_anio`
--
DROP TABLE IF EXISTS `vista_pacientes_mas_consultas_anio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_mas_consultas_anio`  AS SELECT `citas`.`id_paciente` AS `id_paciente`, count(0) AS `total_citas` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 1 year GROUP BY `citas`.`id_paciente` ORDER BY count(0) DESC LIMIT 0, 10 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_mayores_60`
--
DROP TABLE IF EXISTS `vista_pacientes_mayores_60`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_mayores_60`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre`, `pacientes`.`fecha_nacimiento` AS `fecha_nacimiento` FROM `pacientes` WHERE timestampdiff(YEAR,`pacientes`.`fecha_nacimiento`,curdate()) >= 60 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_menores`
--
DROP TABLE IF EXISTS `vista_pacientes_menores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_menores`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre`, `pacientes`.`fecha_nacimiento` AS `fecha_nacimiento` FROM `pacientes` WHERE timestampdiff(YEAR,`pacientes`.`fecha_nacimiento`,curdate()) < 18 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_multiespecialidad`
--
DROP TABLE IF EXISTS `vista_pacientes_multiespecialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_multiespecialidad`  AS SELECT `c`.`id_paciente` AS `id_paciente`, count(distinct `m`.`especialidad_id`) AS `total_especialidades` FROM (`citas` `c` join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) GROUP BY `c`.`id_paciente` HAVING `total_especialidades` > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_multihospitalizados`
--
DROP TABLE IF EXISTS `vista_pacientes_multihospitalizados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_multihospitalizados`  AS SELECT `hospitalizaciones`.`id_paciente` AS `id_paciente`, count(0) AS `total_hospitalizaciones` FROM `hospitalizaciones` GROUP BY `hospitalizaciones`.`id_paciente` HAVING `total_hospitalizaciones` > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_por_consultorio`
--
DROP TABLE IF EXISTS `vista_pacientes_por_consultorio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_por_consultorio`  AS SELECT `citas`.`consultorio_id` AS `consultorio_id`, count(distinct `citas`.`id_paciente`) AS `total_pacientes` FROM `citas` GROUP BY `citas`.`consultorio_id` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_por_especialidad`
--
DROP TABLE IF EXISTS `vista_pacientes_por_especialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_por_especialidad`  AS SELECT `e`.`nombre` AS `especialidad`, count(distinct `c`.`id_paciente`) AS `total_pacientes` FROM ((`citas` `c` join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) join `especialidades` `e` on(`m`.`especialidad_id` = `e`.`id_especialidad`)) GROUP BY `e`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_por_medico`
--
DROP TABLE IF EXISTS `vista_pacientes_por_medico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_por_medico`  AS SELECT `c`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre`, count(distinct `c`.`id_paciente`) AS `total_pacientes` FROM (`citas` `c` join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) GROUP BY `c`.`id_medico` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_por_rango_edad`
--
DROP TABLE IF EXISTS `vista_pacientes_por_rango_edad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_por_rango_edad`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre`, CASE WHEN timestampdiff(YEAR,`pacientes`.`fecha_nacimiento`,curdate()) < 18 THEN 'Menor de 18' WHEN timestampdiff(YEAR,`pacientes`.`fecha_nacimiento`,curdate()) between 18 and 35 THEN '18-35' WHEN timestampdiff(YEAR,`pacientes`.`fecha_nacimiento`,curdate()) between 36 and 60 THEN '36-60' ELSE 'Mayor de 60' END AS `rango_edad` FROM `pacientes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_recurrentes_hospitalizados`
--
DROP TABLE IF EXISTS `vista_pacientes_recurrentes_hospitalizados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_recurrentes_hospitalizados`  AS SELECT `hospitalizaciones`.`id_paciente` AS `id_paciente`, count(0) AS `total_hospitalizaciones` FROM `hospitalizaciones` GROUP BY `hospitalizaciones`.`id_paciente` HAVING `total_hospitalizaciones` > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_sin_citas`
--
DROP TABLE IF EXISTS `vista_pacientes_sin_citas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_sin_citas`  AS SELECT `p`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre` FROM (`pacientes` `p` left join `citas` `c` on(`p`.`id_paciente` = `c`.`id_paciente` and `c`.`fecha_hora` >= current_timestamp() - interval 1 year)) WHERE `c`.`id_cita` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_sin_citas_6m`
--
DROP TABLE IF EXISTS `vista_pacientes_sin_citas_6m`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_sin_citas_6m`  AS SELECT `p`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre` FROM (`pacientes` `p` left join `citas` `c` on(`p`.`id_paciente` = `c`.`id_paciente` and `c`.`fecha_hora` >= current_timestamp() - interval 6 month)) WHERE `c`.`id_cita` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_sin_citas_anio`
--
DROP TABLE IF EXISTS `vista_pacientes_sin_citas_anio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_sin_citas_anio`  AS SELECT `p`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre` FROM (`pacientes` `p` left join `citas` `c` on(`p`.`id_paciente` = `c`.`id_paciente` and `c`.`fecha_hora` >= current_timestamp() - interval 1 year)) WHERE `c`.`id_cita` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_sin_hospitalizaciones`
--
DROP TABLE IF EXISTS `vista_pacientes_sin_hospitalizaciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_sin_hospitalizaciones`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre` FROM `pacientes` WHERE !(`pacientes`.`id_paciente` in (select distinct `hospitalizaciones`.`id_paciente` from `hospitalizaciones`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_varios_consultorios`
--
DROP TABLE IF EXISTS `vista_pacientes_varios_consultorios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_varios_consultorios`  AS SELECT `citas`.`id_paciente` AS `id_paciente`, count(distinct `citas`.`consultorio_id`) AS `total_consultorios` FROM `citas` GROUP BY `citas`.`id_paciente` HAVING `total_consultorios` > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pacientes_varios_medicos`
--
DROP TABLE IF EXISTS `vista_pacientes_varios_medicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pacientes_varios_medicos`  AS SELECT `citas`.`id_paciente` AS `id_paciente`, count(distinct `citas`.`id_medico`) AS `total_medicos` FROM `citas` GROUP BY `citas`.`id_paciente` HAVING `total_medicos` > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_promedio_citas_consultorio`
--
DROP TABLE IF EXISTS `vista_promedio_citas_consultorio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_promedio_citas_consultorio`  AS SELECT `citas`.`consultorio_id` AS `consultorio_id`, count(0) / count(distinct cast(`citas`.`fecha_hora` as date)) AS `promedio_diario_citas` FROM `citas` GROUP BY `citas`.`consultorio_id` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_promedio_citas_dia_semana`
--
DROP TABLE IF EXISTS `vista_promedio_citas_dia_semana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_promedio_citas_dia_semana`  AS SELECT dayname(`citas`.`fecha_hora`) AS `dia_semana`, count(0) / 7 AS `promedio_diario` FROM `citas` GROUP BY dayname(`citas`.`fecha_hora`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_promedio_citas_medico`
--
DROP TABLE IF EXISTS `vista_promedio_citas_medico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_promedio_citas_medico`  AS SELECT `subconsulta`.`id_medico` AS `id_medico`, avg(`subconsulta`.`total_citas`) AS `promedio_citas` FROM (select `citas`.`id_medico` AS `id_medico`,count(0) AS `total_citas` from `citas` group by `citas`.`id_medico`) AS `subconsulta` GROUP BY `subconsulta`.`id_medico` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_promedio_citas_medico_mes`
--
DROP TABLE IF EXISTS `vista_promedio_citas_medico_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_promedio_citas_medico_mes`  AS SELECT `citas`.`id_medico` AS `id_medico`, count(0) / 30 AS `promedio_citas_diarias` FROM `citas` WHERE `citas`.`fecha_hora` >= current_timestamp() - interval 1 month GROUP BY `citas`.`id_medico` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_promedio_edad_pacientes`
--
DROP TABLE IF EXISTS `vista_promedio_edad_pacientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_promedio_edad_pacientes`  AS SELECT avg(timestampdiff(YEAR,`pacientes`.`fecha_nacimiento`,curdate())) AS `edad_promedio` FROM `pacientes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_total_citas_especialidad`
--
DROP TABLE IF EXISTS `vista_total_citas_especialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_total_citas_especialidad`  AS SELECT `e`.`nombre` AS `especialidad`, count(0) AS `total_citas` FROM ((`citas` `c` join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) join `especialidades` `e` on(`m`.`especialidad_id` = `e`.`id_especialidad`)) GROUP BY `e`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ultima_cita_paciente`
--
DROP TABLE IF EXISTS `vista_ultima_cita_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ultima_cita_paciente`  AS SELECT `c`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre`, max(`c`.`fecha_hora`) AS `ultima_cita` FROM (`citas` `c` join `pacientes` `p` on(`c`.`id_paciente` = `p`.`id_paciente`)) GROUP BY `c`.`id_paciente` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `consultorio_id` (`consultorio_id`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`id_consultorio`);

--
-- Indices de la tabla `enfermeros`
--
ALTER TABLE `enfermeros`
  ADD PRIMARY KEY (`id_enfermero`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD PRIMARY KEY (`id_historia`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `hospitalizaciones`
--
ALTER TABLE `hospitalizaciones`
  ADD PRIMARY KEY (`id_hospitalizacion`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id_medicamento`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id_medico`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  MODIFY `id_consultorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `enfermeros`
--
ALTER TABLE `enfermeros`
  MODIFY `id_enfermero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  MODIFY `id_historia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `hospitalizaciones`
--
ALTER TABLE `hospitalizaciones`
  MODIFY `id_hospitalizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`consultorio_id`) REFERENCES `consultorios` (`id_consultorio`);

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD CONSTRAINT `historias_clinicas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `hospitalizaciones`
--
ALTER TABLE `hospitalizaciones`
  ADD CONSTRAINT `hospitalizaciones_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
