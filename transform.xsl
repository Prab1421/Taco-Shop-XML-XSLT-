<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>The Little Taco Shop</title>
                <link rel="stylesheet" href="2.css"/>
            </head>
            <body>
                <header>
                    <h1>The Little Taco Shop</h1>
                    <nav>
                        <ul>
                            <li><a href="#menu">Menu</a></li>
                            <li><a href="#hours">Hours</a></li>
                            <li><a href="#about">About</a></li>
                            <li><a href="#contact">Contact</a></li>
                        </ul>
                    </nav>
                </header>

                <section id="menu">
                    <h2>Our Menu</h2>
                    <table border="1">
                        <tr>
                            <th>Taco Type</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                        <xsl:apply-templates select="LittleTacoShop/Menu/Item"/>
                        <tr>
                            <td colspan="3">
                                <xsl:value-of select="LittleTacoShop/Menu/Extra/Item"/> - <xsl:value-of select="LittleTacoShop/Menu/Extra/Price"/>
                            </td>
                        </tr>
                    </table>
                </section>

                <section id="hours">
                    <h2>Hours</h2>
                    <dl>
                        <xsl:apply-templates select="LittleTacoShop/Hours/Weekdays"/>
                        <xsl:apply-templates select="LittleTacoShop/Hours/Weekends"/>
                    </dl>
                </section>

                <section id="about">
                    <h2>About LTS</h2>
                    <p>Founded in <xsl:value-of select="LittleTacoShop/About/Founded"/>.</p>
                    <p><xsl:value-of select="LittleTacoShop/About/Story"/></p>
                </section>

                <section id="contact">
                    <h2>Contact Us</h2>
                    <p>Address: <xsl:value-of select="LittleTacoShop/Contact/Location/Address"/></p>
                    <p>Phone: <a href="tel:{LittleTacoShop/Contact/Location/Phone}"><xsl:value-of select="LittleTacoShop/Contact/Location/Phone"/></a></p>
                    
                    <h3>Contact Form</h3>
                    <form action="https://httpbin.org/get" method="get">
                        <p>
                            <label for="name">Name:</label>
                            <input class="contact__input" type="text" name="Name" id="Name" placeholder="Ram" required="required" />
                        </p>
                        <p>
                            <label for="email">Email:</label>
                            <input class="contact__input" type="email" name="email" id="email" placeholder="abc@gmail.com" required="required" />
                        </p>
                        <p>
                            <label for="message">Message:</label>
                            <textarea id="message" name="message" rows="4"></textarea>
                        </p>
                        <button type="submit">Send</button>
                    </form>
                </section>

                <footer class="footer">
                    <p>
                        <span class="nowrap">Copyright &#169; <time id="year"> </time></span>
                        <span class="nowrap">Little Taco Shop </span>
                    </p>
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Menu/Item">
        <tr>
            <td><xsl:value-of select="@type"/></td>
            <td><xsl:value-of select="Quantity"/></td>
            <td><xsl:value-of select="Price"/></td>
        </tr>
    </xsl:template>

    <xsl:template match="Hours/Weekdays">
        <dt><xsl:value-of select="Days"/></dt>
        <dd><xsl:value-of select="Time"/></dd>
    </xsl:template>

    <xsl:template match="Hours/Weekends">
        <dt><xsl:value-of select="Days"/></dt>
        <dd><xsl:value-of select="Time"/></dd>
    </xsl:template>
</xsl:stylesheet>
