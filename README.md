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
3. [GUI Overview](#gui-overview)
4. [Simulation Parameters](#simulation-parameters)
5. [How the Code Works](#how-the-code-works)
6. [License](#license)

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
   To start the simulation, run the Main.m script, and adjust the parameters as showned in the [GUI Overview](#gui-overview). To stop the code close the figure window.

   ## GUI Overview

The simulation includes a user-friendly graphical interface that allows you to customize the behavior of the simulation. Here’s a breakdown of the key GUI components:

1. **Angle of Attack (AoA) Slider**
   - **Function**: Adjusts the angle of the obstacle or airfoil in relation to the fluid flow.
   - **Usage**: Slide to increase or decrease the angle (in degrees) from -45° to 45°. This affects how the flow interacts with the object.
   - **Example**: Increasing the AoA simulates how an airfoil behaves at different attack angles, influencing lift and drag forces.

2. **Displacement (Up) Slider**
   - **Function**: Moves the obstacle or airfoil vertically within the grid.
   - **Usage**: Use the slider to move the obstacle up. The position affects where the object interacts with the flow within the simulation.
   - **Range**: From 0 to the maximum grid height.

3. **Displacement (Right) Slider**
   - **Function**: Moves the obstacle or airfoil horizontally within the grid.
   - **Usage**: Use the slider to move the object horizontally across the simulation grid. This can be useful for adjusting the position of the object relative to the flow source.
   - **Range**: From 0 to the maximum grid width.

4. **Grid Size Dropdown**
   - **Function**: Selects the number of grid points used in the simulation.
   - **Usage**: Choose from predefined grid sizes (e.g., 40, 50, 60). Larger grid sizes result in finer simulations but may require more computational power.
   - **Example**: A grid size of 40 provides a coarse resolution, while a grid size of 80 offers more detailed fluid behavior.

5. **Aspect Ratio Dropdown**
   - **Function**: Adjusts the ratio of the simulation area’s width to its height.
   - **Usage**: Choose different aspect ratios to simulate flow in differently shaped domains. For example, a higher aspect ratio allows you to simulate a longer simulation domain.

6. **Obstacle Size Dropdown**
   - **Function**: Adjusts the size of the obstacle or airfoil in the simulation.
   - **Usage**: Choose the size of the obstacle to see how different-sized objects affect the fluid flow. Larger obstacles cause more significant disruption to the flow.
   - **Range**: From 50 to 250, where larger values represent larger obstacles.

7. **Simulation Preview**
   - **Function**: Displays a real-time preview of the simulation environment, reflecting any changes you make to the parameters.
   - **Usage**: As you modify parameters in the GUI, the preview will update accordingly, giving you immediate feedback on how the changes will affect the simulation.
   - **Example**: If you increase the obstacle size or change the AoA, the visual representation of the obstacle and fluid flow will change in the preview.

8. **Start Simulation Button**
   - **Function**: Runs the fluid simulation with the current parameters set in the GUI.
   - **Usage**: Once you've adjusted the simulation parameters to your liking, click this button to start the simulation. The simulation window will open, showing fluid particles interacting with the obstacle.
   - **Example**: After adjusting AoA and obstacle size, pressing **Start Simulation** will run the simulation and show the fluid dynamics in action.

---

### Key Interaction Summary:
- **Angle of Attack**: Adjust the angle of the object.
- **Displacement**: Move the object up or right in the grid.
- **Grid Size**: Control the resolution of the grid.
- **Aspect Ratio**: Change the simulation domain shape.
- **Obstacle Size**: Adjust the size of the object.
- **Simulation Preview**: Visualize how changes in parameters affect the simulation before running it.

