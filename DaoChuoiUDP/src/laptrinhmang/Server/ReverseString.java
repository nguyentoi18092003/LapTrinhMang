/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptrinhmang.Server;

/**
 *
 * @author pc dellllllllllllll
 */
public class ReverseString {

    private String _string;
// khoi tao khong tham so

    public ReverseString() {
        super();
    }
// khoi tao co tham so

    public ReverseString(String _string) {
        super();
        this._string = _string;
    }

    public String get_string() {
        return _string;
    }

    public void set_string(String _string) {
        this._string = _string;
    }
//phuong thuc dao nguoc chuoi ki tu cua lop nay

    public void reverse() {
        String tmp = "";
        for (int i = _string.length() - 1; i >= 0; i--) {
            tmp += _string.substring(i, i + 1);
        }

        this._string = tmp;
    }
}
