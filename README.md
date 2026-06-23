# AWS-SAA-C03

Repository per gli esempi AWS usati durante il corso AWS SAA-C03.
Il progetto include script Bash per lavorare con Amazon S3 e una semplice definizione CloudFormation per la creazione di un bucket.

## Struttura del repository

- `s3/bash-scripts/`
  - `create_bucket.sh` - crea un bucket S3 in una regione specificata.
  - `delete_bucket.sh` - elimina un bucket S3 vuoto.
  - `delete_objects.sh` - elimina tutti gli oggetti presenti in un bucket.
  - `generate_files.sh` - genera file di prova in `./temp` con contenuti casuali.
  - `get_newest_bucket.sh` - mostra il bucket più recente creato nell'account.
  - `list_buckets.sh` - elenca tutti i bucket S3.
  - `list_objects.sh` - elenca oggetti e dimensioni in un bucket specifico.
  - `sync_files.sh` - sincronizza i file locali di `./temp` su un bucket S3.
- `s3/iac/cfn/`
  - `template.yaml` - template AWS CloudFormation per creare un bucket S3 semplice.
  - `deploy/` - directory per eventuali file di deployment (contenuto attuale non incluso nel README).
- `s3/iac/terraform/`
  - cartella vuota riservata per future definizioni Terraform.

## Requisiti

- AWS CLI configurato con credenziali valide.
- `jq` installato per gestire JSON in `delete_objects.sh`.
- Accesso IAM sufficiente per creare, eliminare e leggere bucket S3.

## Uso degli script

### Creare un bucket S3

```bash
./s3/bash-scripts/create_bucket.sh <bucket-name> [region]
```

- `<bucket-name>`: nome del bucket da creare.
- `[region]`: facoltativo, `us-east-1` se non specificato.

### Eliminare un bucket S3

```bash
./s3/bash-scripts/delete_bucket.sh <bucket-name>
```

> Il bucket deve essere vuoto per poter essere eliminato.

### Eliminare tutti gli oggetti da un bucket

```bash
./s3/bash-scripts/delete_objects.sh <bucket-name>
```

### Generare file di test locali

```bash
./s3/bash-scripts/generate_files.sh
```

- I file vengono creati in `./temp`.
- Vengono generati da 5 a 10 file con nomi `file_1.txt`, `file_2.txt`, ecc.

### Sincronizzare file su S3

```bash
./s3/bash-scripts/sync_files.sh <bucket-name> [prefix]
```

- Sincronizza il contenuto di `./temp` verso `s3://<bucket-name>/<prefix>`.
- Se non è specificato alcun prefix, usa `files`.

### Elencare bucket S3

```bash
./s3/bash-scripts/list_buckets.sh
```

### Ottenere il bucket più recente

```bash
./s3/bash-scripts/get_newest_bucket.sh
```

### Elencare oggetti in un bucket

```bash
./s3/bash-scripts/list_objects.sh <bucket-name>
```

## Infrastructure as Code

- `s3/iac/cfn/template.yaml`: template CloudFormation per creare un bucket S3 semplice.
- `s3/iac/terraform/`: spazio riservato per possibili future risorse Terraform.

## Note pratiche

- Prima di usare gli script, assicurati che AWS CLI sia configurato con `aws configure`.
- `delete_objects.sh` crea un file temporaneo `delete.json` durante l'eliminazione.
- `generate_files.sh` sovrascrive la cartella `./temp` ad ogni esecuzione.

## Obiettivo

Questo repository è pensato come laboratorio per imparare ad usare Amazon S3 con script Bash e per esplorare una configurazione IaC base tramite CloudFormation.
