# ☁️ Skysikkerhet – Eksamensprosjekt

Dette repoet inneholder en eksamensbesvarelse fra faget **Skysikkerhet** ved Høyskolen Kristiania.  
Oppgaven tok for seg migrering av en legacy-applikasjon til skyen, med fokus på **kostnadseffektivitet, fleksibilitet og sikkerhet**.

📌 **Karakter: A** – Besvarelsen ble vurdert til toppkarakter.  

---

## 📑 Innhold

- **Migreringsstrategi**  
  - Valgt løsning: *Lift and Shift* (Rehost)  
  - Begrunnelse: Stram tidsramme, begrenset budsjett, og krav til å beholde legacy-applikasjonen  

- **Cloud-modell**  
  - Valgt: *Infrastructure-as-a-Service (IaaS)*  
  - Gir kontroll over applikasjoner og OS, men skyfordeler som skalerbarhet og kostnadseffektivitet  

- **Deploy-region**  
  - GCP europe-north1 (Finland)  
  - Lav latency for norske brukere, i tråd med GDPR  

- **Infrastruktur og skalerbarhet**  
  - Bygget med Terraform (Infrastructure as Code)  
  - Lastbalansering for høy tilgjengelighet og fleksibilitet  
  - Backup og recovery via automatiserte snapshots  

- **Sikkerhetstiltak**  
  - Web Application Firewall (Google Cloud Armor) med regler mot SQLi og XSS  
  - Isolert VPC med brannmurregler (kun HTTP/HTTPS)  
  - VPC Flow Logs for overvåking  
  - Integrasjon med SIEM (Splunk) via Cloud Logging + Dataflow  

- **DevSecOps og beste praksis**  
  - Sikkerhet implementert fra start gjennom IaC og tfsec-analyse  
  - Automatisering og overvåking for kontinuerlig forbedring  
  - Fokus på delt ansvar mellom kunde og skyleverandør  

---

## 🛠️ Teknologier og verktøy

- Google Cloud Platform (GCP)  
- Terraform  
- Google Cloud Armor (WAF)  
- Splunk (SIEM-integrasjon)  
- Tfsec (kode-sikkerhetsanalyse)  

---

## 📈 Læringsutbytte

- Praktisk erfaring med **migreringsstrategier til skyen**  
- Implementering av en **sikker og skalerbar infrastruktur med Terraform**  
- Innsikt i **delt ansvar, DevSecOps og SIEM-integrasjon**  
- Evne til å vurdere fordeler, ulemper og sikkerhetsutfordringer i skytjenester  

---

## 📜 Lisens

Dette prosjektet er laget som en del av eksamen i **Skysikkerhet** ved Høyskolen Kristiania.  
Koden og dokumentasjonen kan fritt brukes til læringsformål.
