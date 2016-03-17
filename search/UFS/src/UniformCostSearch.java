/**
 * Uniform Cost Search
 *
 * Created by victorchoudhary on 29/04/15.
 */

import com.list.*;
import com.queue.*;

import java.util.HashMap;
import java.util.Scanner;

public class UniformCostSearch {

    //================================================================================
    // DATA
    //================================================================================

    private static final byte ARAD = 0;
    private static final byte ZERIND = 1;
    private static final byte ORADEA = 2;
    private static final byte SIBIU = 3;
    private static final byte TIMISOARA = 4;
    private static final byte LUGOJ = 5;
    private static final byte MEHADIA = 6;
    private static final byte DROBETA = 7;
    private static final byte CRAIOVA = 8;
    private static final byte RIMNICU = 9;
    private static final byte FAGARAS = 10;
    private static final byte PITESTI = 11;
    private static final byte BUCHAREST = 12;
    private static final byte GIURGIU = 13;
    private static final byte URZICENI = 14;
    private static final byte HIRSOVA = 15;
    private static final byte EFORIE = 16;
    private static final byte VASLUI = 17;
    private static final byte IASI = 18;
    private static final byte NEAMT = 19;


    private int[][] connections = new int[20][20];

    private void makeConnections(){

        for (int i=0;i<connections.length;i++)
            connections[i][i] = 0;

        connections[ARAD][ZERIND] = 75;
        connections[ARAD][SIBIU] = 140;
        connections[ARAD][TIMISOARA] = 118;

        connections[ZERIND][ARAD] = 75;
        connections[ZERIND][ORADEA] = 71;

        connections[ORADEA][ZERIND] = 71;
        connections[ORADEA][SIBIU] = 151;

        connections[SIBIU][ARAD] = 140;
        connections[SIBIU][ORADEA] = 151;
        connections[SIBIU][FAGARAS] = 99;
        connections[SIBIU][RIMNICU] = 80;

        connections[TIMISOARA][ARAD] = 118;
        connections[TIMISOARA][LUGOJ] = 111;

        connections[LUGOJ][TIMISOARA] = 111;
        connections[LUGOJ][MEHADIA] = 70;

        connections[MEHADIA][LUGOJ] = 70;
        connections[MEHADIA][DROBETA] = 75;

        connections[DROBETA][MEHADIA] = 75;
        connections[DROBETA][CRAIOVA] = 120;

        connections[CRAIOVA][DROBETA] = 120;
        connections[CRAIOVA][RIMNICU] = 146;
        connections[CRAIOVA][PITESTI] = 138;

        connections[RIMNICU][SIBIU] = 80;
        connections[RIMNICU][PITESTI] = 97;
        connections[RIMNICU][CRAIOVA] = 146;

        connections[FAGARAS][SIBIU] = 99;
        connections[FAGARAS][BUCHAREST] = 211;

        connections[PITESTI][RIMNICU] = 97;
        connections[PITESTI][BUCHAREST] = 101;
        connections[PITESTI][CRAIOVA] = 138;

        connections[BUCHAREST][FAGARAS] = 211;
        connections[BUCHAREST][PITESTI] = 101;
        connections[BUCHAREST][GIURGIU] = 90;
        connections[BUCHAREST][URZICENI] = 85;

        connections[GIURGIU][BUCHAREST] = 90;

        connections[URZICENI][BUCHAREST] = 85;
        connections[URZICENI][HIRSOVA] = 98;
        connections[URZICENI][VASLUI] = 142;

        connections[HIRSOVA][URZICENI] = 98;
        connections[HIRSOVA][EFORIE] = 86;

        connections[EFORIE][HIRSOVA] = 86;

        connections[VASLUI][URZICENI] = 142;
        connections[VASLUI][IASI] = 92;

        connections[IASI][VASLUI] = 92;
        connections[IASI][NEAMT] = 87;

        connections[NEAMT][IASI] = 87;
    }

    private void showConnections(){
        System.out.print("    ");
        for (int i=0;i<connections.length;i++)
            System.out.printf("%3.3s ", i);
        System.out.println();
        for (int i=0;i<connections.length;i++){
            System.out.printf("%3.3s ",i);
            for (int j=0;j<connections[i].length;j++)
                System.out.printf("%3.3s ",connections[i][j]);
            System.out.println();
        }
    }

    public static void main(String args[]){
        UniformCostSearch ucs = new UniformCostSearch();
        ucs.makeConnections();

        Scanner scanner = new Scanner(System.in);

        UniformCostSearch bfs = new UniformCostSearch();
        bfs.makeConnections();

        System.out.print("Enter Start node : ");
        String startNode = scanner.nextLine();

        System.out.print("Enter Goal node : ");
        String goalNode = scanner.nextLine();

        Position<DoublyLinkedList<Integer>> path = bfs.uniformCostSearch(getNode(startNode), getNode(goalNode));
        showPath(path);
    }

    private static int getNode(String node){
        if (node.equalsIgnoreCase("ARAD"))
            return ARAD;
        if (node.equalsIgnoreCase("ZERIND"))
            return ZERIND;
        if (node.equalsIgnoreCase("ORADEA"))
            return ORADEA;
        if (node.equalsIgnoreCase("SIBIU"))
            return SIBIU;
        if (node.equalsIgnoreCase("TIMISOARA"))
            return TIMISOARA;
        if (node.equalsIgnoreCase("LUGOJ"))
            return LUGOJ;
        if (node.equalsIgnoreCase("MEHADIA"))
            return MEHADIA;
        if (node.equalsIgnoreCase("DROBETA"))
            return DROBETA;
        if (node.equalsIgnoreCase("CRAIOVA"))
            return CRAIOVA;
        if (node.equalsIgnoreCase("RIMNICU"))
            return RIMNICU;
        if (node.equalsIgnoreCase("FAGARAS"))
            return FAGARAS;
        if (node.equalsIgnoreCase("PITESTI"))
            return PITESTI;
        if (node.equalsIgnoreCase("BUCHAREST"))
            return BUCHAREST;
        if (node.equalsIgnoreCase("GIURGIU"))
            return GIURGIU;
        if (node.equalsIgnoreCase("URZICENI"))
            return URZICENI;
        if (node.equalsIgnoreCase("HIRSOVA"))
            return HIRSOVA;
        if (node.equalsIgnoreCase("EFORIE"))
            return EFORIE;
        if (node.equalsIgnoreCase("VASLUI"))
            return VASLUI;
        if (node.equalsIgnoreCase("IASI"))
            return IASI;
        if (node.equalsIgnoreCase("NEAMT"))
            return NEAMT;
        return -1;
    }

    private static String getNode(int node){
        switch (node){
            case 0 : return "ARAD";
            case 1 : return "ZERIND";
            case 2 : return "ORADEA";
            case 3 : return "SIBIU";
            case 4 : return "TIMISOARA";
            case 5 : return "LUGOJ";
            case 6 : return "MEHADIA";
            case 7 : return "DROBETA";
            case 8 : return "CRAIOVA";
            case 9 : return "RIMNICU";
            case 10 : return "FAGARAS";
            case 11 : return "PTIESTI";
            case 12 : return "BUCHAREST";
            case 13 : return "GIURGIU";
            case 14 : return "URZICENI";
            case 15 : return "HIRSOVA";
            case 16 : return "EFORIA";
            case 17 : return "VASLUI";
            case 18 : return "IASI";
            case 19 : return "NEAMT";
            default: return "none";
        }
    }

    public static void showPath(Position<DoublyLinkedList<Integer>> position){
        if (position == null){
            System.out.println("No path available : node not found");
            return;
        }
        DoublyLinkedList<Integer> path = position.getElement();
        System.out.print("\nPath : [ ");
        while (!path.isEmpty())
            System.out.printf("%s%s",getNode(path.removeLast()),path.isEmpty() ? "" : " -> ");
        System.out.println(" ]");
        System.out.println("Path cost : " + position.getPriority());
    }

    public Position<DoublyLinkedList<Integer>> uniformCostSearch(int start,int goal){
        Queue<DoublyLinkedList<Integer>> frontier = new LinkedQueue<DoublyLinkedList<Integer>>();
        DoublyLinkedList<Integer> path = new DoublyLinkedList<Integer>();
        path.addFirst(start);
        frontier.enqueue(path, getPathCost(0,start,start,goal));

        if (start == goal)
            return frontier.dequeue();

        HashMap exploredNodes = new HashMap();

        while (!frontier.isEmpty()){
            Position<DoublyLinkedList<Integer>> position = frontier.dequeue();
            path = position.getElement();
            int node = path.first();

            if (node == goal)
                return position;

            exploredNodes.put(getNode(node),node);

            for (int i=0;i<connections[node].length;i++){

                if (node == i)
                    continue;

                // omitted frontier check
                if (connections[node][i] != 0 && exploredNodes.get(getNode(i)) == null && !checkOccurance(i,frontier)){
                    DoublyLinkedList<Integer> newPath = path.getDuplicate();
                    newPath.addFirst(i);
                    frontier.enqueue(newPath,getPathCost(position.getPriority(),node,i,goal));
                }else if (connections[node][i] != 0 && exploredNodes.get(getNode(i)) == null && checkHigherOccurance(getPathCost(position.getPriority(),node,i,goal),i,frontier)){
                    DoublyLinkedList<Integer> newPath = path.getDuplicate();
                    newPath.addFirst(i);
                    frontier.enqueue(newPath,getPathCost(position.getPriority(),node,i,goal));
                }
            }
        }
        return null;
    }

    private int getPathCost(int currentPathCost,int parentNode,int currentNode,int goalNode){

        return currentPathCost + ((parentNode == currentNode) ? 0 : connections[parentNode][currentNode]);
    }

    private boolean checkHigherOccurance(int priority,int element,Queue<DoublyLinkedList<Integer>> frontier){
        Queue<DoublyLinkedList<Integer>> tempQueue = new LinkedQueue<DoublyLinkedList<Integer>>();
        boolean result = false;
        while (!frontier.isEmpty()){
            Position<DoublyLinkedList<Integer>> position = frontier.dequeue();
            DoublyLinkedList<Integer> path = position.getElement();
            if (path.first() == element && position.getPriority() > priority){
                result = true;
                break;
            }
            else tempQueue.enqueue(path,position.getPriority());
        }
        while (!frontier.isEmpty()){
            Position<DoublyLinkedList<Integer>> position = frontier.dequeue();
            tempQueue.enqueue(position.getElement(),position.getPriority());
        }
        while (!tempQueue.isEmpty()){
            Position<DoublyLinkedList<Integer>> position = tempQueue.dequeue();
            frontier.enqueue(position.getElement(), position.getPriority());
        }

        return result;
    }

    private boolean checkOccurance(int element,Queue<DoublyLinkedList<Integer>> frontier){

        Queue<DoublyLinkedList<Integer>> tempQueue = new LinkedQueue<DoublyLinkedList<Integer>>();
        boolean result = false;

        while (!frontier.isEmpty() && !result){
            Position<DoublyLinkedList<Integer>> position = frontier.dequeue();
            DoublyLinkedList<Integer> path = position.getElement();
            if (path.first() == element)
                result = true;
            tempQueue.enqueue(path,position.getPriority());
        }
        while (!frontier.isEmpty()){
            Position<DoublyLinkedList<Integer>> position = frontier.dequeue();
            tempQueue.enqueue(position.getElement(),position.getPriority());
        }
        while (!tempQueue.isEmpty()){
            Position<DoublyLinkedList<Integer>> position = tempQueue.dequeue();
            frontier.enqueue(position.getElement(),position.getPriority());
        }

        return result;
    }
}