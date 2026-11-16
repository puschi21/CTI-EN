class Text {
    private String[] words;
    private int[] counts;
    private int size; // ține evidența numărului de cuvinte adăugate (maxim 20)

    public Text() {
        this.words = new String[20];
        this.counts = new int[20];
        this.size = 0;
    }

    // Adaugă un cuvânt sau îi incrementează contorul dacă există deja
    public boolean addWord(String word) {
        // Verificăm dacă cuvântul există deja
        for (int i = 0; i < size; i++) {
            if (words[i].equals(word)) {
                counts[i]++;
                return true;
            }
        }

        // Dacă nu există și am atins limita de 20, operația eșuează
        if (size >= 20) {
            return false;
        }

        // Dacă este un cuvânt nou, îl adăugăm și setăm contorul la 1
        words[size] = word;
        counts[size] = 1;
        size++;
        return true;
    }

    // Afișează fiecare cuvânt împreună cu numărul său de apariții
    public void printText() {
        for (int i = 0; i < size; i++) {
            System.out.println(words[i] + " -> " + counts[i]);
        }
    }
}

// Clasa Client pentru testare
class TextClient {
    public static void main(String[] args) {
        Text text = new Text();
        text.addWord("java");
        text.addWord("programming");
        text.addWord("java"); // Va incrementa contorul pentru "java"

        text.printText();
    }
}