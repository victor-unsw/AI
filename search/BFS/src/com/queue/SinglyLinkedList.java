package com.queue;

/**
 * Singly Linked List.
 * Contains a HEAD element which points
 * to top of the collection.
 *
 * @author victorchoudhary
 */
public class SinglyLinkedList<E> {
    private static class Node<E>{

        private E element;
        private Node<E> next;

        public Node(E element,Node<E> next){
            this.element = element;
            this.next = next;
        }

        public E getElement() {
            return element;
        }

        public void setElement(E element) {
            this.element = element;
        }

        public Node<E> getNext() {
            return next;
        }

        public void setNext(Node<E> next) {
            this.next = next;
        }
    }

    private int size;
    private Node<E> head;
    private Node<E> tail;

    public SinglyLinkedList(){};

    //==================================================================
    // Accessor Methods
    //==================================================================
    public int getSize(){
        return size;
    }
    public boolean isEmpty(){
        return size == 0;
    }
    public E getFirst(){
        return isEmpty() ? null : head.getElement();
    }

    //==================================================================
    // Mutator Methods
    //==================================================================
    public void insertLast(E element){
        Node<E> node = new Node<E>(element,null);
        if (!isEmpty())
            tail.setNext(node);
        else
            head = node;
        tail = node;
        size++;
    }
    public E removeFirst(){
        if (isEmpty())
            return null;
        E element = head.getElement();
        head = head.getNext();
        tail = head == null ? null : tail;
        size--;
        return element;
    }
}
