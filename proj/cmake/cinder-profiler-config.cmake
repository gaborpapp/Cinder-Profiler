if ( NOT TARGET Cinder-Profiler )
	get_filename_component( CINDER_PROFILER_PATH
		"${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )

	set( CINDER_PROFILER_INCLUDES
		${CINDER_PROFILER_PATH}/src/
	)
	set( CINDER_PROFILER_SOURCES
		${CINDER_PROFILER_PATH}/src/Profiler.cpp
	)

	add_library( Cinder-Profiler ${CINDER_PROFILER_SOURCES} )

	target_compile_options( Cinder-Profiler PUBLIC "-std=c++11" )

	target_include_directories( Cinder-Profiler PUBLIC
		"${CINDER_PROFILER_INCLUDES}" )
	target_include_directories( Cinder-Profiler SYSTEM BEFORE PUBLIC
		"${CINDER_PATH}/include" )
endif()
