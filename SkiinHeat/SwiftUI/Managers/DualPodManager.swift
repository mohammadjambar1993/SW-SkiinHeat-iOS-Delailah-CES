import Foundation
import CoreBluetooth

class DualPodManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {

    // 1. "The List": Instead of holding 1 pod, we hold a list of them.
    @Published var connectedPods: [CBPeripheral] = []
    
    private var centralManager: CBCentralManager!
    private let targetName = "Skiin" // We only look for devices with this name

    override init() {
        super.init()
        // Start the Bluetooth system
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func startScanning() {
        if centralManager.state == .poweredOn {
            print("DualPodManager: Scanning for multiple pods...")
            // Scan for all devices nearby
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        }
    }

    // MARK: - Bluetooth Logic

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            startScanning()
        } else {
            print("DualPodManager: Bluetooth is OFF")
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        // 2. Filter: Ignore devices that aren't "Skiin"
        guard let name = peripheral.name, name.contains(targetName) else { return }

        // 3. Check Duplicates: Don't connect to the same pod twice
        let isAlreadyConnected = connectedPods.contains { $0.identifier == peripheral.identifier }

        if !isAlreadyConnected {
            print("DualPodManager: Found Pod -> \(name)")
            
            // Connect to it
            central.connect(peripheral, options: nil)
            
            // Add it to our list
            connectedPods.append(peripheral)
        }
        
        // 4. THE KEY CHANGE: Only stop scanning if we have 2 pods
        if connectedPods.count >= 2 {
            print("DualPodManager: Success! Two pods connected.")
            central.stopScan()
        }
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("DualPodManager: Fully connected to \(peripheral.name ?? "Unknown")")
        peripheral.delegate = self
        peripheral.discoverServices(nil)
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        // If a pod disconnects, remove it from the list and start looking again
        if let index = connectedPods.firstIndex(of: peripheral) {
            connectedPods.remove(at: index)
        }
        startScanning()
    }
}