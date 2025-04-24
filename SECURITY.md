<!--
Copyright (c) 2025, Steve Morin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Security Controls

- Automated scanning with GitHub CodeQL
- Dependabot alerts and updates
- Protected main branch
- Required code reviews
- Regular dependency audits
- SAST and SCA scanning
- Secure development practices

## Reporting Vulnerabilities

1. **Private Reporting**: Use GitHub's private vulnerability reporting
2. **Response Time**: Initial response within 48 hours
3. **Process**:
   - Acknowledgment
   - Investigation
   - Fix development
   - Security advisory publication
   - Public disclosure

## Security Best Practices

### For Contributors
- Use secure dependency versions
- Implement input validation
- Follow OWASP guidelines
- No hardcoded secrets
- Validate file operations

### For Users
- Keep dependencies updated
- Use environment variables
- Set appropriate file permissions
- Follow least privilege principle
- Enable 2FA for GitHub access

## Security Measures

### Authentication
- Token-based authentication
- Secure token storage
- Environment variable usage

### Data Protection
- No sensitive data in logs
- Secure file operations
- Input sanitization

## Compliance

Our security practices align with:
- OWASP Top 10
- CWE guidelines
- NIST standards
