#!/bin/bash

echo "Entrypoint iniciado"
echo "Argumentos recibidos: $@"

# Variables de entorno para Katalon
API_KEY=${KATALON_API_KEY:-"default-api-key"}
BROWSER_TYPE=${BROWSER_TYPE:-"Chrome"}
EXECUTION_PROFILE=${EXECUTION_PROFILE:-"default"}
TEST_SUITE_PATH=${TEST_SUITE_PATH:-""}
RETRY_COUNT=${RETRY_COUNT:-"0"}

# Validar que los parámetros requeridos estén presentes
if [ -z "$TEST_SUITE_PATH" ] || [ -z "$BROWSER_TYPE" ]; then
  echo "Error: Faltan parámetros obligatorios {-testSuitePath, -browserType}."
  exit 1
fi

# Ejecutar Katalon con los argumentos recibidos
exec katalon-execute.sh -apiKey="$API_KEY" -browserType="$BROWSER_TYPE" -executionProfile="$EXECUTION_PROFILE" -testSuitePath="$TEST_SUITE_PATH" -retry="$RETRY_COUNT"
