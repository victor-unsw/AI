/**
 * Iterative Depth Limited Search
 *
 * Created by victorchoudhary on 28/04/15.
 */

import java.util.*;

public class IterativeDFSearch {

    private static int stepsTaken = 0;
    private static int nodesInMemory = 0;

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
            connections[i][i] = 1;

        connections[ARAD][ZERIND] = 1;
        connections[ARAD][SIBIU] = 1;
        connections[ARAD][TIMISOARA] = 1;

        connections[ZERIND][ARAD] = 1;
        connections[ZERIND][ORADEA] = 1;

        connections[ORADEA][ZERIND] = 1;
        connections[ORADEA][SIBIU] = 1;

        connections[SIBIU][ARAD] = 1;
        connections[SIBIU][ORADEA] = 1;
        connections[SIBIU][FAGARAS] = 1;
        connections[SIBIU][RIMNICU] = 1;

        connections[TIMISOARA][ARAD] = 1;
        connections[TIMISOARA][LUGOJ] = 1;

        connections[LUGOJ][TIMISOARA] = 1;
        connections[LUGOJ][MEHADIA] = 1;

        connections[MEHADIA][LUGOJ] = 1;
        connections[MEHADIA][DROBETA] = 1;

        connections[DROBETA][MEHADIA] = 1;
        connections[DROBETA][CRAIOVA] = 1;

        connections[CRAIOVA][DROBETA] = 1;
        connections[CRAIOVA][RIMNICU] = 1;
        connections[CRAIOVA][PITESTI] = 1;

        connections[RIMNICU][SIBIU] = 1;
        connections[RIMNICU][PITESTI] = 1;
        connections[RIMNICU][CRAIOVA] = 1;

        connections[FAGARAS][SIBIU] = 1;
        connections[FAGARAS][BUCHAREST] = 1;

        connections[PITESTI][RIMNICU] = 1;
        connections[PITESTI][BUCHAREST] = 1;
        connections[PITESTI][CRAIOVA] = 1;

        connections[BUCHAREST][FAGARAS] = 1;
        connections[BUCHAREST][PITESTI] = 1;
        connections[BUCHAREST][GIURGIU] = 1;
        connections[BUCHAREST][URZICENI] = 1;

        connections[GIURGIU][BUCHAREST] = 1;

        connections[URZICENI][BUCHAREST] = 1;
        connections[URZICENI][HIRSOVA] = 1;
        connections[URZICENI][VASLUI] = 1;

        connections[HIRSOVA][URZICENI] = 1;
        connections[HIRSOVA][EFORIE] = 1;

        connections[EFORIE][HIRSOVA] = 1;

        connections[VASLUI][URZICENI] = 1;
        connections[VASLUI][IASI] = 1;

        connections[IASI][VASLUI] = 1;
        connections[IASI][NEAMT] = 1;

        connections[NEAMT][IASI] = 1;
    }

    private void showConnections(){
        System.out.print("   ");
        for (int i=0;i<connections.length;i++)
            System.out.printf("%2.2s ", i);
        System.out.println();
        for (int i=0;i<connections.length;i++){
            System.out.printf("%2.2s ",i);
            for (int j=0;j<connections[i].length;j++)
                System.out.printf("%2.2s ",connections[i][j]);
            System.out.println();
        }
    }


    //================================================================================
    // DATA
    //================================================================================

    public static void main(String args[]){

        Scanner scanner = new Scanner(System.in);

        IterativeDFSearch dfSearch = new IterativeDFSearch();
        dfSearch.makeConnections();

        System.out.print("Enter Start node : ");
        String startNode = scanner.nextLine();

        System.out.print("Enter Goal node : ");
        String goalNode = scanner.nextLine();

        System.out.print("Enter max limit : " );
        int maxLimit = scanner.nextInt();

        for (int limit=0;limit<maxLimit;limit++)
        if (!dfSearch.depthFirstSearch(getNode(startNode),getNode(startNode),getNode(goalNode),new HashMap(),limit))
            System.out.println(goalNode + " not found in "+ (limit+1) +" steps");
        else
            break;

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

    public boolean depthFirstSearch(int startNode,int node,int goal,HashMap nodesAccessed,int limit){
        if (node == goal){
            System.out.printf("%s%s%s%s","PATH [ ",getNode(node) + " <- ",getNode(node),node == startNode ?" ]":" <-");
            return true;
        }

        nodesAccessed.put(getNode(node),node);
        boolean result = false;

        if (limit > 0)
            for (int i=0;i<connections[node].length && !result;i++){
                if (node == i)
                    continue;
                if (connections[node][i] == 1 && goal == i){
                    System.out.printf("%s%s%s%s","PATH [ ",getNode(i) + " <- ",getNode(node),node == startNode ?" ]":" <-");
                    return true;
                }
                if (connections[node][i] == 1 && nodesAccessed.get(getNode(i)) == null) {
                    result = depthFirstSearch(startNode, i, goal, nodesAccessed, limit - 1);
                    if (!result)
                        nodesAccessed.remove(getNode(i));
                }
            }

        if (result)
            System.out.printf("%s%s",getNode(node),startNode == node ? " ]" : " <- ");
        return result;
    }

}