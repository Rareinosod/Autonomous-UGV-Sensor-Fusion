# Autonomous-UGV-Sensor-Fusion
Sviluppo in MATLAB di logiche per la teleoperazione via Bluetooth e la scansione ambientale per la ricostruzione offline della mappa (2D mapping). • Implementazione della navigazione autonoma tramite Filtro di Kalman per la correzione della stima dello stato e l'odometria, fondendo in tempo reale dati encoder e LiDAR.



Conversazione con Gemini
Guida step by step come caricare coeice o cartella o cosa su giuhub

Guida al Caricamento di Codice e Cartelle su GitHub
Il caricamento di codice sorgente, file o intere cartelle su una piattaforma di hosting come GitHub può avvenire principalmente in due modalità: tramite l'interfaccia grafica web oppure attraverso la riga di comando utilizzando il sistema di controllo di versione Git.

Prerequisiti Fondamentali
Creazione di un account attivo sulla piattaforma GitHub.

Creazione di un repository (spazio di archiviazione) destinato ad accogliere i file.

(Solo per il Metodo 2) Installazione del software Git sul sistema locale.

Metodo 1: Utilizzo dell'Interfaccia Web di GitHub
Questo metodo è indicato per il caricamento rapido di singoli file o cartelle di dimensioni contenute, senza la necessità di operare da terminale.

Accesso al Repository: Effettuare l'accesso al portale GitHub e navigare all'interno del repository di destinazione.

Aggiunta dei File: Individuare e selezionare il pulsante Add file situato nella parte superiore della schermata.

Selezione dell'Azione: Scegliere l'opzione Upload files dal menu a tendina visualizzato.

Caricamento: Trascinare i file o le cartelle nell'area designata ("Drag files here to add them to your repository") oppure cliccare sull'opzione choose your files per esplorare le directory del disco locale.

Compilazione del Commit: Scorrere verso la sezione inferiore denominata Commit changes.

Inserimento della Descrizione: Fornire un titolo e una breve descrizione delle modifiche o dei file caricati negli appositi campi di testo.

Finalizzazione: Cliccare sul pulsante Commit changes per salvare i file sul server.

Metodo 2: Utilizzo della Riga di Comando (Git)
Questo metodo rappresenta la procedura standard nell'ingegneria del software, essenziale per la gestione di interi progetti, aggiornamenti continui e strutture di cartelle complesse.

Apertura del Terminale: Aprire il prompt dei comandi o il terminale e navigare, tramite il comando cd, all'interno della cartella locale contenente il codice.

Inizializzazione: Inizializzare un repository Git locale digitando:
git init

Aggiunta all'Area di Staging: Inserire tutti i file e le sottocartelle del progetto nell'area di preparazione utilizzando il punto per indicare la totalità degli elementi:
git add .

Creazione del Commit: Registrare i file aggiunti associando un messaggio descrittivo obbligatorio:
git commit -m "Descrizione del caricamento"

Collegamento al Repository Remoto: Connettere il repository locale allo spazio creato su GitHub. È necessario sostituire l'URL di esempio con l'indirizzo HTTPS o SSH effettivo del proprio repository:
git remote add origin [https://github.com/nome-utente/nome-repository.git](https://github.com/nome-utente/nome-repository.git)

Selezione del Ramo (Branch): Assicurarsi che il ramo principale sia rinominato in main (standard attuale):
git branch -M main

Caricamento dei Dati (Push): Eseguire il comando finale per trasferire i dati dal computer locale ai server di GitHub:
git push -u origin main

dove dveo anadre non capsico .

Analisi dell'Immagine e della Situazione Attuale
L'immagine fornita come riferimento, denominata image_30433a.jpg, illustra la sezione dedicata alla documentazione ufficiale, nota come GitHub Docs. Questa piattaforma parallela è progettata esclusivamente per la consultazione di manuali, guide teoriche e tutorial (come il caso dell'esercizio "Hello World" visualizzato a schermo).

Non si tratta dell'ambiente operativo in cui è possibile creare repository, gestire file o caricare codice. Questo spiega l'assenza dei pulsanti operativi necessari per procedere.

Procedura Correttiva e Passaggi Iniziali
Per avviare il caricamento effettivo del codice, è indispensabile spostarsi sull'interfaccia principale del servizio. Di seguito è riportato l'ordine delle operazioni preliminari per applicare il caricamento tramite interfaccia web:

Navigazione al Sito Principale: Chiudere o ignorare la pagina della documentazione e dirigere il browser verso l'indirizzo operativo principale: [https://github.com](https://github.com).

Autenticazione nel Sistema: Se la sessione non è attiva, effettuare l'accesso (Sign in) utilizzando le proprie credenziali (nome utente o email e password).

Accesso alla Dashboard: Una volta autenticati, il sistema reindirizza l'utente alla schermata principale (Dashboard).

Inizializzazione del Repository: Per iniziare a caricare una cartella o un file, è necessario prima creare uno spazio di archiviazione dedicato. Individuare il pulsante verde con la dicitura New (tipicamente situato nella colonna di sinistra) oppure cliccare sull'icona a forma di + nell'angolo in alto a destra dello schermo, selezionando la voce New repository dal menu a tendina.

Una volta creato questo contenitore vuoto, appariranno le opzioni di caricamento diretto citate in precedenza ("Upload files").

Si desidera procedere con l'elenco dei parametri specifici necessari per la corretta configurazione di un nuovo repository prima del caricamento dei file?

okay ma come mi organziio ? nel snenso io ho vair rgetti uiveistari divisi in carelle eosmeio prgetto rorbtoica e nertro vari file e codcie ceh fanno varie cose mail ogretto er aunico m aocnaveknrti ogni ciodice fa una cos asecfic aocme si divede ? inoltre codice sono di vari firmati inotre ancora ho ance power pint nella crtel anon sso legare dirmate tuto o si come si fa ???

Organizzazione dei Progetti Universitari su GitHub
La gestione di molteplici progetti universitari, caratterizzati da file eterogenei e codici con funzioni specifiche, richiede una strutturazione gerarchica rigorosa. L'architettura ottimale prevede la separazione logica degli argomenti e l'uso di convenzioni standard per la denominazione delle directory.

1. Regola Base: Un Repository per Ogni Progetto
La convenzione fondamentale nello sviluppo software e nell'ingegneria stabilisce che ogni progetto indipendente deve corrispondere a un repository dedicato. Non è considerata una buona pratica creare un unico grande repository generale (es. "Esami_Universitari") contenente tutti i corsi.

Per un progetto complesso nell'ambito della biorobotica o dell'ergonomia, andrà quindi generato un singolo repository che conterrà esclusivamente il codice, le simulazioni e le presentazioni pertinenti a quello specifico elaborato. L'integrazione di componenti che svolgono compiti differenti avviene poi tramite la struttura delle cartelle interne e un file di documentazione centrale.

2. Strutturazione delle Directory Interne
All'interno del repository dedicato, i codici sorgente scritti in vari formati e i file di calcolo devono essere segmentati in base alla loro funzione. Un progetto multidisciplinare che integra l'elaborazione di dati, la modellazione fisica e lo sviluppo di script può essere suddiviso come segue:

/src (Source): Cartella destinata esclusivamente ai codici sorgente eseguibili (es. script .py per l'analisi dei dati o script di calcolo).

/models o /simulations: Directory riservata ai file di modellazione avanzata e simulazione (es. archivi .slx di Simulink, workspace operativi, o geometrie in formati specifici per software agli elementi finiti come COMSOL).

/data: Spazio di archiviazione per i dataset grezzi in ingresso o i risultati esportati in uscita dai codici.

/docs (Documentation): Cartella dedicata alla documentazione testuale, alle relazioni e al materiale visivo.

3. Gestione di File Binari e Presentazioni (PowerPoint)
È tecnicamente possibile e consentito caricare file non testuali, come presentazioni PowerPoint (.pptx), documenti PDF o immagini di riferimento, all'interno di un repository GitHub. Tali elementi si collocano tipicamente nella directory /docs citata precedentemente.

Occorre tuttavia considerare la natura del sistema di controllo di versione. Git è ottimizzato per i file di testo. Mentre per un file di codice è possibile tracciare analiticamente l'aggiunta o la rimozione di singole stringhe o algoritmi, per un file PowerPoint il sistema registrerà semplicemente la sovrascrittura dell'intero file binario, senza mostrare le differenze di contenuto riga per riga tra una versione e l'altra. Pertanto, la procedura standard prevede il caricamento delle presentazioni PowerPoint preferibilmente nelle loro versioni consolidate o finali.

4. Configurazione Iniziale (Analisi dell'immagine image_304a27.png)
L'immagine di riferimento image_304a27.png illustra l'interfaccia esatta per la creazione dello spazio di lavoro descritto nel punto 1. I campi devono essere compilati applicando le seguenti specifiche tecniche:

Repository name: Il titolo deve descrivere in modo inequivocabile l'ambito tecnico. Si omettono gli spazi, sostituibili con trattini (es. controllo-cinematico-braccio-robotico).

Description: Una sintesi concisa dell'obiettivo accademico o della funzione del sistema sviluppato.

Visibility (Public / Private): L'opzione va impostata in base alle necessità di condivisione; un'impostazione "Public" risulta utile per la creazione di un portfolio tecnico revisionabile da soggetti terzi.

Add README: L'attivazione di questa opzione (presentata nello stato 'On' nell'immagine) è di primaria importanza. Essa genera un file di testo README.md che funge da manuale introduttivo del progetto. Al suo interno è necessario documentare esplicitamente la funzione di ogni specifico codice, le modalità di interazione tra i vari file e le istruzioni operative per l'avvio delle simulazioni.

Add .gitignore: Questo menù a tendina risulta fondamentale per progetti operanti su ambienti di sviluppo misti. La selezione di un template associato allo strumento software principale (es. Python o MATLAB) istruisce il sistema a ignorare automaticamente il caricamento di file temporanei, cache o output di compilazione generati durante l'esecuzione locale, garantendo che il repository remoto mantenga un'architettura snella.

Quale specifico linguaggio di programmazione o ambiente di sviluppo costituisce la struttura algoritmica portante del progetto, al fine di individuare il corretto template per l'impostazione del parametro di esclusione dei file di sistema?

oklayt eora ch faccio erhc eagruid alo scereben ho vari caretlle dle gteoo bioemcanica e vari codice psoto tutta la crela opre singolo codice ala volta ? non so co afare .

La gestione iniziale di un progetto complesso tramite sistemi di versionamento può generare disorientamento, ma l'applicazione di protocolli standardizzati semplifica nettamente il processo.

Gestione e Caricamento di Progetti Strutturati su GitHub
Nei progetti software strutturati, come i sistemi di elaborazione biomeccanica o robotica, l'architettura dei file e delle cartelle costituisce parte integrante della logica del codice. Il file di esecuzione principale (evidenziato come main in image_3b2443.png) richiama le interfacce grafiche (GUI.ui, theme2.qss) e i vari sottomoduli operativi (kalman, detection, segmentation) basandosi rigorosamente sui percorsi relativi e sulla loro esatta collocazione nel disco.

Pertanto, la regola procedurale impone che non si debba mai caricare un singolo file alla volta alterando la struttura originaria, bensì è obbligatorio trasferire l'intero ambiente di lavoro mantenendo la gerarchia intatta. Frammentare l'upload o inserire tutti i codici in un'unica lista piatta comporterebbe la corruzione dei percorsi di importazione e il conseguente fallimento in fase di compilazione o esecuzione del software.

Protocollo Operativo (Riferimento: image_3b2443.png)
Per preservare l'integrità del sistema, le operazioni di caricamento devono seguire questo schema tecnico:

Trasferimento in Blocco (Drag & Drop): Qualora si operi tramite l'interfaccia web di GitHub, è necessario selezionare la totalità degli elementi visibili nella directory di lavoro (sia le directory come calibrazione o joint_angles, sia i file radice come mano_robotica_simulata) e trascinarli simultaneamente nell'area di upload del repository. Il sistema di hosting ricreerà automaticamente l'alberatura delle cartelle riposizionando i file al loro interno in modo speculare.

Gestione dei Dati (Directory DATI_SALVATI): Nell'ingegneria del software, gli ambienti Git sono ottimizzati per tracciare le variazioni del testo (codice sorgente), non per lo stoccaggio di file binari pesanti o database generati dinamicamente. Se la cartella DATI_SALVATI contiene vettori di dati massivi, file video o log di esportazione, ne è sconsigliato il caricamento per non saturare la memoria del repository remoto.

Ottimizzazione della Documentazione: Il documento di testo denominato read_me svolge la funzione di manuale utente. Per garantire la formattazione automatica sulla piattaforma, è procedura standard modificare l'estensione del file trasformandolo in README.md (Markdown). Questo accorgimento permette a GitHub di proiettarlo automaticamente come pagina di presentazione ufficiale del progetto.

Si desidera analizzare la procedura tecnica per istruire il sistema a ignorare automaticamente la cartella DATI_SALVATI durante le fasi di caricamento, mediante la configurazione di un file .gitignore?

qundi coa devo are dmmi step by step

L'immagine fornita, image_3b2823.png, mostra l'interfaccia operativa del repository GitHub correttamente inizializzato e contenente il file di documentazione introduttivo. Per procedere al trasferimento dell'intero ambiente di lavoro strutturato, è necessario seguire una specifica sequenza di operazioni.

Di seguito è riportata la procedura operativa dettagliata per completare il caricamento.

Procedura di Caricamento in Blocco (Upload Files)
Selezione della Funzione di Caricamento:
All'interno del menu a tendina aperto e visibile nell'immagine, cliccare in modo esplicito sulla voce Upload files. L'interfaccia web verrà reindirizzata a una nuova pagina dedicata al trasferimento dei dati.

Preparazione dell'Ambiente Locale:
Aprire la finestra del proprio sistema operativo (Esplora File) contenente la cartella del progetto. Selezionare contemporaneamente tutti i file e le sottocartelle che si desidera trasferire (es. main, le cartelle detection, kalman, ecc.). Durante questa selezione, escludere omettendo la spunta dalla cartella dei dati massivi (es. DATI_SALVATI) per evitare la saturazione dello spazio e lunghi tempi di caricamento.

Esecuzione del Trasferimento (Drag & Drop):
Trascinare l'intero blocco di elementi selezionati all'interno dell'area tratteggiata presente nella nuova pagina di GitHub, generalmente contrassegnata dall'istruzione "Drag files here to add them to your repository".

Fase di Elaborazione e Sincronizzazione:
Attendere il caricamento di tutti i file. L'interfaccia genererà un elenco progressivo di tutti gli elementi acquisiti. È fondamentale non ricaricare o chiudere la scheda del browser durante questa fase, onde evitare l'interruzione del trasferimento. GitHub si occuperà autonomamente di ricostruire la corretta gerarchia delle cartelle.

Compilazione dei Metadati di Commit:
Al termine del caricamento, scorrere l'interfaccia verso il basso fino a individuare il modulo denominato Commit changes. Il "Commit" rappresenta la registrazione ufficiale delle modifiche apportate al repository.

Registrazione e Salvataggio (Commit Changes):

Nel campo di testo principale (titolo del commit), inserire una descrizione tecnica e concisa dell'operazione. Un esempio di nomenclatura standard è: Initial commit: caricamento della struttura algoritmica e moduli FSM.

Verificare che sia attiva l'opzione predefinita "Commit directly to the main branch", la quale istruisce il sistema a salvare i file nel ramo principale del progetto.

Cliccare sul pulsante verde Commit changes per finalizzare l'operazione in modo definitivo. Il sistema elaborerà il pacchetto e riporterà l'utente alla schermata principale, dove sarà visibile l'intero progetto strutturato.

Analizzando l'immagine image_3b2c46.png, sei arrivato alla schermata finale corretta per salvare i file, ma c'è un errore critico da correggere prima di procedere.

Attenzione: Mancano le Cartelle
Come puoi notare dall'elenco nella schermata, il sistema ha preso solo i 4 file singoli (GUI.ui, main.py, mano_robotica_simulata, theme2.qss). Tutte le cartelle fondamentali che avevi mostrato prima (come kalman, detection, segmentation, ecc.) non ci sono.

Se procedi adesso, il caricamento sarà incompleto. Quando proverai a far girare il programma, main.py andrà in errore perché non troverà i moduli necessari. Questo problema si verifica solitamente quando si utilizza il tasto testuale "choose your files", che per limitazioni dei browser permette di selezionare solo file sciolti e non le cartelle.

Come Risolvere e Concludere (Step-by-Step)
Ecco i passaggi esatti per caricare tutto correttamente:

Annulla l'operazione parziale: Clicca sul pulsante grigio Cancel situato in basso (di fianco al pulsante verde "Commit changes").

Torna alla fase di Upload: Ritorna sulla pagina principale del tuo repository e clicca nuovamente su Add file > Upload files.

Usa esclusivamente il Drag & Drop: Apri la finestra del tuo computer dove hai la cartella del progetto. Seleziona tutto il blocco (sia le cartelle come kalman, sia i file come main.py), tralasciando solo la cartella DATI_SALVATI.

Trascina i file: Clicca col tasto sinistro sui file selezionati, tieni premuto, spostati sulla finestra del browser e rilasciali al centro della pagina di GitHub.

Verifica il caricamento: Attendi che la barra di elaborazione finisca. Questa volta, l'elenco dei file dovrà essere molto più lungo e dovrai vedere i percorsi completi (ad esempio kalman/nome_script.py).

Scrivi il messaggio di Commit: Una volta che sei certo che tutti i file e le sottocartelle siano presenti nell'elenco, scendi fino al riquadro Commit changes. Nel primo campo di testo, scrivi una breve descrizione (es. "Caricamento iniziale della struttura e dei moduli").

Finalizza: Lascia la spunta su "Commit directly to the main branch" e clicca sul pulsante verde Commit changes.

Attendi qualche secondo l'elaborazione del server: verrai riportato alla pagina principale e vedrai la tua architettura di cartelle perfettamente replicata su GitHub.

di do i mie codie dammi un read me per sgare oigni codice cosa fa eprche e coem nel dettaglio .

Il tuo file Markdown è pronto
Icona MD
README
 MD 
Apri

Ho analizzato i codici sorgente che compongono il tuo progetto di Biorobotica e State Estimation. I file sono stati organizzati nel README.md (scaricabile qui sopra e pronto per essere inserito nel tuo repository) suddividendo chiaramente le responsabilità di ciascuno.

Per comodità di consultazione o se preferisci fare copia-incolla direttamente su GitHub, ecco il contenuto esteso della documentazione generata:

Visual-Tracking e State Estimation: Robotica Mobile
Questo repository contiene l'intero stack software per il controllo, l'acquisizione dati e la stima dello stato (localizzazione) di un robot mobile a trazione differenziale. Il progetto integra la programmazione a basso livello (microcontrollore PIC) con l'elaborazione ad alto livello e l'interfaccia grafica (MATLAB).

Architettura dei Codici
Il progetto si compone di 4 file/script fondamentali. Di seguito la documentazione dettagliata per ciascuno.

1. Script di Analisi Offline ed EKF (analisi_offline.m)
Cosa fa:
Esegue la localizzazione del robot elaborando un set di dati pre-registrato (dati_encoder.mat). Mette a confronto la traiettoria calcolata tramite pura odometria (dead reckoning) con la traiettoria ottimizzata da un Filtro di Kalman Esteso (EKF).

Perché è presente:
Permette di effettuare il tuning (calibrazione) delle matrici di covarianza (P,Q,R) e dei parametri del LIDAR in un ambiente controllato. È fondamentale per assicurarsi che la matematica del filtro funzioni prima di testarla in tempo reale sul robot.

Come funziona nel dettaglio:

Filtraggio Dati (Cleaning): Carica le letture raw di LIDAR ed encoder. Rimuove gli outlier (valori anomali) dal LIDAR scartando i dati che si discostano di oltre 3 deviazioni standard (z_thresh = 3) e applica una media mobile per "lisciare" il segnale.

Calibrazione LIDAR: Converte la tensione (dedotta dai bit dell'ADC) in una distanza metrica reale utilizzando un modello di regressione di potenza non lineare: distanza=(V/a) 
1/b
 .

Modello Cinematico: Converte i tick degli encoder in radianti gestendo il rollover a 4096 (il giro completo dell'encoder). Calcola l'avanzamento lineare (Δs) e la rotazione (Δθ). Applica il metodo di Runge-Kutta per aggiornare accuratamente la posa odometrica.

Filtro di Kalman (EKF): Fonde la predizione odometrica con la misura del LIDAR (usato per rilevare la distanza da una parete di riferimento laterale, Y_wall = 0). Include una funzione adattive_w per ridurre il peso della correzione LIDAR se il robot legge un ostacolo imprevisto, rendendo il filtro robusto.

2. Firmware del Microcontrollore (firmware_PIC16F887.c)
Cosa fa:
Costituisce il "cervello" a basso livello installato fisicamente sul robot. Legge continuamente i sensori e invia i dati a MATLAB, mentre contemporaneamente riceve comandi da MATLAB per pilotare i motori.

Perché è presente:
Un computer standard (con MATLAB) non può generare direttamente i segnali elettrici PWM temporizzati né leggere tensioni analogiche con la precisione temporale richiesta. Il PIC funge da ponte hardware/software indispensabile.

Come funziona nel dettaglio:

Acquisizione Sensori: Interroga via I2C due sensori magnetici per leggere l'angolo delle due ruote e interroga l'ADC integrato per leggere la tensione analogica restituita dal sensore LIDAR.

Controllo Motori (PWM Software): Sfruttando l'interrupt del Timer2, il codice genera a ciclo continuo impulsi precisi della durata di ∼1500μs (valore di riposo per i servomotori a rotazione continua). Variando il tempo in alto (thsx e thdx), regola la velocità delle singole ruote.

Protocollo Seriale (Bluetooth): Implementa un protocollo di comunicazione robusto. Trasmette pacchetti seriali formattati con un byte di start (0xAA) seguito dai dati di encoder e LIDAR spezzati in MSB ed LSB. Quando riceve istruzioni via Bluetooth da MATLAB, disattiva temporaneamente gli interrupt per aggiornare in sicurezza i registri di velocità dei motori.

3. Interfaccia Grafica di Controllo (Interfaccia.m)
Cosa fa:
È il pannello di controllo front-end (GUI creata con GUIDE di MATLAB). Permette all'utente di connettersi al robot via Bluetooth e di guidarlo come con un joystick tramite l'uso di pulsanti direzionali.

Perché è presente:
Traduce l'intenzione di movimento dell'utente (es. "Vai a destra", "Fermati") in complesse istruzioni di tensione per i motori in base alla cinematica differenziale del robot.

Come funziona nel dettaglio:

Connessione: Tramite il pulsante di connessione, inizializza un oggetto Bluetooth diretto al modulo "GRUPPO8" e lo salva nel Workspace globale per poter essere richiamato da altre funzioni.

Cinematica Inversa: Ogni funzione callback (W, A, S, D, Q, E, ecc.) definisce un set target di velocità lineare (v) e velocità angolare (ω). Usa le formule del robot a trazione differenziale per scomporre questi target nella velocità di rotazione della singola ruota destra e sinistra.

Trasmissione Comandi: Mappa le velocità rotazionali necessarie nel rispettivo valore temporale PWM e li invia al microcontrollore impacchettandoli come numeri interi a 16-bit (uint16).

4. Tracking, Navigazione e Mappatura (RealTime_Tracking.m)
Cosa fa:
È il file operativo da eseguire durante l'esperimento dal vivo. Gestisce il processo di State Estimation istante per istante, plottando la posizione del robot su una mappa a schermo mentre si muove.

Perché è presente:
Senza questo script, i dati in arrivo dai sensori verrebbero ignorati. Questo modulo unisce i dati in arrivo dai sensori alla matematica validata nello script offline, elaborando tutto in real-time.

Come funziona nel dettaglio:

Inizializzazione e Mappa: Attende l'attivazione della connessione Bluetooth stabilita dall'Interfaccia. Carica il file MappaOstacoliKalman.mat contenente i poligoni degli ostacoli per tracciare a schermo l'ambiente circostante.

Parsing Live (Demuxing): Entra in un ciclo infinito. Legge costantemente i byte seriali, attende l'arrivo dell'header 0xAA per confermare l'integrità del pacchetto, quindi ricostruisce le word a 16-bit unendo i byte MSB ed LSB inviati dal PIC.

Localizzazione EKF Live: Una volta ottenuta la distanza in metri e l'avanzamento radiale, aggiorna al volo la predizione di Runge-Kutta e applica il Filtro di Kalman in diretta, misurando la distanza in riferimento alla parete impostata a Y_wall = 1.4.

Tracciamento Dinamico (Live Plotting): Sfrutta la funzione animatedline di MATLAB per disegnare due linee in tempo reale: una rossa che rappresenta l'odometria grezza, e una blu che mostra il percorso corretto dall'EKF, fornendo un feedback visivo immediato sulle prestazioni dell'algoritmo. A fine ciclo, esporta i log nell'archivio dati_encoder.mat.

Gemini è un'AI e può commettere errori, anche in merito a persone. La tua privacy e GeminiSi apre in una nuova finestra




# Visual-Tracking e State Estimation: Robotica Mobile

Questo repository contiene l'intero stack software per il controllo, l'acquisizione dati e la stima dello stato (localizzazione) di un robot mobile a trazione differenziale. Il progetto integra la programmazione a basso livello (microcontrollore PIC) con l'elaborazione ad alto livello e l'interfaccia grafica (MATLAB).

---

## Architettura dei Codici

Il progetto si compone di 4 file/script fondamentali. Di seguito la documentazione dettagliata per ciascuno.

### 1. Script di Analisi Offline ed EKF (`analisi_offline.m`)
**Cosa fa:** 
Esegue la localizzazione del robot elaborando un set di dati pre-registrato (`dati_encoder.mat`). Mette a confronto la traiettoria calcolata tramite pura odometria (dead reckoning) con la traiettoria ottimizzata da un Filtro di Kalman Esteso (EKF).

**Perché è presente:** 
Permette di effettuare il *tuning* (calibrazione) delle matrici di covarianza ($P, Q, R$) e dei parametri del LIDAR in un ambiente controllato. È fondamentale per assicurarsi che la matematica del filtro funzioni prima di testarla in tempo reale sul robot.

**Come funziona nel dettaglio:**
*   **Filtraggio Dati (Cleaning):** Carica le letture raw di LIDAR ed encoder. Rimuove gli *outlier* (valori anomali) dal LIDAR scartando i dati che si discostano di oltre 3 deviazioni standard (`z_thresh = 3`) e applica una media mobile per "lisciare" il segnale.
*   **Calibrazione LIDAR:** Converte la tensione (dedotta dai bit dell'ADC) in una distanza metrica reale utilizzando un modello di regressione di potenza non lineare: $distanza = (V/a)^{1/b}$.
*   **Modello Cinematico:** Converte i tick degli encoder in radianti gestendo il *rollover* a 4096 (il giro completo dell'encoder). Calcola l'avanzamento lineare ($\Delta s$) e la rotazione ($\Delta 	heta$). Applica il metodo di **Runge-Kutta** per aggiornare accuratamente la posa odometrica.
*   **Filtro di Kalman (EKF):** Fonde la predizione odometrica con la misura del LIDAR (usato per rilevare la distanza da una parete di riferimento laterale, `Y_wall = 0`). Include una funzione `adattive_w` per ridurre il peso della correzione LIDAR se il robot legge un ostacolo imprevisto, rendendo il filtro robusto.

---

### 2. Firmware del Microcontrollore (`firmware_PIC16F887.c`)
**Cosa fa:** 
Costituisce il "cervello" a basso livello installato fisicamente sul robot. Legge continuamente i sensori e invia i dati a MATLAB, mentre contemporaneamente riceve comandi da MATLAB per pilotare i motori.

**Perché è presente:** 
Un computer standard (con MATLAB) non può generare direttamente i segnali elettrici PWM temporizzati né leggere tensioni analogiche con la precisione temporale richiesta. Il PIC funge da ponte hardware/software indispensabile.

**Come funziona nel dettaglio:**
*   **Acquisizione Sensori:** Interroga via I2C (`AS5600_ADDRESS`) due sensori magnetici per leggere l'angolo delle due ruote e interroga l'ADC integrato (canale 2) per leggere la tensione analogica restituita dal sensore LIDAR.
*   **Controllo Motori (PWM Software):** Sfruttando l'interrupt del Timer2 (`timer2_isr`), il codice genera a ciclo continuo impulsi precisi della durata di $\sim 1500 \mu s$ (valore di riposo per i servomotori a rotazione continua). Variando il tempo in alto (`thsx` e `thdx`), regola la velocità delle singole ruote.
*   **Protocollo Seriale (Bluetooth):** Implementa un protocollo di comunicazione robusto. Trasmette pacchetti seriali formattati con un byte di start (`0xAA`) seguito dai dati di encoder e LIDAR spezzati in MSB (Most Significant Byte) ed LSB (Least Significant Byte). Quando riceve istruzioni via Bluetooth (byte di riconoscimento `1` o `170`), disattiva temporaneamente gli interrupt per aggiornare in sicurezza i registri di velocità dei motori evitando corruzioni nei dati.

---

### 3. Interfaccia Grafica di Controllo (`Interfaccia.m`)
**Cosa fa:** 
È il pannello di controllo front-end (GUI creata con GUIDE di MATLAB). Permette all'utente di connettersi al robot via Bluetooth e di guidarlo come con un joystick tramite l'uso di pulsanti direzionali.

**Perché è presente:** 
Traduce l'intenzione di movimento dell'utente (es. "Vai a destra", "Fermati") in complesse istruzioni di tensione per i motori in base alla cinematica differenziale del robot.

**Come funziona nel dettaglio:**
*   **Connessione:** Tramite il pulsante di connessione, inizializza un oggetto Bluetooth diretto al modulo `"GRUPPO8"` e lo salva nel Workspace globale per poter essere richiamato da altre funzioni.
*   **Cinematica Inversa:** Ogni funzione callback (W, A, S, D, Q, E, ecc.) definisce un set target di velocità lineare ($v$) e velocità angolare ($\omega$). Usa le formule del robot a trazione differenziale: $\omega_{sx} = rac{v}{r} + rac{\omega d}{2r}$ per scomporre questi target nella velocità di rotazione della singola ruota destra e sinistra.
*   **Trasmissione Comandi:** Mappa le velocità rotazionali necessarie nel rispettivo valore temporale PWM (partendo dalla base di ferma a 1500) e li invia al microcontrollore impacchettandoli come numeri interi a 16-bit (`uint16`).

---

### 4. Tracking, Navigazione e Mappatura (`RealTime_Tracking.m`)
**Cosa fa:** 
È il file operativo da eseguire durante l'esperimento dal vivo. Gestisce il processo di **State Estimation** istante per istante, plottando la posizione del robot su una mappa a schermo mentre si muove.

**Perché è presente:** 
Senza questo script, i dati in arrivo dai sensori verrebbero ignorati. Questo modulo chiude il loop: unisce i dati in arrivo dai sensori alla matematica validata nello script offline, elaborando tutto in *real-time*.

**Come funziona nel dettaglio:**
*   **Inizializzazione e Mappa:** Attende l'attivazione della connessione Bluetooth stabilita dall'Interfaccia. Carica il file `MappaOstacoliKalman.mat` contenente i poligoni degli ostacoli per tracciare a schermo l'ambiente circostante.
*   **Parsing Live (Demuxing):** Entra in un ciclo infinito. Legge costantemente i byte seriali, attende l'arrivo dell'header `0xAA` per confermare l'integrità del pacchetto, quindi ricostruisce le word a 16-bit unendo i byte MSB ed LSB inviati dal PIC per i due encoder e il LIDAR.
*   **Localizzazione EKF Live:** Una volta ottenuta la distanza in metri e l'avanzamento radiale, aggiorna al volo la predizione di Runge-Kutta e applica il Filtro di Kalman in diretta, misurando la distanza in riferimento alla parete (impostata a `Y_wall = 1.4`).
*   **Tracciamento Dinamico (Live Plotting):** Sfrutta la funzione `animatedline` di MATLAB per disegnare due linee: una linea rossa che rappresenta l'odometria grezza, e una linea blu che mostra il percorso corretto dall'EKF, fornendo all'utente un feedback visivo immediato sulle prestazioni dell'algoritmo di localizzazione. A fine ciclo, esporta i log nell'archivio `dati_encoder.mat`.
README.md
Visualizzazione di README.md.
