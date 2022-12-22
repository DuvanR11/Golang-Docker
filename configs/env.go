package configs

//Dependecias
import (
    "log"
    "os"
    "github.com/joho/godotenv"
)

func EnvMongoURI() string {
    err := godotenv.Load()
    if err != nil {
        log.Fatal("Error al cargar variable de entorno")
    }
  
	//Variable de entorno
    return os.Getenv("MONGOURI")
}