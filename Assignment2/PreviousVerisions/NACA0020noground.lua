-- NACA0020.lua Course Mesh

job_title = "NACA0020 aerofoil "
print(job_title)

-- define points along NACA profile
C = 1   -- set chord length
t = 20    -- set thickness as a percentage of chord length. E.g. 12 = 12% thickness
BL = 20

-- top edge coordinates
A2 = Vector3:new{x=0.0 * C, y=0.0 *t}
t01 = Vector3:new{x=0.005 * C, y=0.0010 *t}
t02 = Vector3:new{x=0.018 * C, y=0.0019 *t}
t03 = Vector3:new{x=0.04 * C, y=0.0027 *t}
t04 = Vector3:new{x=0.06 * C, y=0.0032 *t}
t05 = Vector3:new{x=0.09 * C, y=0.0038 *t}
t06 = Vector3:new{x=0.12 * C, y=0.0042 *t}
t07 = Vector3:new{x=0.16 * C, y=0.0045 *t}
t08 = Vector3:new{x=0.20 * C, y=0.0048 *t}
t09 = Vector3:new{x=0.25 * C, y=0.0050 *t}
A1 = Vector3:new{x=0.30 * C, y=0.0050 *t}
t11 = Vector3:new{x=0.40 * C, y=0.0048 *t}
t12 = Vector3:new{x=0.50 * C, y=0.0044 *t}
t13 = Vector3:new{x=0.60 * C, y=0.0038 *t}
t14 = Vector3:new{x=0.70 * C, y=0.0030 *t}
t15 = Vector3:new{x=0.80 * C, y=0.0021 *t}
t16 = Vector3:new{x=0.90 * C, y=0.0011 *t}
A0 = Vector3:new{x=1.00 * C, y=0.0 *t}

-- bottom edge coordinates
-- A2 = Vector3:new{x=0.0 * C, y=0.0 *t}
b01 = Vector3:new{x=0.005 * C, y=-0.0010 *t}
b02 = Vector3:new{x=0.018 * C, y=-0.0019 *t}
b03 = Vector3:new{x=0.04 * C, y=-0.0027 *t}
b04 = Vector3:new{x=0.06 * C, y=-0.0032 *t}
b05 = Vector3:new{x=0.09 * C, y=-0.0038 *t}
b06 = Vector3:new{x=0.12 * C, y=-0.0042 *t}
b07 = Vector3:new{x=0.16 * C, y=-0.0045 *t}
b08 = Vector3:new{x=0.20 * C, y=-0.0048 *t}
b09 = Vector3:new{x=0.25 * C, y=-0.0050 *t}
A3 = Vector3:new{x=0.30 * C, y=-0.0050 *t}
b11 = Vector3:new{x=0.40 * C, y=-0.0048 *t}
b12 = Vector3:new{x=0.50 * C, y=-0.0044 *t}
b13 = Vector3:new{x=0.60 * C, y=-0.0038 *t}
b14 = Vector3:new{x=0.70 * C, y=-0.0030 *t}
b15 = Vector3:new{x=0.80 * C, y=-0.0021 *t}
b16 = Vector3:new{x=0.90 * C, y=-0.0011 *t}
A4 = Vector3:new{x=1.00 * C, y=-0.0 *t}

-- Create lines that form aerofoil profile
a1a0 = Spline:new{points={A1,t11,t12,t13,t14,t15,t16,A0}}
a2a1 = Spline:new{points={A2,t01,t02,t03,t04,t05,t06,t07,t08,t09,A1}}
a3a2 = Spline:new{points={A3,b09,b08,b07,b06,b05,b04,b03,b02,b01,A2}}
a4a3 = Spline:new{points={A4,b16,b15,b14,b13,b12,b11,A3}}

--Define Points for Blocks
A = Vector3:new{x=-BL, y=0.0}
B = Vector3:new{x=A1.x-BL*math.sin(0.62), y=A1.y+BL*math.cos(0.62)}
C1 = Vector3:new{x=A1.x-BL*math.sin(0.62), y=-(A1.y+BL*math.cos(0.62))}
D = Vector3:new{x=A1.x-(BL*0.1)*math.sin(0.62), y=A1.y+(BL*0.1)*math.cos(0.62)}
E = Vector3:new{x=-BL*0.1, y=0} 
F = Vector3:new{x=A1.x-(BL*0.1)*math.sin(0.62), y=-(A1.y+(BL*0.1)*math.cos(0.62))}
I = A1
H = A2
G = A3
J = Vector3:new{x=t16.x+(BL*0.1)*math.sin(0.302), y=t16.y+(BL*0.1)*math.cos(0.302)}
K = t16
L = b16
M = Vector3:new{x=t16.x+(BL*0.1)*math.sin(0.302), y=-(t16.y+(BL*0.1)*math.cos(0.302))}
N = A0
O = Vector3:new{x=C+(BL*0.1), y=0}
P = Vector3:new{x=t16.x+BL*math.sin(0.302), y=t16.y+BL*math.cos(0.302)}
Q = Vector3:new{x=C+BL, y=0}
R = Vector3:new{x=t16.x+BL*math.sin(0.302), y=-(t16.y+BL*math.cos(0.302))}

-- Define Paths
---B0
AB=Line:new{p0=A,p1=B}
AE=Line:new{p0=A,p1=E}
ED=Line:new{p0=E,p1=D}
BD=Line:new{p0=B,p1=D}

---B1
CA=Line:new{p0=C1,p1=A}
CF=Line:new{p0=C1,p1=F}
FE=Line:new{p0=F,p1=E}

---B2
EH=Line:new{p0=E,p1=H}
DI=Line:new{p0=D,p1=I}
HI=a2a1

---B3
FG=Line:new{p0=F,p1=G}
GH=a3a2

---B4
JP = Line:new{p0=J,p1=P}
BP = Line:new{p0=B,p1=P}
DJ = Line:new{p0=D,p1=J}
DB = Line:new{p0=D,p1=B}

---B5
FM = Line:new{p0=F,p1=M}
CR = Line:new{p0=C1,p1=R}
RM = Line:new{p0=R,p1=M}

---B6
IK = Spline:new{points={A1,t11,t12,t13,t14,t15,t16}}
KJ = Line:new{p0=K,p1=J} 
ID = Line:new{p0=I,p1=D}

---B7
GL = Spline:new{points={A3,b11,b12,b13,b14,b15,b16}}
ML = Line:new{p0=M,p1=L} 

---B8
QP = Line:new{p0=Q,p1=P} 
OQ = Line:new{p0=O,p1=Q}
MrJuice = Line:new{p0=O,p1=J} -- The glove didn't fit.

---B9
RQ = Line:new{p0=R,p1=Q} 
MO = Line:new{p0=M,p1=O}
MR = Line:new{p0=M,p1=R}

---B10
NK = Line:new{p0=N,p1=K} 
NO = Line:new{p0=N,p1=O}

---B11
LN = Line:new{p0=L,p1=N} 
LM = Line:new{p0=L,p1=M} 

-- Surfaces
patch={}
patch[0]=CoonsPatch:new{north= BD,south= AE, east= ED, west= AB}
patch[1]=CoonsPatch:new{north= AE,south= CF, east= FE, west= CA}
patch[2]=CoonsPatch:new{north= DI,south= EH, east= HI, west= ED}
patch[3]=CoonsPatch:new{north= EH,south= FG, east= GH, west= FE}

patch[4]=CoonsPatch:new{north= BP,south= DJ, east= JP, west= DB}
patch[5]=CoonsPatch:new{north= FM,south= CR, east= RM, west= CF}
patch[6]=CoonsPatch:new{north= DJ,south= IK, east= KJ, west= ID}
patch[7]=CoonsPatch:new{north= GL,south= FM, east= ML, west= FG}

print("Test1")
patch[8]=CoonsPatch:new{north= JP,south= OQ, east= QP, west= MrJuice}
print("Test2")
patch[9]=CoonsPatch:new{north= OQ,south= MR, east= RQ, west= MO}
print("Test3")
patch[10]=CoonsPatch:new{north= KJ,south= NO, east= MrJuice, west= NK}
print("Test4")
patch[11]=CoonsPatch:new{north= NO,south= LM, east= MO, west= LN}
print("Test5")
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
grid[9] = StructuredGrid:new{psurface=patch[9],niv=x,njv=y}
grid[10] = StructuredGrid:new{psurface=patch[10],niv=x,njv=y}
grid[11] = StructuredGrid:new{psurface=patch[11],niv=x,njv=y}




--vtk
for ib = 0,11 do
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
