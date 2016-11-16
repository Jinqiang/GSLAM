######################################################################
# Automatically generated by qmake (2.01a) Wed Jun 8 10:31:34 2016
######################################################################

TEMPLATE = app
TARGET = 
DEPENDPATH += . src
INCLUDEPATH += . ../../src ./src GSLAM/dso
QMAKE_CXXFLAGS+= -std=c++11

####### OPENCV ############
CONFIG  += link_pkgconfig
PKGCONFIG += opencv
DEFINES += DEBUG_WithQT DEBUG_DSO

################################################################################
# QT settings
################################################################################
INCLUDEPATH+=/usr/share/qt4/mkspecs/linux-g++ \
/usr/include/qt4/QtCore \
/usr/include/qt4/QtGui \
/usr/include/qt4/QtXml \
/usr/include/qt4/QtOpenGL \
/usr/include/qt4

LIBS+=-lQtGui -lQtCore -lQtXml

################################################################################
# QGLViewer settings
################################################################################
LIBS+=-lQtOpenGL -lQGLViewer -lGL -lGLU -lglut -lGLEW

################################################################################
# Boost settings
################################################################################
LIBS+= -lboost_serialization -lboost_system -lboost_thread -lboost_program_options

################################################################################
# Eigen settings
################################################################################
INCLUDEPATH += /usr/include/eigen3

################################################################################
# suitesparse settings
################################################################################
INCLUDEPATH += /usr/include/suitesparse

LIBS+= -L/usr/lib/x86_64-linux-gnu \
                        -lcxsparse -lcsparse \
                        -lcholmod -lamd -lcolamd -lcamd -lccolamd

################################################################################
# PIL settings
################################################################################
PIL_TOP=/data/zhaoyong/Linux/Program/Apps/GSLAM-1.1.0/ThirdParty/PIL-1.1.0
INCLUDEPATH += $$PIL_TOP/src
LIBS+=-L$$PIL_TOP/libs \
-lpi_base -lpi_hardware -lpi_gui -lpi_cv

################################################################################
# g2o settings
################################################################################
INCLUDEPATH += /data/zhaoyong/Linux/Program/Apps/GSLAM-1.1.0/ThirdParty/g2o
LIBS +=-L/data/zhaoyong/Linux/Program/Apps/GSLAM-1.1.0/ThirdParty/g2o/lib -lg2o

LIBS+=

HEADERS += \
    GSLAM/core/GSLAM.h \
    GSLAM/core/types/GImage.h \
    GSLAM/test/System.h \
    GSLAM/core/types/VideoFrame.h \
    GSLAM/core/types/Camera.h \
    GSLAM/core/types/SE3.h \
    GSLAM/core/types/HashMap.h \
    GSLAM/test/MainWindow.h \
    GSLAM/test/VideoReader.h \

# Input
SOURCES += \
    GSLAM/core/GSLAM.cpp \
    GSLAM/core/types/GImage.cpp\
    GSLAM/test/System.cpp \
    GSLAM/test/main.cpp \
    GSLAM/test/TestGImage.cpp \
    GSLAM/core/types/VideoFrame.cpp \
    GSLAM/core/types/Camera.cpp \
    GSLAM/core/types/HashMap.cpp \
    GSLAM/test/MainWindow.cpp \
    GSLAM/test/VideoReader.cpp

if(contains(DEFINES,DEBUG_DSO)){

HEADERS+=GSLAM/dso/FullSystem/CoarseInitializer.h \
    GSLAM/dso/FullSystem/CoarseTracker.h \
    GSLAM/dso/FullSystem/FullSystem.h \
    GSLAM/dso/FullSystem/HessianBlocks.h \
    GSLAM/dso/FullSystem/ImmaturePoint.h \
    GSLAM/dso/FullSystem/PixelSelector.h \
    GSLAM/dso/FullSystem/PixelSelector2.h \
    GSLAM/dso/FullSystem/ResidualProjections.h \
    GSLAM/dso/FullSystem/Residuals.h \
    GSLAM/dso/OptimizationBackend/AccumulatedSCHessian.h \
    GSLAM/dso/OptimizationBackend/AccumulatedTopHessian.h \
    GSLAM/dso/OptimizationBackend/EnergyFunctional.h \
    GSLAM/dso/OptimizationBackend/EnergyFunctionalStructs.h \
    GSLAM/dso/OptimizationBackend/MatrixAccumulators.h \
    GSLAM/dso/OptimizationBackend/RawResidualJacobian.h \
    GSLAM/dso/sophus/rxso3.hpp \
    GSLAM/dso/sophus/se2.hpp \
    GSLAM/dso/sophus/se3.hpp \
    GSLAM/dso/sophus/sim3.hpp \
    GSLAM/dso/sophus/so2.hpp \
    GSLAM/dso/sophus/so3.hpp \
    GSLAM/dso/sophus/sophus.hpp \
    GSLAM/dso/sophus/tests.hpp \
    GSLAM/dso/util/DatasetReader.h \
    GSLAM/dso/util/FrameShell.h \
    GSLAM/dso/util/globalCalib.h \
    GSLAM/dso/util/globalFuncs.h \
    GSLAM/dso/util/ImageAndExposure.h \
    GSLAM/dso/util/IndexThreadReduce.h \
    GSLAM/dso/util/MinimalImage.h \
    GSLAM/dso/util/nanoflann.h \
    GSLAM/dso/util/NumType.h \
    GSLAM/dso/util/settings.h \
    GSLAM/dso/util/Undistort.h \
    GSLAM/dso/IOWrapper/Output3DWrapper.h \
    GSLAM/dso/DSO.h \
    GSLAM/dso/IOWrapper/WarperGSLAM.h \
    GSLAM/dso/IOWrapper/ImageDisplay.h \
    GSLAM/dso/IOWrapper/ImageRW.h \
    GSLAM/dso/IOWrapper/KeyFrameDisplay.h

SOURCES+=GSLAM/dso/FullSystem/CoarseInitializer.cpp \
    GSLAM/dso/FullSystem/CoarseTracker.cpp \
    GSLAM/dso/FullSystem/FullSystem.cpp \
    GSLAM/dso/FullSystem/FullSystemDebugStuff.cpp \
    GSLAM/dso/FullSystem/FullSystemMarginalize.cpp \
    GSLAM/dso/FullSystem/FullSystemOptimize.cpp \
    GSLAM/dso/FullSystem/FullSystemOptPoint.cpp \
    GSLAM/dso/FullSystem/HessianBlocks.cpp \
    GSLAM/dso/FullSystem/ImmaturePoint.cpp \
    GSLAM/dso/FullSystem/PixelSelector2.cpp \
    GSLAM/dso/FullSystem/Residuals.cpp \
    GSLAM/dso/OptimizationBackend/AccumulatedSCHessian.cpp \
    GSLAM/dso/OptimizationBackend/AccumulatedTopHessian.cpp \
    GSLAM/dso/OptimizationBackend/EnergyFunctional.cpp \
    GSLAM/dso/OptimizationBackend/EnergyFunctionalStructs.cpp \
    GSLAM/dso/util/globalCalib.cpp \
    GSLAM/dso/util/settings.cpp \
    GSLAM/dso/util/Undistort.cpp \
    GSLAM/dso/DSO.cpp \
    GSLAM/dso/IOWrapper/WarperGSLAM.cpp \
    GSLAM/dso/IOWrapper/KeyFrameDisplay.cpp
}else{

  HEADERS+=\
    GSLAM/orbslam/ORBSLAM.h \
    GSLAM/orbslam/Converter.h \
    GSLAM/orbslam/Frame.h \
    GSLAM/orbslam/Initializer.h \
    GSLAM/orbslam/KeyFrame.h \
    GSLAM/orbslam/KeyFrameDatabase.h \
    GSLAM/orbslam/LocalMapping.h \
    GSLAM/orbslam/LoopClosing.h \
    GSLAM/orbslam/Map.h \
    GSLAM/orbslam/MapPoint.h \
    GSLAM/orbslam/Optimizer.h \
    GSLAM/orbslam/ORBextractor.h \
    GSLAM/orbslam/ORBmatcher.h \
    GSLAM/orbslam/ORBVocabulary.h \
    GSLAM/orbslam/OSLAM.h \
    GSLAM/orbslam/PnPsolver.h \
    GSLAM/orbslam/Sim3Solver.h \
    GSLAM/orbslam/Tracking.h \
    GSLAM/orbslam/DBoW2/BowVector.h \
    GSLAM/orbslam/DBoW2/CNN_Vocabulary.h \
    GSLAM/orbslam/DBoW2/FClass.h \
    GSLAM/orbslam/DBoW2/FCNN.h \
    GSLAM/orbslam/DBoW2/FeatureVector.h \
    GSLAM/orbslam/DBoW2/FORB.h \
    GSLAM/orbslam/DBoW2/ORB_Vocabulary.h \
    GSLAM/orbslam/DBoW2/Random.h \
    GSLAM/orbslam/DBoW2/ScoringObject.h \
    GSLAM/orbslam/DBoW2/TemplatedVocabulary.h \
    GSLAM/orbslam/DBoW2/Timestamp.h

SOURCES+=\
    GSLAM/orbslam/ORBSLAM.cpp \
    GSLAM/orbslam/Converter.cpp \
    GSLAM/orbslam/Frame.cpp \
    GSLAM/orbslam/Initializer.cpp \
    GSLAM/orbslam/KeyFrame.cpp \
    GSLAM/orbslam/KeyFrameDatabase.cpp \
    GSLAM/orbslam/LocalMapping.cpp \
    GSLAM/orbslam/LoopClosing.cpp \
    GSLAM/orbslam/Map.cpp \
    GSLAM/orbslam/MapPoint.cpp \
    GSLAM/orbslam/Optimizer.cpp \
    GSLAM/orbslam/ORBextractor.cpp \
    GSLAM/orbslam/ORBmatcher.cpp \
    GSLAM/orbslam/PnPsolver.cpp \
    GSLAM/orbslam/Sim3Solver.cpp \
    GSLAM/orbslam/Tracking.cpp \
    GSLAM/orbslam/DBoW2/BowVector.cpp \
    GSLAM/orbslam/DBoW2/FCNN.cpp \
    GSLAM/orbslam/DBoW2/FeatureVector.cpp \
    GSLAM/orbslam/DBoW2/FORB.cpp \
    GSLAM/orbslam/DBoW2/Random.cpp \
    GSLAM/orbslam/DBoW2/ScoringObject.cpp \
    GSLAM/orbslam/DBoW2/Timestamp.cpp \
}
