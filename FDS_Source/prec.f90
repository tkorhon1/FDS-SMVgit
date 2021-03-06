MODULE PRECISION_PARAMETERS
 
! Set important parameters having to do with variable precision and array allocations
 
IMPLICIT NONE
 
CHARACTER(255), PARAMETER :: precid='$Id: prec.f90 22658 2015-05-11 20:44:10Z mcgratta $'
CHARACTER(255), PARAMETER :: precrev='$Revision: 22658 $'
CHARACTER(255), PARAMETER :: precdate='$Date: 2015-05-11 16:44:10 -0400 (Mon, 11 May 2015) $'

! Precision of "Four Byte" and "Eight Byte" reals

INTEGER, PARAMETER :: FB = SELECTED_REAL_KIND(6)
INTEGER, PARAMETER :: EB = SELECTED_REAL_KIND(12)

! Single- and double-precision complex

INTEGER, PARAMETER :: SPC = KIND((1._FB,1._FB))
INTEGER, PARAMETER :: DPC = KIND((1._EB,1._EB))

! Hardwired bounds for certain species arrays

INTEGER, PARAMETER :: MAX_SPECIES=20

! Hardwired bounds for surface and material arrays

INTEGER, PARAMETER :: MAX_LAYERS=20, MAX_MATERIALS=20, MAX_MATERIALS_TOTAL=400, MAX_REACTIONS=10, MAX_STEPS=20
INTEGER, PARAMETER :: MAX_NUMBER_SPECTRAL_BANDS=9

! Hardwired number of parameters that can be passed to Smokeview to describe a drawn object or device

INTEGER, PARAMETER :: SMOKEVIEW_OBJECTS_DIMENSION=20

! Hardwired length of most labels

INTEGER, PARAMETER :: LABEL_LENGTH=60, MESSAGE_LENGTH=200

! Special numbers

REAL(EB), PARAMETER :: EPSILON_EB=EPSILON(1._EB),ALMOST_ONE=1._EB-EPSILON(1._EB),MICRON=1.E-6_EB,&
                       TWO_EPSILON_EB=2._EB*EPSILON(1._EB),TINY_EB=TINY(1._EB)

! Often used numbers

REAL(EB), PARAMETER :: ONTH=1._EB/3._EB,THFO=3._EB/4._EB,FOTH=4._EB/3._EB,TWTH=2._EB/3._EB,ONSI=1._EB/6._EB
REAL(EB), PARAMETER :: PI=4._EB*ATAN(1.0_EB), SQRTPI=SQRT(PI), RPI=1._EB/PI, TWOPI=2._EB*PI, PIO2=PI/2._EB, &
                       RFPI=1._EB/(4._EB*PI), FOTHPI = FOTH*PI

CONTAINS

SUBROUTINE GET_REV_prec(MODULE_REV,MODULE_DATE)
INTEGER,INTENT(INOUT) :: MODULE_REV
CHARACTER(255),INTENT(INOUT) :: MODULE_DATE
INTEGER :: IERR

WRITE(MODULE_DATE,'(A)') precrev(INDEX(precrev,':')+2:LEN_TRIM(precrev)-2)
READ (MODULE_DATE,'(I5)',IOSTAT=IERR) MODULE_REV
IF (IERR/=0) MODULE_REV = 0
WRITE(MODULE_DATE,'(A)') precdate

END SUBROUTINE GET_REV_prec


END MODULE PRECISION_PARAMETERS
