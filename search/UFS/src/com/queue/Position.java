package com.queue;

/**
 * Created by victorchoudhary on 29/04/15.
 */
public interface Position<E> {

    E getElement();

    int getPriority();

}
