/*
 *   Copyright (c) 2026
 *   All rights reserved.
 */
#include <emscripten/emscripten.h>
#include <string>
#include <ctime>

extern "C"
{

	EMSCRIPTEN_KEEPALIVE
	const char *say_hello()
	{
		static std::string result;

		std::time_t now = std::time(nullptr);
		std::tm *local = std::localtime(&now);

		char buffer[64];
		// std::strftime(buffer, sizeof(buffer), "%Y-%m-%d %H:%M:%S", local);
		//  German numeric format: DD.MM.YYYY HH:MM:SS
		std::strftime(buffer, sizeof(buffer), "%d.%m.%Y %H:%M:%S", local);

		result = std::string("Hello from C++ WASM! Local time: ") + buffer;

		return result.c_str();
	}
}