#include <GSLAM/core/GSLAM.h>

using namespace GSLAM;

enum Status{
    READY,PLAYING,PAUSING,PAUSED,FINISHING,FINISHED
};

int run(Svar config){
    bool   auto_start=config.arg("autostart",false,"Should the dataset start play after opened.");
    double playspeed=config.arg<double>("playspeed",1.,"How fast the offline dataset be played.");
    double playspeed_warning=config.arg<double>("playspeed_warning",5,"Seconds to check if the playspeed is slower then setted.");
    std::string datasetFile=config.arg<std::string>("dataset","","The dataset want to play.");

    auto _pub_dataset_status=messenger.advertise<int>("dataset/status",0);
    auto _pub_frame=messenger.advertise<FramePtr>("dataset/frame",0);

    int     _status=READY;
    Dataset _dataset;
    auto _sub_start=messenger.subscribe("qviz/start",[&](bool cmd){
        if(!_dataset.isOpened())
            _dataset.open(datasetFile);

        if(!_dataset.isOpened())
        {
            LOG(ERROR)<<"Failed to open dataset "<<datasetFile;
            return;
        }

        if(_dataset.isLive()) return ;
        if(_status==READY||_status==PAUSED)
            _status=PLAYING;
        _pub_dataset_status.publish(_status);
    });
    auto sub_pause=messenger.subscribe("qviz/pause",[&](bool msg){
        _status=PAUSING;
    });
    auto sub_stop=messenger.subscribe("qviz/stop",[&](bool msg){
        _status=FINISHING;
    });
    auto sub_step=messenger.subscribe("qviz/step",[&](bool ){
        if(!_dataset.isOpened())
            _dataset.open(datasetFile);
        if(!_dataset.isOpened()) return;
        if(_dataset.isLive()) return ;
        if(_status==READY||_status==PAUSED)
            _status=PAUSED;
        {
            auto frame=_dataset.grabFrame();
            if(!frame){
                _status=FINISHING;
                _pub_dataset_status.publish(_status);
                return;
            }
            _pub_frame.publish(frame);
        }
        _pub_dataset_status.publish(_status);
    });
    auto sub_open=messenger.subscribe("qviz/open",[&](std::string datasetFile){
            _dataset.open(datasetFile);
            if(!_dataset.isOpened())
            {
                return;
            }
            LOG(INFO)<<"Success opened dataset "<<datasetFile;
            _status=READY;
            _pub_dataset_status.publish(_status);
    });

    auto _sub_stop=messenger.subscribe("messenger/stop",[&](bool stop){_status=FINISHING;});

    if(config.get("help",false)){
        config["__usage__"]="play -playspeed 1.0 -autostart true\n"+
                messenger.introduction();
        return config.help();
    }

    double startTime=-1;

    GSLAM::TicToc tictoc,tictocWarning;
    GSLAM::FramePtr frame;
    if(auto_start)
        messenger.publish("dataset/control",std::string("Start"));

    while (_status!=FINISHED) {
        switch (_status) {
        case READY:
        {
            GSLAM::Rate::sleep(0.001);
            continue;
        }
        case FINISHING:{
            _pub_dataset_status.publish(int(FINISHED));
            return 0;
        }
        case PAUSING:
        {
            _status=PAUSED;
            _pub_dataset_status.publish(_status);
        }
            break;
        case PAUSED:
        {
            GSLAM::Rate::sleep(0.001);
            startTime=-1;
        }
            break;
        case PLAYING:
        {
            frame=_dataset.grabFrame();
            if(!frame){
                _status=FINISHING;
                _pub_dataset_status.publish(_status);
                break;
            }
            _pub_frame.publish(frame);
            if(startTime<0){
                startTime=frame->timestamp();
                tictoc.Tic();
            }
            else{
                double shouldSleep=(frame->timestamp()-startTime)/playspeed-tictoc.Tac();
                if(shouldSleep<-2){
                    if(tictocWarning.Tac()>playspeed_warning)// Don't bother
                    {
                        LOG(WARNING)<<"Play speed not realtime! Speed approximate "
                                   <<(frame->timestamp()-startTime)/tictoc.Tac();
                        tictocWarning.Tic();
                    }
                }
                else GSLAM::Rate::sleep(shouldSleep);
            }
        }
            break;
        default:
            break;
        }
    }
}

GSLAM_REGISTER_APPLICATION(play,run);
