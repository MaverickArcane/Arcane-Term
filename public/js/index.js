document.addEventListener('DOMContentLoaded', function () {
    // Setup WebSocket terminal
    setupWebSocketTerminal();
});

function setupWebSocketTerminal() {
    // Use xterm.js library to create a terminal
    const term = new Terminal();
    term.open(document.getElementById('xterm-wrapper'));

    // Extract the hostname from the current URL
    const hostname = window.location.hostname;

    // Use the extracted hostname to construct the WebSocket URL
    const socket = new WebSocket(`ws://${hostname}:6060`);

    socket.addEventListener('message', function (event) {
        term.write(event.data);
    });

    term.onData(data => {
        socket.send(data);
    });

    socket.addEventListener('close', function (event) {
        if (event.wasClean) {
            console.log(`Connection closed cleanly, code=${event.code}, reason=${event.reason}`);
        } else {
            console.error('Connection died');
        }
    });

    socket.addEventListener('error', function (error) {
        console.error(`WebSocket Error: ${error}`);
    });
}
