# Neonatal Resuscitation Cognitive Aid App

![F-Droid](https://img.shields.io/f-droid/v/com.blockbasti.justanotherworkouttimer?style=for-the-badge)

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Harsh-from-teenShikari/workout_to_nar">
    <img src="/assets/ic_launcher.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Neonatal Resuscitation Cognitive Aid</h3>

  <p align="center">
    A simple, offline-first cognitive aid for the initial steps of neonatal resuscitation.<br>
    Built with Flutter, optimized for high-stress medical scenarios in both high- and low-resource settings.
    <br />
    <br />
    <a href="#about-the-project">About The Project</a>
    ·
    <a href="#roadmap">Roadmap</a>
    ·
    <a href="#screenshots">Screenshots</a>
  </p>
</p>

---

## About The Project

This app is designed to guide healthcare providers through the initial steps of neonatal resuscitation.  
It provides stepwise, time-based prompts, checklists, decision support, and audio/visual cues, all optimized for rapid use in stressful situations.

**Key Features:**
- Stepwise decision support from birth event to stabilization or transfer
- Timer-driven prompts for critical interventions
- Customizable checklists for initial steps and post-procedure documentation
- Large, clear buttons and icons; high-contrast UI
- Audio and vibration cues for urgent actions
- Fully offline functionality; all assets stored locally
- Local data logging and optional secure sync when online
- Data privacy compliant (no patient identifiers stored; encrypted local records)
- Free and Open-Source

### Screenshots

*(Screenshots to be updated as UI changes are made)*

---

## Roadmap

- [ ] Replace workout logic with neonatal resuscitation workflow
- [ ] Update all UI screens for medical decision support
- [ ] Add post-procedure documentation and session logging
- [ ] Refactor local database schema for medical sessions
- [ ] Add offline asset storage for images/audio/icons
- [ ] Implement optional secure sync and basic authentication
- [ ] Update documentation and compliance notes

---

## Contributing

Contributions are welcome!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/medical-update`)
3. Commit your Changes (`git commit -m 'Migrate to neonatal resuscitation app'`)
4. Push to the Branch (`git push origin feature/medical-update`)
5. Open a Pull Request

### Building the app

1. Run `flutter pub get`
2. Install [script_runner](https://pub.dev/packages/script_runner) by running `flutter pub global activate script_runner`
3. Run `scr build`
4. Run `flutter build apk` or run using your IDE

---

Distributed under the MIT License. See `LICENSE` for more information.