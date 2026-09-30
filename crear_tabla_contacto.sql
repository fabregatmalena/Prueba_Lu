-- Verificar y crear tabla Contacto relacionada con Persona

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Contacto')
BEGIN
    CREATE TABLE Contacto (
        IdContacto INT IDENTITY(1,1) PRIMARY KEY,
        IdPersona INT NOT NULL,
        TipoContacto VARCHAR(20) NOT NULL, -- Ej: 'Celular', 'Email secundario', 'Tel. Fijo'
        Valor VARCHAR(100) NOT NULL,        -- Ej: '+54 9 379 123456', 'contacto@gmail.com'
        EsPrincipal BIT DEFAULT 0,

        -- Definición de la relación (Clave Foránea)
        CONSTRAINT FK_Contacto_Persona FOREIGN KEY (IdPersona)
            REFERENCES Persona(IdPersona)
            ON DELETE CASCADE  -- Si se borra la persona, se borran sus contactos
            ON UPDATE CASCADE
    );
END;
GO
