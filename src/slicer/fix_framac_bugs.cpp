#include <vector>
#include <fstream>
#include <iostream>
#include <sstream>
#include <unordered_map>

void fixFramacBugs(const std::string &fileName, const std::filesystem::path &filePath) {
    const std::unordered_map<std::string, std::vector<std::pair<std::string, std::string>>> patches = {
        {
            "Incorrect_Initialization_3_NT",
            {
                {
                    "if ((int)*str == c) {",
                    "if ((int)*str == '\\n') {"
                }
            }
        },
        {
            "Incorrect_Initialization_3_T",
            {
                {
                    "if ((int)*str == c) {",
                    "if ((int)*str == '\\n') {"
                }
            }
        },
        {
            "Incorrect_Initialization_4_NT",
            {
                {
                    "",
                    R"(extern int __VERIFIER_nondet_int(void);
/*
Commit Number: fa741cd4fffbbaa5d4ba9a15f53550ac7817cc92
URL: https://github.com/behdad/fontconfig/commit/fa741cd4fffbbaa5d4ba9a15f53550ac7817cc92
Project Name: fontconfig
License: MIT
termination: FALSE
*/
int main()
{
    int h = __VERIFIER_nondet_int();
    int hash = __VERIFIER_nondet_int();
    int rehash = __VERIFIER_nondet_int();
    if( h < 0 || hash <= 0 || rehash <= 0 || rehash > hash)
        return 0;
    int i = h % hash;
    int r;
    while( i < hash )
    {
        if( !r ) r = h % rehash;
        i += r;
    }
    return 0;
}
)"
                }
            }
        },
        {
            "Incorrect_Initialization_4_T",
            {
                {
                    "",
                    R"(extern int __VERIFIER_nondet_int(void);
/*

Commit Number: fa741cd4fffbbaa5d4ba9a15f53550ac7817cc92
URL: https://github.com/behdad/fontconfig/commit/fa741cd4fffbbaa5d4ba9a15f53550ac7817cc92
Project Name: fontconfig
License: MIT
termination: TRUE
*/
int main()
{
    int h = __VERIFIER_nondet_int();
    int hash = __VERIFIER_nondet_int();
    int rehash = __VERIFIER_nondet_int();
    if( h < 0 || hash <= 0 || rehash <= 0 || rehash > hash || hash > 65534)
        return 0;
    int i = h % hash;
    int r = 0;
    while( i < hash )
    {
        if( !r ) r = ( h % rehash ) + 1;
        i += r;
    }
    return 0;
}
)"
                }
            }
        },
        {
            "Missing_Corner-case_Handling_3_NT",
            {
                {
                    "",
                    R"(extern int __VERIFIER_nondet_int(void);
/*

Commit Number: fad2eab749cce970fa87fa46186218b2dfe1adc1
URL: https://github.com/NetHack/NetHack/commit/fad2eab749cce970fa87fa46186218b2dfe1adc1
Project Name: NetHack
License: https://github.com/NetHack/NetHack/commit/60df7b2d3b73900481814084be027375b5888765
termination: FALSE

*/
int main()
{
    int ROWNO = __VERIFIER_nondet_int();
    int COLNO = __VERIFIER_nondet_int();
    if( ROWNO <= 0 || COLNO <= 0 || ROWNO > 65534 || COLNO > 65534 )
        return 0;
    int levl[ROWNO][COLNO];
    for( int i = 0 ; i < ROWNO ; i++ )
    {
        for( int j = 0 ; j < COLNO ; j++ )
        {
            int num = __VERIFIER_nondet_int();
            if( num > 0 )
                num = -num;
            levl[i][j] = num % 4;
        }
    }
    int STONE = 0;
    int found = 0;
    for( int xmin = 0; !found ; xmin++ )
    {
        for( int y = 0 ; y <= COLNO - 1; y++ )
        {
            if( levl[xmin][y] != STONE )
                found = 1;
        }
    }
    return 0;
}
)"
                }
            }
        },
        {
            "Missing_Corner-case_Handling_3_T",
            {
                {
                    "",
                    R"(extern int __VERIFIER_nondet_int(void);
/*
Commit Number: fad2eab749cce970fa87fa46186218b2dfe1adc1
URL: https://github.com/NetHack/NetHack/commit/fad2eab749cce970fa87fa46186218b2dfe1adc1
Project Name: NetHack
License: https://github.com/NetHack/NetHack/commit/60df7b2d3b73900481814084be027375b5888765
termination: TRUE


*/
int main()
{
    int ROWNO = __VERIFIER_nondet_int();
    int COLNO = __VERIFIER_nondet_int();
    if( ROWNO <= 0 || COLNO <= 0 || ROWNO > 65534 || COLNO > 65534 )
        return 0;
    int levl[ROWNO][COLNO];
    for( int i = 0 ; i < ROWNO ; i++ )
    {
        for( int j = 0 ; j < COLNO ; j++ )
        {
            int num = __VERIFIER_nondet_int();
            if( num > 0 )
                num = -num;
            levl[i][j] = num % 4;
        }
    }
    int STONE = 0;
    int found = 0;
    for( int xmin = 0; !found && xmin < ROWNO; xmin++ )
    {
        for( int y = 0 ; y <= COLNO - 1; y++ )
        {
            if( levl[xmin][y] != STONE )
                found = 1;
        }
    }
    return 0;
}
)"
                }
            }
        },
        {
            "Missing_Iterator_Update_1_NT",
            {
                {
                    "extern int __VERIFIER_nondet_int(void);\n"
                    "\n"
                    "int waitpid",
                    "extern int __VERIFIER_nondet_int(void);\n"
                    "int __fc_errno;\n"
                    "int waitpid"
                }
            }
        },
        {
            "Missing_Iterator_Update_1_T",
            {
                {
                    "extern int __VERIFIER_nondet_int(void);\n"
                    "\n"
                    "int waitpid",
                    "extern int __VERIFIER_nondet_int(void);\n"
                    "int __fc_errno;\n"
                    "int waitpid"
                },
                {
                    "",
                    R"(extern int __VERIFIER_nondet_int(void);
/*
Commit Number: fc600b6a8f0dec5642b45c1026dee24c9adb9bc2
URL: https://github.com/freedesktop/dbus/commit/fc600b6a8f0dec5642b45c1026dee24c9adb9bc2
Project Name: dbus
License: GPL2
termination: TRUE

*/
#define EINTR 1
#define OTHER 2
int errno;
int waitpid()
{
    int num = __VERIFIER_nondet_int();
    while( num < 0 )
    {
        if( __VERIFIER_nondet_int() && errno != EINTR )
            errno = EINTR;
        else
            errno = OTHER;
        return num;
    }
    return num;
}

int main()
{

    int ret = waitpid();
again:
    if( ret == 0 )
    {
        do{
            ret = waitpid();
        }while( ret < 0 && errno == EINTR );
    }
    return 0;
}
)"
                }
            }
        }
        //Missing_Iterator_Update_3_NT
        //Missing_Iterator_Update_3_T
        //Missing_Iterator_Update_5_NT
        //Missing_Iterator_Update_5_T
    };
    auto it = patches.find(fileName);
    if (it == patches.end()) return;
    const auto& replacements = it->second;
    std::ifstream inStream(filePath);
    if (!inStream.is_open()) return;
    std::stringstream inBuffer;
    inBuffer << inStream.rdbuf();
    inStream.close();
    std::string inFile = inBuffer.str();
    for (const auto& [sourceText, destinationText] : replacements) {
        if (sourceText.empty()) {
            if (inFile.empty() || it->first == "Incorrect_Initialization_4_NT" || it->first == "Incorrect_Initialization_4_T") {
                inFile = destinationText;
            }
            break;
        }
        size_t position = inFile.find(sourceText);
        while (position != std::string::npos) {
            inFile.replace(position, sourceText.length(), destinationText);
            position = inFile.find(sourceText, position + destinationText.length());
        }
    }
    std::ofstream outStream(filePath);
    outStream << inFile;
    outStream.close();
}