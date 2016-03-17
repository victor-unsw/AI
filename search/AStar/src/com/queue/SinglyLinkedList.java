package com.queue;

/**
 * Singly Linked List.
 * Contains a HEAD element which points
 * to top of the collection.
 *
 * @author victorchoudhary
 */
public class SinglyLinkedList<E> {
    private static class Node<E> implements Position<E>{

        private E element;
        private Node<E> next;
        private int priority;
        private int pathCost;

        public Node(E element,Node<E> next,int priority,int pathCost){
            this.element = element;
            this.next = next;
            this.priority = priority;
            this.pathCost = pathCost;
        }

        @Override
        public int getPathCost() {
            return pathCost;
        }

        public void setPathCost(int pathCost) {
            this.pathCost = pathCost;
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

        public int getPriority() {
            return priority;
        }

        public void setPriority(int priority) {
            this.priority = priority;
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
    public void insert(E element,int priority,int pathCost){
        Node<E> node = new Node<E>(element,null,priority,pathCost);

        if (isEmpty()){
            head = node;
            tail = node;
            node.setNext(null);
        }else {
            Node<E> current = head;
            Node<E> previous = null;
            while (current != null && current.getPriority() <= priority){
                previous = current;
                current = current.getNext();
            }
            node.setNext(current);
            if (previous == null)
                head = node;
            else if (current == null) {
                tail = node;
                previous.setNext(node);
            }
            else
                previous.setNext(node);

        }
        size++;
    }
    public Position<E> removeFirst(){
        if (isEmpty())
            return null;
        Node<E> elementNode = head;

        head = head.getNext();
        tail = head == null ? null : tail;
        size--;

        return elementNode;
    }
}
