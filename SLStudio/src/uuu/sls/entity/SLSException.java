/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.entity;

/**
 *
 * @author Admin
 */
public class SLSException extends Exception {

    /**
     * Creates a new instance of <code>SLSException</code> without detail
     * message.
     */
    public SLSException() {
    }

    public SLSException(Exception ex) {
        super(ex);
    }

    public SLSException(String msg, Exception ex) {
        super(msg, ex);
    }
    
     public SLSException(String msg, Throwable cause) {
        super(msg, cause);
    }
    /**
     * Constructs an instance of <code>SLSException</code> with the specified
     * detail message.
     *
     * @param msg the detail message.
     */
    public SLSException(String msg) {
        super(msg);
    }
}

