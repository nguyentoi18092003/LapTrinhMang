/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptrinhmangweb.client;

/**
 *
 * @author pc dellllllllllllll
 */
public class ClientRun {
    public static void main(String[] args) {
        ClientView view = new ClientView();
        ClientControl control = new ClientControl(view);
        view.setVisible(true);
    }

    public class ServerView {

        public ServerView() {
        }

        public void showMessage(String msg) {
            System.out.println(msg);
        }
    }
}
