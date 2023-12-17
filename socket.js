const WebSocket = require('ws');
const os = require('os');
const pty = require('node-pty');
const port = 6060

const wss = new WebSocket.Server({ port: 6060 });

console.log(`Socket is up and running on port ${port}`);

const sessions = {};

wss.on('connection', ws => {
    const sessionId = generateSessionId(); // Generate a unique session ID
    console.log(`New session: ${sessionId}`);
    const shell = os.platform() === 'win32' ? 'powershell.exe' : 'bash';
    const ptyProcess = pty.spawn(shell, [], {
        name: 'xterm-color',
        env: process.env,
    });

    sessions[sessionId] = ptyProcess;

    ws.on('message', command => {
        ptyProcess.write(command);
    });

    ptyProcess.on('data', function (data) {
        ws.send(data);
    });

    ws.on('close', () => {
        console.log(`Session closed: ${sessionId}`);
        delete sessions[sessionId]; // Remove the session when the WebSocket connection is closed
    });
});

function generateSessionId() {
    return Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
}
