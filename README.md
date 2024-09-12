# Fluid Simulation in MATLAB

This project is a 2D fluid simulation that models incompressible flow around obstacles using MATLAB. The simulation is based on the Navier-Stokes equations and incorporates viscous effects, pressure fields, and boundary conditions. It includes a graphical user interface (GUI) that allows users to interactively change parameters like grid size, obstacle size, angle of attack, and displacement.

## Features
- **User Interface (UI)**: Change simulation parameters like grid size, aspect ratio, obstacle size, and angle of attack (AoA).
- **2D Fluid Dynamics Simulation**: Implements a fluid simulation using pressure, velocity, and boundary condition modeling.
- **Airfoil Simulation**: Models airfoil interaction with fluid flow based on user-defined parameters.
- **Customizable Parameters**: Users can modify the grid size, obstacle position, and more.
- **Viscous Effects**: Adds viscosity to simulate realistic fluid behavior.

---

## Table of Contents
1. [Installation](#installation)
2. [Usage](#usage)
4. [GUI and Parameters](#gui-and-parameters)
6. [How the Code Works](#how-the-code-works)
7. [License](#license)

---

## Installation

1. **Clone the Repository**
   To get started, clone the repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/FluidSimulation.git
   cd FluidSimulation

2. **Open in MATLAB**
   Open MATLAB and navigate to the folder where you cloned the repository.
   Ensure that all necessary .m files and the GUI scripts are available in MATLAB's path.

3. **Running the Main Script**
   To start the simulation, run the Main.m script, and adjust the parameters as showned in the [GUI and Parameters](#gui-and-parameters). To stop the code close the figure window.

---

   ## GUI Overview

The simulation includes a user-friendly graphical interface that allows you to customize the behavior of the simulation. Here’s a breakdown of the key GUI components:

1. **Angle of Attack (AoA) Slider**
   - **Function**: Adjusts the angle at which the airfoil or obstacle interacts with the incoming fluid flow.
   - **Usage**: Slide to increase or decrease the angle from -45° to 45°. A higher AoA can simulate more lift (up to stall) but may cause more drag or flow separation.

2. **Disp Up Slider**
   - **Function**: Change airfoil vertical position within the grid.
   - **Usage**: Use the slider to move the obstacle up from 0 to the maximum grid height.

3. **Disp Right Slider**
   - **Function**: Change airfoil horizontal position within the grid.
   - **Usage**: Use the slider to move the object horizontally across the simulation grid from 0 to the maximum grid width. 

4. **Grid Size Dropdown**
   - **Function**: Selects the number of grid points used in the simulation representing the spatial domain.
   - **Usage**: Larger grid sizes increase the resolution of the simulation, leading to more accurate results but at the cost of more computational resources.

5. **Aspect Ratio Dropdown**
   - **Function**: Adjusts the ratio of the simulation area’s width to its height.
   - **Usage**: Choose different aspect ratios to simulate flow in differently shaped domains. For example, a higher aspect ratio allows you to simulate a longer simulation domain.

6. **Obstacle Size Dropdown**
   - **Function**: Adjusts the size of the obstacle or airfoil in the simulation.
   - **Usage**: Choose the size of the obstacle to see how different-sized objects affect the fluid flow.

7. **Simulation Preview**
   Displays a real-time preview of the simulation environment, reflecting any changes you make to the parameters. As you modify parameters in the GUI, the preview will update accordingly, giving you immediate feedback     on how the changes will affect the simulation.

8. **Start Simulation Button**
   - **Function**: Runs the fluid simulation with the current parameters set in the GUI.

