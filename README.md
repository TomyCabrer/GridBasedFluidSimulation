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

             In the simulation, the Laplacian operator is applied to the velocity fields `u` and `v` to model viscous diffusion, making the fluid flow more realistic by reducing sharp changes in velocity.
Since the simulation operates on a **discrete grid**, the Laplacian must be approximated using finite differences. The discrete form of the Laplacian at a point `(i, j)` in the grid is computed using neighboring points as follows:

   - 2. **Obstacle Boundary Conditions**
        -    Ensure no fluid flow through the obstacle by setting velocities and pressure to zero inside the obstacle.

   - 3. **Solve Pressure (Jacobi Method)**
        - The **Jacobi Method** is an iterative algorithm used to solve systems of linear equations. It is particularly useful in fluid dynamics simulations for solving the **Poisson equation** that arises when calculating the pressure field. The pressure is used to enforce the incompressibility condition (divergence-free velocity field) in the fluid.

        - The Jacobi method is based on decomposing a linear system `Ax = b` into an iterative update rule that refines the guess for `x` at each step. Specifically, for each element of the solution vector `x`, the update rule is:
\[
x_i^{(k+1)} = \frac{1}{A_{ii}} \left( b_i - \sum_{j \neq i} A_{ij} x_j^{(k)} \right)
\]
In the context of your fluid simulation, `x` corresponds to the pressure field, and the method is used to iteratively compute the pressure at each grid point.

        - In fluid simulations governed by the **Navier-Stokes equations**, the **pressure Poisson equation** must be solved to ensure that the velocity field remains **incompressible** (i.e., the divergence of the velocity field is zero):
\[
\nabla \cdot \mathbf{u} = 0
\]
This condition is enforced by solving the following Poisson equation for pressure `p`:
\[
\nabla^2 p = \text{divergence}(\mathbf{u})
\]
The Jacobi method is used to solve this equation in an iterative manner. Given an initial guess for the pressure field, it iteratively updates the pressure at each grid point until the solution converges.In my code The algorithm updates the pressure at each point `(i, j)` on the grid using values from the neighboring grid points. For a 2D grid, the update rule is:
\[
p_{i,j}^{(k+1)} = \frac{1}{4} \left( p_{i+1,j}^{(k)} + p_{i-1,j}^{(k)} + p_{i,j+1}^{(k)} + p_{i,j-1}^{(k)} - \text{rhs}_{i,j} \right)
\]


          

      





