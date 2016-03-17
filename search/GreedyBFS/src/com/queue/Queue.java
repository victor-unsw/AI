package com.queue;

/**
 * Created by victorchoudhary on 24/03/15.
 */
public interface Queue<E> {
    /**
     * Returns the number of elements in queue.
     * @return number of elements in queue
     */
    int size();

    /**
     * Tests whether queue is empty.
     * @return true if queue is empty,false otherwise.
     */
    boolean isEmpty();

    /**
     * Insert an element at rear of the queue.
     * @param e
     */
    void enqueue(E e, int priority);

    /**
     * Removes & Returns the first element in queue.
     * @return first element
     */
    Position<E> dequeue();

    /**
     * Returns the first element in the queue.
     * @return first element
     */
    E first();

}
