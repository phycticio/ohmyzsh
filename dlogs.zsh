dlogs() {
  if [ -z "$1" ]; then
    echo "Uso: dlogs <container name or ID>"
    return 1
  fi

  docker logs "$1" -f -n 100
}
