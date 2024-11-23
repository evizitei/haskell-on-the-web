import { WASI } from 'https://cdn.jsdelivr.net/npm/@bjorn3/browser_wasi_shim@0.3.0/+esm';

const importHaskellModule = async (wasmPath) => {
    const memory = new WebAssembly.Memory({ initial: 256, maximum: 512 });
    const wasi = new WASI([],[],[]);
    const importObject = {
        env: { 
            memory: memory,
            memoryBase: 0,
            tableBase: 0
        },
        wasi_snapshot_preview1: wasi.wasiImport
    };

    try {
        // Fetch and instantiate the WASM module
        const response = await fetch(wasmPath);
        const wasmBuffer = await response.arrayBuffer();
        const wasmModule = await WebAssembly.instantiate(wasmBuffer, importObject);
        wasi.initialize(wasmModule.instance);
        wasmModule.instance.exports.hs_init(0, 0);
        // Return the instance containing your exported functions
        return wasmModule.instance.exports;
    } catch (error) {
        console.error('Failed to load Haskell WASM module:', error);
        throw error;
    }
};

// Usage example
async function init() {
    try {
        const haskellModule = await importHaskellModule('/web/wasm/browser_utils.wasm');
        const result = haskellModule.add(5, 3);
        console.log('Result from haskell:', result);
    } catch (error) {
        console.error('Initialization failed:', error);
    }
}

// Initialize when the page loads
init();