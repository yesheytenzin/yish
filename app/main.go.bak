package main

import (
	"bufio"
	"errors"
	"fmt"
	"os"
	"os/exec"
	"strings"
)

func execInput(input string) error {
	// remove new line
	input = strings.TrimSuffix(input, "\n");

	// seperate command and args which are seperated by space
	args := strings.Split(input, " ");
	

	switch args[0] {
	case "cd":
		if len(args) < 2 {
			return errors.New("path required");
		}

		return os.Chdir(args[1]);

	case "exit":
		os.Exit(0);
	}

	// prep command to execute
	cmd := exec.Command(args[0], args[1:]...);
	
	// output 
	cmd.Stderr = os.Stderr;
	cmd.Stdout = os.Stdout;

	return cmd.Run();
}

func main() {
	reader := bufio.NewReader(os.Stdin);

	for {
		fmt.Print("$ ")
		
		// read input
		input, err := reader.ReadString('\n');
		if err != nil {
			fmt.Fprintln(os.Stderr, err);
		}

		// input execution
		if err = execInput(input); err != nil {
			fmt.Fprintln(os.Stderr, err);
		}
	}
}
