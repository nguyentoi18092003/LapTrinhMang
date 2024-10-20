package TCP;
import java.io.*;
import java.net.*;
public class TongHieuTich {
    public static void main(String[] args) throws IOException{
        Socket socket = new Socket("203.162.10.109", 2207);
        DataInputStream in = new DataInputStream(socket.getInputStream());
        DataOutputStream out = new DataOutputStream(socket.getOutputStream());
        String code = "B21DCCN118;GV5IsOSe";
        out.writeUTF(code);
        out.flush();
        int a = in.readInt(), b = in.readInt();
        int tong = a + b, hieu = a - b, tich = a * b;
        out.writeInt(tong);
        //out.writeInt(hieu);
        out.writeInt(tich);
        in.close();
        out.close();
        socket.close();
    }
}
