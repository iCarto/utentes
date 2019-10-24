# https://stackoverflow.com/questions/2241063/bash-script-to-set-up-a-temporary-ssh-tunnel
# https://www.postgresql.org/docs/9.1/ssh-tunnels.html
# https://stackoverflow.com/questions/15768913/relay-postgresql-connection-over-another-server
# https://github.com/gdbtek/ssh-tunneling

# Aviso. Cuando se lanza este comando, se cierran otros procesos (por ejemplo
#        un emacs) que se hayan lanzado desde este terminal.
# -T No habilitar el pseudo-terminal. Usar siempre que se haga un túnel
# -N No ejecutar comando remoto. Usar siempre que se haga un túnel
# -C Comprimir todos los datos transmitidos. Usar sólo en redes lentas
# -L el mapeado de puertos
# -f Lanza ssh al background
# -M Lanza la conexión en modo connection sharing. Es decir podemos controlarla
#    desde otro proceso ssh
# -S fichero. Crea un fichero (que no debe ser borrado) que se usará para el
#    connection sharing
# -o ExitOnForwardFailure=yes Antes de irse al background espera a que las
#    conexiones hayan tenido éxito. Útil en scripts para que no intente
#    ejecutar el siguiente proceso hasta que de verdad se establezca la conexión

open_tunel() {
    # local REMOTE_SSH_PORT=22
    local REMOTE_SSH_HOST="${1}"

    local LOCAL_APP_HOST="${2}"
    local LOCAL_APP_PORT="${3}"

    local REMOTE_APP_HOST="${4}"
    local REMOTE_APP_PORT="${5}"

    ssh ${REMOTE_SSH_HOST} -M -S /tmp/my-ssh-socket-${REMOTE_SSH_HOST} -o ExitOnForwardFailure=yes -fN -L ${LOCAL_APP_HOST}:${LOCAL_APP_PORT}:${REMOTE_APP_HOST}:${REMOTE_APP_PORT}

    # Nos devuelve el pid del proceso ssh y si está conectado. ie:
    # Master running (pid=3517)
    # SSH_PID=$(ssh ${REMOTE_SSH_HOST} -S my-ctrl-socket -O check 2>&1 | grep -Eo '[0-9]+')
    # [ "${SSH_PID}" ] || exit 1

    return
}

close_tunel() {
    # Cierra la conexión
    local REMOTE_SSH_HOST="${1}"

    ssh ${REMOTE_SSH_HOST} -S /tmp/my-ssh-socket-${REMOTE_SSH_HOST} -O exit
}
