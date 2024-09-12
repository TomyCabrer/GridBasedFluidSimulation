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
   -   Displays a real-time preview of the simulation environment, reflecting any changes you make to the parameters. As you modify parameters in the GUI, the preview will update accordingly, giving you immediate feedback on how the changes will affect the simulation.

8. **Start Simulation Button**
   - **Function**: Runs the fluid simulation with the current parameters set in the GUI.
  
---

   **How the Code Works**

   **Grid Initialization** 
   -   A grid of size 's x (s * ar)' is created where 's' is the grid size, and 'ar' is the aspect ratio (the ratio of width to height). The grid represents the spatial domain in which the fluid flow will be simulated.

   **Initialize Fields**
   -   The pressure 'p' and velocity fields 'u' (horizontal) and 'v' (vertical) are initialized as zero matrices of size '(s x (s * ar))'. These fields will be updated as the simulation proceeds.

   **Obstacle Definition**
   -   The obstacle is defined as a boolean matrix where each 'true' value represents a point that is part of the obstacle. The obstacle shape is derived from the airfoil coordinates, which are adjusted by the Angle of Attack (AoA) and displacement values.

   **Main Simulation Loop**
   -   The simulation runs in a loop, updating the velocity and pressure fields in each iteration. The loop continues as long as the figure window is open.

   -  1. **Viscous Effects (Laplacian Operator)**
        -   The Laplacian operator (∇²) is a second-order differential operator that measures how a function (in this case, the velocity field) differs from its average value in the surrounding points. In the **Navier-Stokes equations**, the Laplacian term `ν∇²u` represents **viscous forces**. The kinematic viscosity `ν` controls how fast momentum diffuses across the fluid. Higher viscosity leads to smoother flow and slower changes in velocity.
In 2D, the Laplacian of a scalar field `f(x, y)` is defined as:

            ∇²f = ∂²f/∂x² + ∂²f/∂y²

             In the simulation, the Laplacian operator is applied to the velocity fields `u` and `v` to model viscous diffusion, making the fluid flow more realistic by reducing sharp changes in velocity. Since the simulation operates on a **discrete grid**, the Laplacian must be approximated using finite differences. The discrete form of the Laplacian at a point `(i, j)` in the grid is computed using neighboring points as follows:
 
   - 2. **Obstacle Boundary Conditions**
       -   Ensure no fluid flow through the obstacle by setting velocities and pressure to zero inside the obstacle.

 
   - 3. **Solve Pressure (Jacobi Method)**
       -   The **Jacobi Method** is an iterative algorithm used to solve systems of linear equations, commonly applied in fluid simulations to solve the **Poisson equation** for the pressure field. This pressure field is essential to enforce fluid incompressibility (divergence-free velocity). The method iteratively refines the pressure at each grid point based on neighboring values, updating the solution until it converges. In my code, the Jacobi method updates the pressure at each point (i, j) on the grid using the values from neighboring grid points to approximate the correct pressure field.
 
       
   - 4. **Velocity Update**
       -   Use pressure gradients to update the velocity field to maintain incompressibility.
 

   - 5. **Runge-Kutta Advection**
       -   In fluid dynamics, **advection** refers to the transport of fluid properties (such as velocity, temperature, or particles) by the flow. It describes how quantities are carried by the motion of the fluid. In this simulation, particles are advected through the velocity field, and the velocity field itself is advected over time. Accurately modeling advection is essential for capturing the realistic movement of fluid and particles. The **4th-order Runge-Kutta method (RK4)** is used in the simulation to solve the advection equations. This method strikes a balance between accuracy and computational efficiency, making it suitable for fluid dynamics simulations. In the code, the RK4 method is applied to advect both particles and the velocity field, ensuring accurate particle motion and proper propagation of the velocity across the simulation grid.





          

      





