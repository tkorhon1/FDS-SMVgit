// $Date: 2015-05-20 21:59:13 -0400 (Wed, 20 May 2015) $ 
// $Revision: 22702 $
// $Author: fds.firebot $

#define pp_STANDARD

#ifdef pp_BETA
#define BLOCKAIDVERSION "Test"
#undef pp_STANDARD
#endif

#ifdef pp_STANDARD
#define BLOCKAIDVERSION "1.0.0"
#endif

#define _CRT_SECURE_NO_WARNINGS
#define _CRT_SECURE_NO_DEPRECATE
