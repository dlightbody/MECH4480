-- NACA0020.lua Course Mesh

job_title = "NACA0020 aerofoil course mesh"
print(job_title)

-- define points along NACA profile
Ch = 1   -- set chord length
t = 20    -- set thickness as a percentage of chord length. E.g. 12 = 12% thickness
BL = 20
scale = 1.   -- use this to scale the mesh to different units. eg. 10 = m, 0.1 = cm

-- top edge coordinates
A2 = Vector3:new{x=0.0 * Ch, y=0.0 *t}
t01 = Vector3:new{x=0.005 * Ch, y=0.0010 *t}
t02 = Vector3:new{x=0.018 * Ch, y=0.0019 *t}
t03 = Vector3:new{x=0.04 * Ch, y=0.0027 *t}
t04 = Vector3:new{x=0.06 * Ch, y=0.0032 *t}
t05 = Vector3:new{x=0.09 * Ch, y=0.0038 *t}
t06 = Vector3:new{x=0.12 * Ch, y=0.0042 *t}
t07 = Vector3:new{x=0.16 * Ch, y=0.0045 *t}
t08 = Vector3:new{x=0.20 * Ch, y=0.0048 *t}
t09 = Vector3:new{x=0.25 * Ch, y=0.0050 *t}
A1 = Vector3:new{x=0.30 * Ch, y=0.0050 *t}
t11 = Vector3:new{x=0.40 * Ch, y=0.0048 *t}
t12 = Vector3:new{x=0.50 * Ch, y=0.0044 *t}
t13 = Vector3:new{x=0.60 * Ch, y=0.0038 *t}
t14 = Vector3:new{x=0.70 * Ch, y=0.0030 *t}
t15 = Vector3:new{x=0.80 * Ch, y=0.0021 *t}
t16 = Vector3:new{x=0.90 * Ch, y=0.0011 *t}
A0 = Vector3:new{x=1.00 * Ch, y=0.0 *t}

-- bottom edge coordinates
-- A2 = Vector3:new{x=0.0 * Ch, y=0.0 *t}
b01 = Vector3:new{x=0.005 * Ch, y=-0.0010 *t}
b02 = Vector3:new{x=0.018 * Ch, y=-0.0019 *t}
b03 = Vector3:new{x=0.04 * Ch, y=-0.0027 *t}
b04 = Vector3:new{x=0.06 * Ch, y=-0.0032 *t}
b05 = Vector3:new{x=0.09 * Ch, y=-0.0038 *t}
b06 = Vector3:new{x=0.12 * Ch, y=-0.0042 *t}
b07 = Vector3:new{x=0.16 * Ch, y=-0.0045 *t}
b08 = Vector3:new{x=0.20 * Ch, y=-0.0048 *t}
b09 = Vector3:new{x=0.25 * Ch, y=-0.0050 *t}
A3 = Vector3:new{x=0.30 * Ch, y=-0.0050 *t}
b11 = Vector3:new{x=0.40 * Ch, y=-0.0048 *t}
b12 = Vector3:new{x=0.50 * Ch, y=-0.0044 *t}
b13 = Vector3:new{x=0.60 * Ch, y=-0.0038 *t}
b14 = Vector3:new{x=0.70 * Ch, y=-0.0030 *t}
b15 = Vector3:new{x=0.80 * Ch, y=-0.0021 *t}
b16 = Vector3:new{x=0.90 * Ch, y=-0.0011 *t}
A4 = Vector3:new{x=1.00 * Ch, y=-0.0 *t}

-- Create lines that form aerofoil profile
a1a0 = Spline:new{points={A1,t11,t12,t13,t14,t15,t16,A0}}
a2a1 = Spline:new{points={A2,t01,t02,t03,t04,t05,t06,t07,t08,t09,A1}}
a3a2 = Spline:new{points={A3,b09,b08,b07,b06,b05,b04,b03,b02,b01,A2}}
a4a3 = Spline:new{points={A4,b16,b15,b14,b13,b12,b11,A3}}

--Define Points for Blocks
A = Vector3:new{x= -scale*Ch, y= scale*Ch}
B = Vector3:new{x= -scale*Ch, y= scale*0.75*Ch}
C = Vector3:new{x= -scale*Ch, y= -scale*0.75*Ch}
D = Vector3:new{x= -scale*Ch, y= -scale*Ch}
E = Vector3:new{x= -scale*Ch*0.5, y= scale*Ch*0.5}
F = Vector3:new{x= -scale*Ch*0.5, y= -scale*Ch*0.5}
G = Vector3:new{x= -scale*Ch*0.25, y= scale*Ch}
H = t05
I = t01
J = b01
K = b05
L = Vector3:new{x= -scale*Ch*0.25, y= -scale*Ch}
M = Vector3:new{x= scale*Ch, y= scale*Ch}
N = Vector3:new{x= scale*Ch, y= 0.0}
O = Vector3:new{x= scale*Ch, y= -scale*Ch}
P = Vector3:new{x= 2.0*scale*Ch, y= scale*Ch}
Q = Vector3:new{x= 2.0*scale*Ch, y= -scale*Ch}


-- Define Paths

---Block1
BA = Line:new{p0=B, p1=A}
AG = Line:new{p0=A, p1=G}
BE = Line:new{p0=B, p1=E}
EG = Line:new{p0=E, p1=G}

---Block2
EG = Line:new{p0=E, p1=G}
GH = Line:new{p0=G, p1=H}
EI = Line:new{p0=E, p1=I}
IH = Spline:new{points={I,t02,t03,t04,H}}

---Block3
HG = Line:new{p0=H, p1=G}
GM = Line:new{p0=G, p1=M}
HN = Spline:new{points={H,t06,t07,t08,t09,A1,t11,t12,t13,t14,t15,t16,N}}
NM = Line:new{p0=N, p1=M}

---Block4
OM = Line:new{p0=O, p1=M}
MP = Line:new{p0=M, p1=P}
OQ = Line:new{p0=O, p1=Q}
QP = Line:new{p0=Q, p1=P}

---Block5
LK = Line:new{p0=L, p1=K}
KN = Spline:new{points={K,b06,b07,b08,b09,A3,b11,b12,b13,b14,b15,b16,N}}
LO = Line:new{p0=L, p1=O}
ON = Line:new{p0=O, p1=N}

---Block6
FL = Line:new{p0=F, p1=L}
FJ = Line:new{p0=F, p1=J}
JK = Spline:new{points={J,b02,b03,b04,K}}
LK = Line:new{p0=L, p1=K}

---Block7
DC = Line:new{p0=D, p1=C}
DF = Line:new{p0=D, p1=F}
DL = Line:new{p0=D, p1=L}
LF = Line:new{p0=L, p1=F}

---Block8
CB = Line:new{p0=C, p1=B}
BE = Line:new{p0=B, p1=E}
CF = Line:new{p0=C, p1=F}
FE = Line:new{p0=F, p1=E}

---Block9
FE = Line:new{p0=F, p1=E}
EI = Line:new{p0=E, p1=I}
FJ = Line:new{p0=F, p1=J}
JI = Spline:new{points={J,A2,I}}

-- Surfaces
patch={}
patch[0]=CoonsPatch:new{north= AG,south= BE, east= EG, west= BA}
patch[1]=CoonsPatch:new{north= GH,south= EI, east= IH, west= EG}
patch[2]=CoonsPatch:new{north= GM,south= HN, east= NM, west= HG}
patch[3]=CoonsPatch:new{north= MP,south= OQ, east= QP, west= OM}
patch[4]=CoonsPatch:new{north= KN,south= LO, east= ON, west= LK}
patch[5]=CoonsPatch:new{north= JK,south= FL, east= LK, west= FJ}
patch[6]=CoonsPatch:new{north= CF,south= DL, east= LF, west= DC}
patch[7]=CoonsPatch:new{north= BE,south= CF, east= FE, west= CB}
patch[8]=CoonsPatch:new{north= EI,south= FJ, east= JI, west= FE}

--Number of Cells
x = 20
y = 20

--Grids
grid = {}
grid[0] = StructuredGrid:new{psurface=patch[0],niv=x,njv=y}
grid[1] = StructuredGrid:new{psurface=patch[1],niv=x,njv=y}
grid[2] = StructuredGrid:new{psurface=patch[2],niv=x,njv=y}
grid[3] = StructuredGrid:new{psurface=patch[3],niv=x,njv=y}
grid[4] = StructuredGrid:new{psurface=patch[4],niv=x,njv=y}
grid[5] = StructuredGrid:new{psurface=patch[5],niv=x,njv=y}
grid[6] = StructuredGrid:new{psurface=patch[6],niv=x,njv=y}
grid[7] = StructuredGrid:new{psurface=patch[7],niv=x,njv=y}
grid[8] = StructuredGrid:new{psurface=patch[8],niv=x,njv=y}

--vtk
for ib = 0,8 do
    fileName = string.format("Ass2-%d.vtk",ib)
    grid[ib]:write_to_vtk_file(fileName)
end




-- The following code can be use to show just the aerofoil. 
-- I.e. it generates a block inside the aerofoil. Uncomment this if you want to show just the aerofoil. Use at your own peril.
--a3a4 = ReversedPath:new{underlying_path=a4a3}
--a2a3 = ReversedPath:new{underlying_path=a3a2}
--internal_surface = CoonsPatch:new{south=a2a3, north=a1a0, west=a2a1, east=a3a4}
--grid_aerofoil = StructuredGrid:new{psurface=internal_surface, niv=20, njv=21}
--grid_aerofoil:write_to_vtk_file("aerofoil_internal.vtk")


-- External Mesh







-- ############################################################
-- ############################################################
-- Add code to write you grid to a .vtk file
