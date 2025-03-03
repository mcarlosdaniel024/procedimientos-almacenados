<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hospitaldb";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// 1. Listado de citas médicas
$sql = "SELECT c.id_cita, p.nombre AS paciente, m.nombre AS medico, c.fecha_hora 
        FROM citas c 
        JOIN pacientes p ON c.id_paciente = p.id_paciente 
        JOIN medicos m ON c.id_medico = m.id_medico";
$result = $conn->query($sql);

echo "<h2>Listado de Citas Médicas</h2><table border='1'><tr><th>ID Cita</th><th>Paciente</th><th>Médico</th><th>Fecha y Hora</th></tr>";
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>{$row['id_cita']}</td><td>{$row['paciente']}</td><td>{$row['medico']}</td><td>{$row['fecha_hora']}</td></tr>";
    }
} else {
    echo "<tr><td colspan='4'>No hay citas</td></tr>";
}
echo "</table>";

// 2. Lista de médicos (sin especialidad si no existe)
$sql = "SELECT id_medico, nombre FROM medicos";
$result = $conn->query($sql);

echo "<h2>Lista de Médicos</h2><table border='1'><tr><th>ID</th><th>Nombre</th></tr>";
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>{$row['id_medico']}</td><td>{$row['nombre']}</td></tr>";
    }
} else {
    echo "<tr><td colspan='2'>No hay médicos</td></tr>";
}
echo "</table>";

// 3. Historial de citas de un paciente específico
$id_paciente = 1; // Puedes cambiarlo por una variable dinámica
$sql = "SELECT c.id_cita, m.nombre AS medico, c.fecha_hora 
        FROM citas c 
        JOIN medicos m ON c.id_medico = m.id_medico 
        WHERE c.id_paciente = $id_paciente";
$result = $conn->query($sql);

echo "<h2>Historial de Citas del Paciente #$id_paciente</h2><table border='1'><tr><th>ID Cita</th><th>Médico</th><th>Fecha y Hora</th></tr>";
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>{$row['id_cita']}</td><td>{$row['medico']}</td><td>{$row['fecha_hora']}</td></tr>";
    }
} else {
    echo "<tr><td colspan='3'>No hay citas</td></tr>";
}
echo "</table>";

$conn->close();
?>
