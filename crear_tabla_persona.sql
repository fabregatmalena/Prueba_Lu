-- Verificar y crear tabla Persona
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Persona')
BEGIN
    CREATE TABLE Persona (
        IdPersona INT IDENTITY(1,1) PRIMARY KEY,
        Nombre VARCHAR(50) NOT NULL,
        Apellido VARCHAR(50) NOT NULL,
        Documento VARCHAR(20) NOT NULL UNIQUE,
        Email VARCHAR(100) NULL,
        FechaNacimiento DATE NULL,
        FechaCreacion DATETIME DEFAULT GETDATE(),
        Estado BIT DEFAULT 1
    );
END;
GO