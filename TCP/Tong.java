/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TCP;


import java.io.*;
import java.net.*;
/**
 *
 * @author pc dellllllllllllll
 */
public class Tong {
    public static void main(String[] args) throws IOException {
        
        Socket socket = new Socket("203.162.10.109", 2206);
        InputStream in = socket.getInputStream();
        OutputStream out = socket.getOutputStream();
        String ma = "B21DCCN118;MhsHwVJQ";
        out.write(ma.getBytes());
        out.flush();
        byte[] buffer = new byte[1024];
        int bytesRead = in.read(buffer);
        String s = new String(buffer, 0, bytesRead);
        String[] t = s.trim().split("\\|");
        int tong = 0;
        for(String x: t) tong+=Integer.parseInt(x);
        String res = String.valueOf(tong);
        out.write(res.getBytes());
        out.flush();
        in.close();
        out.close();
        socket.close();
    }
        
    }

        
    
    
