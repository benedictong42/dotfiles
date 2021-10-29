#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

# Load install functions
source_all_file_in_dir "$(cd .. && pwd)/apps/essentials"
source_all_file_in_dir "$(cd .. && pwd)/apps/apple_store"
source_all_file_in_dir "$(cd .. && pwd)/apps/browsers"
source_all_file_in_dir "$(cd .. && pwd)/apps/clis"
source_all_file_in_dir "$(cd .. && pwd)/apps/developer"
source_all_file_in_dir "$(cd .. && pwd)/apps/lifestyle"