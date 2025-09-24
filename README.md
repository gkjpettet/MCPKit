# MCPKit
An easy to use Xojo implementation of a Model Context Protocol server for interacting with LLMs.

## What is a MCP server?
A Model Context Protocol (MCP) server is an application that exposes tools to a large language model (LLM) over a standardised protocol. The MCP protocol was created by Anthropic, is [well documented][docs] and is supported by the major proprietary LLM vendors as well as open source solutions such as LM Studio.

## About MCPKit
`MCPKit` is a Xojo module that contains everything you need to turn a Xojo `ConsoleApplication` into a MCP server. Simply drop the module into a Xojo console project, change the superclass of the `App` object to `MCPKit.ServerApplication` and you're good to go.

The module supports command line options and custom tools. For a more thorough implementation, see my [mcpweb] GitHub project which provides Kagi-based web searching for local LLMs:

## MCPKit server application lifecycle
The `MCPKit.ServerApplication` exposes three event definitions:

- `WillParseOptions`
- `DidParseOptions`
- `Configure`

You don't need to implement the `Run` event as the server will start up immediately and process incoming responses automatically.

If you want to specify command line arguments for your server then define them in `WillParseOptions` like so:

```xojo
// Add a single required option for an API key to be passed to the server.
Self.CommandLineParser.AddOption("k", "apikey", "The API key to use.", _
MCPKit.OptionTypes.String, True)
```

As soon as the command line arguments have been parsed, the `DidParseOptions` event is raised so you can grab their values in this event through the application's `CommandLineParser` object. They are available elsewhere in your app but it's not until the `DidParseOptions` event has been raised that they have been validated.

If required options are not passed to the application or there is another error then the server will log this to stderr and correctly report back via MCP to the calling LLM that a problem occurred.

Once command line options have been parsed but before the server actually starts running, the `Configure` event is raised. Use this event to register any tools that you'd like to expose to LLMs. Tools can take any number of named parameters and pass these to a tool's `Run` method. Write your Xojo code in this method and return a response to the LLM in the form of a string.

If you check out my [mcpweb] project you'll see a class named `KagiSearchTool` that's a subclass of `MCPKit.Tool` and illustrates how easy it is to expose parameters to an LLM, describe the tool and then execute Xojo code and return the response. In fact, not counting the web searching code in the `KagiSearchTool` class, there's only 6 lines of Xojo code to get a MCP server up and running in the `mcpweb` project!

[mcpweb]: https://github.com/gkjpettet/mcpweb
[docs]: https://modelcontextprotocol.io/docs/getting-started/intro