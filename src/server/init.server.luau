local ReplicatedStorage = game:GetService("ReplicatedStorage")


require(ReplicatedStorage.Shared.ExcutionLang).run([[
SET 1000;
ADD 100;
WRITE "ALPHA";
SET {READ"ALPHA" , 1 , 1};
]])