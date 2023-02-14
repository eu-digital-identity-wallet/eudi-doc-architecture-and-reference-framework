# The European Digital Identity Wallet 
## The Architecture and Reference Framework

On 3 June 2021, the European Commission adopted a Recommendation
calling on Member States to work towards the development of a Toolbox
including a technical Architecture and Reference Framework
a set of common standards and technical specifications and a
set of common guidelines and best practices.

The Recommendation specifies that these outcomes will serve as a basis
for the implementation of the proposal for a European Digital Identity
Framework, without the process of developing the Toolbox interfering
with, or prejudging the legislative process.

The Recommendation foresees that the Toolbox is developed by Member
States’ experts in the eIDAS Expert Group  in close coordination with
the Commission and, where relevant for the functioning of the European
Digital Identity (EUDI) Wallet infrastructure, other concerned public
and private sector parties.

This repository contains the "[Architecture and Reference Framework](ARF.md)"
(hereinafter the[ARF](ARF.md)).

The current authoritative version is tagged as [realease/tag in this
repository](https://github.com/eu-digital-identity-wallet/architecture-and-reference-framework/releases).


## Build
While the ARF is maintained in `Markdown`, this repository provides a
process for generating `HTML`, `DOCX`, and `PDF` (work in progress)
instances.

Generate the derived files
```bash
make all
```

Clean up
```bash
make clean
```

### Prerequisites
* `pandoc`

Install it (Ubuntu 22.04)
```bash
sudo apt install pandoc
```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct,
and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, 
see the [tags on this repository](https://github.com/eu-digital-identity-wallet/architecture-and-reference-framework/tags). 

## Authors

See the list of [contributors](https://github.com/eu-digital-identity-wallet/architecture-and-reference-framework/graphs/contributors) who participated in this project.

## License

This project is licensed under the [Attribution 4.0
International](http://creativecommons.org/licenses/by/4.0/) - see the
[LICENSE.txt](LICENSE) file for details.
