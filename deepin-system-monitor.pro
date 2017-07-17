######################################################################
# Automatically generated by qmake (3.0) ?? 2? 4 17:49:37 2017
######################################################################

TEMPLATE = app
TARGET = deepin-system-monitor
INCLUDEPATH += $$PWD/nethogs/src/
				
CONFIG += link_pkgconfig
CONFIG += c++11 
PKGCONFIG += xcb xcb-util dtkwidget dtkbase dtkutil
RESOURCES = deepin-system-monitor.qrc

!system(cd $$PWD/nethogs && make libnethogs){
	error("Build nethogs static library failed.")
}

CONFIG(debug, debug|release) {
  # Enable memory address sanitizer in debug mode.
  QMAKE_CXXFLAGS += -fsanitize=address
  LIBS += -lasan
}

# Input
HEADERS += src/utils.h \
           src/toolbar.h \
		   src/cpu_monitor.h \
		   src/memory_monitor.h \
		   src/network_monitor.h \
		   src/network_traffic_filter.h \
		   src/status_monitor.h \
           src/process_manager.h \
           src/list_item.h \
           src/list_view.h \
           src/process_item.h \
           src/process_view.h \
		   src/hashqstring.h \
           src/find_window_title.h \
           src/window_manager.h \
		   src/smooth_curve_generator.h \
		   src/interactive_kill.h \
		   src/start_tooltip.h \
		   src/process_tree.h \
		   src/process_switch_tab.h \
		   src/attributes_dialog.h \
		   src/constant.h \
		   src/settings.h \
		   src/main_window.h
SOURCES += src/main.cpp \
		   src/utils.cpp \
		   src/toolbar.cpp \
		   src/cpu_monitor.cpp \
		   src/memory_monitor.cpp \
		   src/network_monitor.cpp \
		   src/network_traffic_filter.cpp \
		   src/status_monitor.cpp \
           src/process_manager.cpp \
           src/list_item.cpp \
           src/list_view.cpp \
           src/process_item.cpp \
           src/process_view.cpp \
		   src/find_window_title.cpp \
		   src/window_manager.cpp \
		   src/smooth_curve_generator.cpp \
		   src/interactive_kill.cpp \
		   src/start_tooltip.cpp \
		   src/process_tree.cpp \
		   src/process_switch_tab.cpp \
		   src/attributes_dialog.cpp \
		   src/main_window.cpp \
		   src/settings.cpp
		   
QT += core
QT += widgets
QT += gui
QT += network
QT += x11extras
QT += dbus

QMAKE_CXXFLAGS += -g
LIBS += -L$$PWD/nethogs/src -lnethogs -lpcap
LIBS += -L"libprocps" -lprocps
LIBS += -lX11 -lXext -lXtst

translations.path = $$INSTROOT$$DSRDIR/translations

isEmpty(TRANSLATIONS) {
     include(translations.pri)

}

TRANSLATIONS_COMPILED = $$TRANSLATIONS
TRANSLATIONS_COMPILED ~= s/\.ts/.qm/g

translations.files = $$TRANSLATIONS_COMPILED
INSTALLS += translations
CONFIG *= update_translations release_translations

CONFIG(update_translations) {
    isEmpty(lupdate):lupdate=lupdate
    system($$lupdate -no-obsolete -locations none $$_PRO_FILE_)
}
CONFIG(release_translations) {
    isEmpty(lrelease):lrelease=lrelease
    system($$lrelease $$_PRO_FILE_)
}

DSR_LANG_PATH += $$DSRDIR/translations
DEFINES += "DSR_LANG_PATH=\\\"$$DSR_LANG_PATH\\\""
