package com.list;

/**
 * Doubly Linked List
 * Chapter 3
 * Data Structures & Algo. (Goodrich)
 *
 * Created by victorchoudhary on 16/03/15.
 */

public class DoublyLinkedList<E>{

    private static class Node<E>{
        private E element;
        private Node<E> next;
        private Node<E> prev;

        public Node(){};
        public Node(Node<E> prev,E element,Node<E> next){
            this.element = element;
            this.next = next;
            this.prev = prev;
        }

        public E getElement(){
            return element;
        }
        public Node<E> getNext(){
            return next;
        }
        public Node<E> getPrev(){ return prev;}
        public void setNext(Node<E> next){
            this.next = next;
        }
        public void setPrev(Node<E> prev){
            this.prev = prev;
        }
        public String toString(){
            return "--"+element+"--|";
        }

    }

    private Node<E> header;
    private Node<E> trailer;

    private int size;

    public DoublyLinkedList() {
        header = new Node<E>(null,null,null);
        trailer = new Node<E>(header,null,null);
        header.setNext(trailer);
    }

    // Access Methods
    public int getSize(){
        return size;
    }
    public boolean isEmpty(){
        return size == 0;
    }
    public E first(){
        return header.getNext().getElement();
    }
    public E last(){
        return trailer.getPrev().getElement();
    }


    // Mutator Methods
    public void addFirst(E element){
        this.addBetween(element,header,header.getNext());
    }
    public void addLast(E element){
        this.addBetween(element,trailer.getPrev(),trailer);
    }
    private void addBetween(E element,Node<E> prevNode,Node<E> nextNode){
        Node<E> node = new Node<E>(prevNode,element,nextNode);
        prevNode.setNext(node);
        nextNode.setPrev(node);
        size++;
    }


    public E removeFirst(){
        return remove(header.getNext());
    }
    public E removeLast(){
        return remove(trailer.getPrev());
    }
    public E remove(Node<E> node){
        if (isEmpty())
            return null;
        node.getPrev().setNext(node.getNext());
        node.getNext().setPrev(node.getPrev());
        size--;
        return node.getElement();
    }

    // Utility Methods
    public void display_list(){
        if(isEmpty()){
            System.out.printf("List is empty!\n");
            return;
        }
        System.out.printf("|");
        Node<E> current = header.next;
        while (current != trailer){
            System.out.printf("%s",current.toString());
            current = current.next;
        }
        System.out.println();

    }

    public DoublyLinkedList<E> getDuplicate(){
        DoublyLinkedList<E> newList = new DoublyLinkedList<E>();

        Node<E> current = header.getNext();

        for (int i=0;i<size && current != trailer;i++){
            newList.addLast(current.getElement());
            current = current.getNext();
        }
        return newList;
    }

    public boolean contains(E element){
        Node<E> current = header.getNext();
        while (current != trailer) {
            if (current.getElement() == element)
                return true;
            current = current.getNext();
        }
        return false;
    }

}