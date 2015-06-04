// $Date: 2015-01-30 00:04:11 -0500 (Fri, 30 Jan 2015) $ 
// $Revision: 21559 $
// $Author: gforney $

#ifndef COUNTOURDEFS_H_DEFINED
#define COUNTOURDEFS_H_DEFINED

#if defined(WIN32)
#include <windows.h>
#endif
#ifdef pp_OSX
#include <OpenGL/gl.h>
#include <OpenGL/glu.h>
#else
#include <GL/gl.h>
#include <GL/glu.h>
#endif

#define DONT_GET_AREAS 0
#define GET_CELL_AREAS 1
#define GET_NODE_AREAS 2
#define DATA_FORTRAN 0
#define DATA_C 1
typedef struct {
  float *levels,*areas;
  int nlevels, *nnodes, *npolys, *nlines;
  int **polysize;
  float **xnode, **ynode, **xlines, **ylines, xyzval;
  float **rgbptr;
  int idir;
} contour;

void getcontournodes(int n, int levels, const double x[4], const double y[4], const double val[4],
                     double contlow, int modelow, double conthigh, int modehigh,
                     int *nnode, float *xnode, float *ynode,
                     int *nnode2,float *xline, float *yline,
                     int *casen,int blankit);
void getlinecontournodes(double linelevel, const double x[4], const double y[4], const double val[4],
                     int *nline_nodes,float *xline, float *yline,
                     int blankit);

void GetContourAreas(const contour *ci);
void DrawContours(const contour *ci);
void DrawLineContours(const contour *ci, float linewidth);
void setcontourslice(contour *ci,int idir,float xyz);
void getcontours(const float *xgrid, const float *ygrid, int nx, int ny,  
                 const float *vals, const char *iblank, const float *levels,int cellflag, int dataflag,
                 const contour *ci);
void getlinecontours(const  float *xgrid, const float *ygrid, int nx, int ny,  
                 const float *vals, const char *iblank, const float level_min, const float level_max,
                 const contour *ci);
void initcontour(contour *ci, float **rgbptr, int nlevels);
void initlinecontours(contour **ci_ptr, float **rgbptr, int ncontours, float constval, int idir, float level_min, float level_max, int nlevels);
void initcontours(contour **ci_ptr, float **rgbptr, int ncontours, float constval, int idir, float level_min, float level_max, int nlevels);
void freecontour(contour *ci);
void freecontours(contour *contours,int ncontours);

#endif





