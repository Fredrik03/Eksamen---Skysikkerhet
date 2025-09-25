# ☁️ Skysikkerhet – Konte Eksamen

Dette repoet inneholder eksamensbesvarelsen min i **Skysikkerhet** ved Høyskolen Kristiania.  
Oppgaven tok for seg migrering av en legacy-applikasjon til skyen med fokus på **sikkerhet, skalerbarhet og kostnadseffektivitet**.

📌 **Karakter: A** – Prosjektet ble vurdert til toppkarakter.  

---

## 📑 Innhold

- **Migrasjonsstrategi**  
  - Valgt: **Rehost (Lift-and-Shift)** til Google Compute Engine  
  - Begrunnelse: Rask implementering, lav risiko og budsjettvennlig løsning  

- **Cloud-modell**  
  - Valgt: **IaaS**  
  - Full kontroll over infrastruktur, enkel lift-and-shift og fleksibilitet for fremtidige optimaliseringer  

- **Infrastruktur** (Terraform)  
  - Globalt VPC-nettverk med subnett i Europa, Nord-Amerika, Asia og Australia  
  - Instance Templates og Instance Groups per region  
  - Autoskalering i Europa og Nord-Amerika basert på CPU-belastning  
  - Global HTTPS Lastbalanserer med SSL-sertifikater (Google Managed SSL)  
  - Backup-policyer med snapshots per region (7-dagers retention)  

- **Sikkerhetstiltak**  
  - Web Application Firewall (Google Cloud Armor) med regler mot SQLi, XSS, LFI og RCE  
  - Rate limiting for å forhindre brute-force og DoS-forsøk  
  - VPC Flow Logs for innsikt i trafikk og hendelser  
  - Granulære brannmurregler med minst mulig eksponering  
  - CloudFlare-integrasjon for DDoS-beskyttelse og proxy  

- **CI/CD med GitHub Actions**  
  - Pipeline for å kjøre `gitleaks`, `tfsec`, `terraform fmt`, `terraform validate` og `terraform plan` på hver push  
  - Manuell godkjenning for `terraform apply` og `terraform destroy`  
  - Sikker håndtering av credentials via GitHub Secrets  

---

## 🛠️ Teknologier og verktøy

- **Google Cloud Platform (GCP)**  
- **Terraform** (Infrastructure as Code)  
- **GitHub Actions** (CI/CD)  
- **tfsec** (Terraform security scanning)  
- **Gitleaks** (secret scanning)  
- **Cloud Armor / Cloud Logging / VPC Flow Logs**  
- **CloudFlare** (proxy + DDoS-beskyttelse)  

---

## 📈 Læringsutbytte

- Design og implementasjon av en **sikker og skalerbar skyløsning** i GCP  
- Automatisering med **Terraform** og **GitHub Actions**  
- Bruk av **best practices** innen DevSecOps, logging og sikkerhet  
- Dokumentasjon og risikovurdering av valg (IaaS, lift-and-shift, sikkerhetstiltak)  

---

## 📜 Lisens

Dette prosjektet er laget som en del av eksamen i **Skysikkerhet** ved Høyskolen Kristiania.  
Repoet er kun til bruk i lærings- og demonstrasjonsøyemed.
