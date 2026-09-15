# Validating-Computer-Simulations

### Statistical validation of expensive stochastic computer simulations under limited real-world information

## Goal

Complex simulations are increasingly easy to build with AI tools, but remain difficult to validate.

This project studies how to determine whether a stochastic simulator is a reasonable representation of reality when simulations are expensive, parameters are uncertain, outputs are stochastic, and only limited real-world data are available for comparison.

Applications include engineering, traffic, policy, agent-based, and other stochastic computer simulations.

The main challenge is deciding:

* where to simulate
* when to replicate
* when to stop
* what conclusions the available evidence supports

A particular difficulty is that many parameter combinations can produce similar emergent behavior. This motivates connections to prior predictive checking, emulation, history matching, and simulation-based validation.

The project will combine literature review with controlled simulation studies. We will begin with a lightweight stochastic simulator with a known data-generating system before moving to more complex applications.

## Core Questions

* What does it mean for a simulator to be valid?
* How should plausible parameter ranges be defined?
* Where should simulations be run?
* How many runs and replicates are needed?
* When should we explore versus replicate?
* How should emulators support validation?
* How can history matching identify plausible parameter regions?
* When is there enough evidence to stop?
* How should calibration and validation be separated?

## Framework

```text
Parameter space
      ↓
Simulation design
      ↓
Stochastic simulator
      ↓
Emulation
      ↓
Comparison with reality
      ↓
Plausible parameter region
      ↓
Validation
```

Each stage will be developed separately through literature review, simulation studies, and applications.
