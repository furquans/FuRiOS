
int main(void)
{
	char *string = "Hello, FuRiOS!\n";
	while(*string) {
		*(volatile char *)0x49020000 = *string;
		string++;
	}

	while(1); /* We can't exit, there's nowhere to go */
	return 0;
}
