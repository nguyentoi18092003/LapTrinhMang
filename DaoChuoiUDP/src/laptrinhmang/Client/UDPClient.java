package laptrinhmang.Client;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

public class UDPClient {

    DatagramSocket mySocket = null;
    int port = 9980;  // Cổng client sử dụng
    private int serverPort = 9900;  // Gửi dữ liệu tới cổng 9900 của server

    // Mở kết nối
    public void connection() {
        try {
            mySocket = new DatagramSocket(port);
            System.out.println("Client đã mở kết nối ở cổng: " + port);
        } catch (SocketException e) {
            System.err.println("Lỗi khi mở socket: " + e);
        }
    }

    // Gửi dữ liệu tới server
    public void send(String str) throws UnknownHostException, IOException {
        if (mySocket != null) {
            byte[] sendData = new byte[1024];
            try {
                InetAddress IPAddress = InetAddress.getByName("localhost");
                sendData = str.getBytes();
                DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, IPAddress, serverPort);
                mySocket.send(sendPacket);
                System.out.println("Dữ liệu đã được gửi tới server");
            } catch (SocketException e) {
                System.err.println("Lỗi Socket: " + e);
            } catch (IOException e) {
                System.err.println("Lỗi I/O: " + e);
            }
        }
    }

    // Nhận dữ liệu từ server
    public String receive() {
        if (mySocket != null) {
            byte[] receiveData = new byte[1024];
            try {
                DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
                mySocket.receive(receivePacket);
                return new String(receivePacket.getData()).trim();  // Sử dụng trim() để bỏ khoảng trắng thừa
            } catch (SocketException e) {
                System.err.println("Lỗi Socket: " + e);
            } catch (IOException e) {
                System.err.println("Lỗi I/O: " + e);
            }
        }
        return null;
    }

    // Đóng kết nối
    public void close() {
        if (mySocket != null) {
            try {
                mySocket.close();
                System.out.println("Client đã đóng kết nối");
            } catch (Exception e) {
                System.err.println("Lỗi khi đóng kết nối: " + e);
            }
        }
    }

    public static void main(String[] args) throws IOException {
        UDPClient client = new UDPClient();
        client.connection();
        client.send("abc");
        System.out.println("Dữ liệu từ server: " + client.receive());
        client.close();
    }
}
