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

	# Minimum standard, not a hard -std flag: a forced -std=c++11 would propagate to
	# consumers and override their (higher) standard, breaking Cinder's filesystem
	# selection (ghc::filesystem fallback is not compiled into libcinder).
	target_compile_features( Cinder-Profiler PUBLIC cxx_std_11 )

	target_include_directories( Cinder-Profiler PUBLIC
		"${CINDER_PROFILER_INCLUDES}" )
	target_include_directories( Cinder-Profiler SYSTEM BEFORE PUBLIC
		"${CINDER_PATH}/include" )
endif()
