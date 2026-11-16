class File {
    private String information;
    private String name;

    // Constructor pentru a inițializa numele și conținutul fișierului
    public File(String name, String information) {
        this.name = name;
        this.information = information;
    }

    // Returnează conținutul fișierului
    public String getContent() {
        return information;
    }

    public String getName() {
        return name;
    }
}

class Folder {
    private File[] entries;

    // Constructor: inițializăm array-ul 'entries' ca fiind gol (lungime 0)
    public Folder() {
        this.entries = new File[0];
    }

    // Metodă pentru adăugarea unui fișier fără a permite duplicate
    public boolean addFile(File newFile) {
        // Verificăm dacă fișierul există deja în folder
        for (File f : entries) {
            if (f == newFile) {
                return false; // Dacă există deja, nu îl adăugăm din nou
            }
        }

        // Creăm un nou array cu o dimensiune mai mare cu 1
        File[] newEntries = new File[entries.length + 1];
        
        // Copiem elementele vechi în noul array
        for (int i = 0; i < entries.length; i++) {
            newEntries[i] = entries[i];
        }
        
        // Adăugăm noul fișier la sfârșit
        newEntries[newEntries.length - 1] = newFile;
        entries = newEntries; // Actualizăm referința
        
        return true;
    }

    // Returnează o singură String obținută prin concatenarea conținutului tuturor fișierelor
    public String getContent() {
        String result = "";
        for (File f : entries) {
            result += f.getContent() + " ";
        }
        return result.trim();
    }
}

// Clasa principală pentru testare
public class ex1 {
    public static void main(String[] args) {
        File file1 = new File("file1.txt", "Hello");
        File file2 = new File("file2.txt", "World");

        Folder folder = new Folder();
        folder.addFile(file1);
        folder.addFile(file2);

        System.out.println("Conținut folder: " + folder.getContent());
    }
}