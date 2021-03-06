package com.queue;

/**
 * Created by victorchoudhary on 24/03/15.
 */

public class LinkedQueue<E> implements Queue<E> {

    private SinglyLinkedList<E> queue = new SinglyLinkedList<E>();

    public int size(){
        return queue.getSize();
    }

    public boolean isEmpty(){
        return queue.isEmpty();
    }

    public void enqueue(E e,int priority,int pathCost){
        queue.insert(e,priority,pathCost);
    }

    public Position<E> dequeue(){
        return queue.removeFirst();
    }

    public E first(){
        return queue.getFirst();
    }
}
