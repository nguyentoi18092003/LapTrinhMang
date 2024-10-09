package laptrinhmang.Server;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

public class UDPServer {

    DatagramSocket myServer = null;
    String input;
    int port = 9900;  // Server lắng nghe ở cổng 9900

    // Mở một server socket
    public void openServer() {
        try {
            myServer = new DatagramSocket(port);
            System.out.println("Server đã mở ở cổng: " + port);
        } catch (SocketException e) {
            System.out.println("Lỗi khi mở server: " + e);
        }
    }

    // Lắng nghe và xử lý dữ liệu
    public void listening() throws IOException {
        byte[] receiveData = new byte[1024];
        byte[] sendData = new byte[1024];
        while (true) {
            try {
                DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
                myServer.receive(receivePacket);
                input = new String(receivePacket.getData()).trim();  // Sử dụng trim() để bỏ khoảng trắng

                // Xử lý dữ liệu
                ReverseString str = new ReverseString(input);  // Đảm bảo lớp ReverseString đã được khởi tạo đúng
                str.reverse();

                // Đóng gói thông tin để gửi lại cho client
                InetAddress IPAddress = receivePacket.getAddress();
                int clientPort = receivePacket.getPort();
                sendData = str.get_string().getBytes();
                DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, IPAddress, clientPort);

                // Gửi dữ liệu về client
                myServer.send(sendPacket);
                System.out.println("Đã gửi dữ liệu về client");
            } catch (SocketException e) {
                System.out.println("Lỗi Socket: " + e);
            } catch (IOException e) {
                System.out.println("Lỗi I/O: " + e);
            }
        }
    }

    public static void main(String[] args) throws IOException {
        UDPServer server = new UDPServer();
        server.openServer();
        server.listening();
        System.out.println("Server đang chạy...");
    }
}
