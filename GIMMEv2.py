import os
import time
import subprocess
import webbrowser
import requests
import sys
import time
import datetime
import colorama
from colorama import Fore
from collections import Counter
import subprocess



def password():
    if os.path.exists("files"):
        # The "files" folder exists, proceed to password check
        check_password()
    else:
        print_gimme("Please run setup.bat")
        # You might want to add some logic to handle this case

def initialize_first_run():
    # Additional initialization code can go here
    with open("files/confirmeduser.txt", "w") as file:
        file.write("This file indicates that the script has been run at least once. So you know the password. DO NOT DELETE THIS.")
    # Proceed to password check
    main_menu()

def check_password():
    if os.path.exists("files/confirmeduser.txt"):
        main_menu()
    else:
        print()
        print_gimme("What's the password?")
        print()
        choice = input(">> ").lower()
        clear_screen()
        if choice == "aids":
            initialize_first_run()
        else:
            print()
            print_colored("[", CmdColors.CYAN, "GIMME V2", CmdColors.RESET, "] ", CmdColors.RESET, CmdColors.RED, CmdColors.UNDERLINE, "WRONG", CmdColors.RESET, CmdColors.RED, "!", CmdColors.RESET)
            check_password()

def main_menu():
    while True:
        banner()
        print("""
                             ╔════════════════════════════════════════╗
                             ║ (1) Log Book          (4) Trace IP     ║
                             ║                                        ║
                             ║ (2) IP Ping           (5) My IP        ║
                             ║                                        ║
                             ║ (3) Doxxing Tools     (6) Trace DNS    ║
                             ║                                        ║
                             ╠════════════════════════════════════════╣
                             ║ (0) Exit                  (99) Update  ║
                             ╚════════════════════════════════════════╝                                 
        """)


        choice = input(">> ").lower()
        
        if choice == "0":
            exit()
        elif choice == "1":
            log_book()
        elif choice == "2":
            ip_ping()
        elif choice == "3":
            doxxing_tools()
        elif choice == "4":
            trace_ip()
        elif choice == "5":
            my_ip()
        elif choice == "99":
            update()



# IP Log book stuff --------------------
def log_book(): # MAIN <----------------
    clear_screen()
    banner()
    print("""
                              ╔══════════════════════════════════════╗
                              ║     "1" for logs, "b" to go back.    ║
                              ║       This logs names with IP's      ║
                              ╚══════════════════════════════════════╝                                 
    """)
    print_gimme("What's the person's name to log")
    print()
    print_colored(">> ")
    target = input("")
    if target == "1":
        logbkdata()
    if target == "b":
        main_menu()
    logbk2(target)
    main_menu()

def logbk2(target): # GET TARGET IP <---
    clear_screen()
    banner()
    print("""
                              ╔══════════════════════════════════════╗
                              ║     "1" for logs, "b" to go back.    ║
                              ║           Answer correctly.          ║
                              ╚══════════════════════════════════════╝                                 
    """)
    print_gimme(f"What's {target}'s IP address")
    print()
    ip = input(">> ")
    if ip == "b": 
        log_book()
    logbk3(target, ip)

def logbk3(target, ip): # CHECKS DATA <-
    clear_screen()
    banner()
    print("""
                              ╔══════════════════════════════════════╗
                              ║     "1" for logs, "b" to go back.    ║
                              ║           Answer correctly.          ║
                              ╚══════════════════════════════════════╝                                 
    """)
    print_gimme("Is this correct data [Y or N]")
    print()
    print(f"Name: {target}")
    print(f"{target}'s IP: {ip}")
    date_time()
    correct = input(">> ").lower()
    if correct == "y":
        print_gimme("Wuld you like to save the data [Y or N]")
        print()
        save = input(">> ").lower()
        if save == "n":
            log_book()
        clear_screen()
        banner()
        with open("files/IPLogs.txt", "a") as file:
            file.write(f"--  {target}  //  {ip}  \\ -  //  {date_time_return()}  \\\r\n")
        print_gimme(f"{target}'s data has been successfully saved. you can type ""1"" to open log book")
        print()
        seedata = input(">> ")
        if seedata == "1":
            logbkdata()
        
        main_menu()
    log_book()
           
def logbkdata(): # SAVES DATA <---------
    clear_screen()
    banner() 
    print_gimme("This is all saved data.")
    print("\n\n")
    with open("files/IPLogs.txt", "r") as file:
        logdata = file.read()
        print(logdata)
    print()
    print_gimme("Enter delete data to clear saved IP logs or ""b"" for main menu")
    print()
    cleardata = input(">> ").lower()
    if cleardata == "delete data":
        with open("files/IPLogs.txt", "w") as file:
            file.write("")
            clear_screen()
            banner()
            print_gimme("All data sucessfully cleared. Click enter for main menu")
            input()
            main_menu()
    main_menu()
  #
  #


# IP Pinger ----------------------------
def ip_ping_output(ip): # PINGS <-------
    ping_results = []

    for _ in range(10):
        try:
            subprocess.check_output(f'ping -n 1 {ip}', shell=True)
            result = f"{ip} is {CmdColors.GREEN}online.{CmdColors.RESET}"
        except subprocess.CalledProcessError:
            result = f"{ip} is {CmdColors.RED}offline.{CmdColors.RESET}"
        ping_results.append(result)

    clear_screen()
    banner()
    print("""
                            ╔══════════════════════════════════════╗
                            ║     "b" to go to the main menu.      ║
                            ║    Press "enter" to ping again.      ║
                            ╚══════════════════════════════════════╝                               
    """)

    for result in ping_results:
        print_colored_noani(result)

    most_common_result = Counter(ping_results).most_common(1)[0][0]
    overall_status = most_common_result.split(' ')[-1]
    print()
    print(f"{ip} is {overall_status}")

    ans = input(">> ")
    if ans == "b":
        main_menu()
    elif ans == "":
        ip_ping_output(ip)
    
def ip_ping(): # MAIN <-----------------
    clear_screen()
    banner()
    print("""
                            ╔══════════════════════════════════════╗
                            ║     "b" to go to the main menu.      ║
                            ║   This pings IP addresses to check   ║
                            ║         if they are online.          ║
                            ╚══════════════════════════════════════╝                               
    """)
    print_gimme("What's the IP address you would like to ping.")
    print()
    ip = input(">> ")
    if ip == "b":
        main_menu()
    if ip.isalpha():
        print_error("Invalid input. Please press 'any key' to retry.")
        input("")
        ip_ping()
    clear_screen()
    print_gimme(f"Hello, Im pinging {ip} as we speak. DONT TOUCH KEY BOARD please.")
    ip_ping_output(ip)


# Updater ------------------------------
def update():
    
    pass





        
    

def doxxing_tools():
    # Your doxxing tools logic here
    pass

def trace_ip():
    # Your trace IP logic here
    pass

def my_ip():
    webbrowser.open("https://ipinfo.io/json")
    main_menu()









# Main Functions --------------------------





# Quick Functions -------------------------



def date_time_return():
    from datetime import datetime
    # Get the current date and time
    current_datetime = datetime.now()
    # Format the current date and time
    formatted_datetime = current_datetime.strftime("%Y-%m-%d %H:%M:%S")
    # Return the formatted date and time instead of printing
    return formatted_datetime

def date_time():
    from datetime import datetime
    # Get the current date and time
    current_datetime = datetime.now()
    # Format the current date and time
    formatted_datetime = current_datetime.strftime("%Y-%m-%d %H:%M:%S")
    # Return the formatted date and time instead of printing
    print(f"Time: {formatted_datetime}")


class CmdColors:
    # ANSI escape codes for text color
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    WHITE = '\033[97m'
    
    # ANSI escape codes for text formatting
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    
    # ANSI escape code to reset text color and formatting
    RESET = '\033[0m'

def print_colored(*text_parts):
    colored_text = ''.join(text_parts)
    type_effect(colored_text)

def print_colored_noani(*text_parts):
    colored_text = ''.join(text_parts)
    print(colored_text)

def print_gimme(*additional_text):
    base_text = [CmdColors.WHITE, "[", CmdColors.CYAN, "GIMME V2", CmdColors.RESET, "]", " "]
    colored_text = ''.join(base_text + list(additional_text))
    type_effect(colored_text)

def print_error(*additional_text):
    base_text = [CmdColors.WHITE, "[", CmdColors.RED, "ERROR", CmdColors.RESET, "]", " "]
    colored_text = ''.join(base_text + list(additional_text))
    type_effect(colored_text)

def type_effect(text):
    for char in text:
        sys.stdout.write(char)
        sys.stdout.flush()
        time.sleep(0.03)  # Adjust the sleep duration for the desired typing speed

def banner():
    clear_screen()
    print_colored_noani(CmdColors.CYAN, """ 
                   ██████╗ ██╗███╗   ███╗███╗   ███╗███████╗    ██╗   ██╗██████╗ 
                  ██╔════╝ ██║████╗ ████║████╗ ████║██╔════╝    ██║   ██║╚════██╗
                  ██║  ███╗██║██╔████╔██║██╔████╔██║█████╗      ██║   ██║ █████╔╝
                  ██║   ██║██║██║╚██╔╝██║██║╚██╔╝██║██╔══╝      ╚██╗ ██╔╝██╔═══╝ 
                  ╚██████╔╝██║██║ ╚═╝ ██║██║ ╚═╝ ██║███████╗     ╚████╔╝ ███████╗
                   ╚═════╝ ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝      ╚═══╝  ╚══════╝
                             
                       ---------------------------------------------------    
  
    """, CmdColors.RESET )
    

def clear_screen():
    # Check if the operating system is Windows
    if os.name == 'nt':
        os.system('cls')  # For Windows
    else:
        os.system('clear')  # For Linux and macOS

# starting up
def main():
    password()

if __name__ == "__main__":
    main()
    repository_owner = "GIGGAhacker"
    repository_name = "GIMME-V2"
    script_name = ".py"