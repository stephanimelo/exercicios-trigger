-- Trigger: impede inclusao de professor sem titulo de Pos-Doutorado

CREATE TRIGGER trg_Impede_Professor_Sem_PosDoutorado
ON Professor
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN Titulacao t ON i.CodTit = t.CodTit
        WHERE t.NomeTit IS NULL OR t.NomeTit <> 'Pos-Doutorado'
    )
    BEGIN
        RAISERROR('Inclusao negada: so e permitido incluir professor com titulo de Pos-Doutorado.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO