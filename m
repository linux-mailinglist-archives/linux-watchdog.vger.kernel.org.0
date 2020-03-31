Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A98BF199AC6
	for <lists+linux-watchdog@lfdr.de>; Tue, 31 Mar 2020 18:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731273AbgCaQEa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 31 Mar 2020 12:04:30 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36476 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731149AbgCaQE3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 31 Mar 2020 12:04:29 -0400
Received: by mail-pl1-f196.google.com with SMTP id g2so8286362plo.3;
        Tue, 31 Mar 2020 09:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X1SdScS0pJ3mpXQidkxmuvpGZqOVzChrbcKXKudpDIE=;
        b=h+JLJxK7CFJYfYvYfWqX5h/pazSbJqr8Ek50GeADQYHW/2KqN4zP/w06oOvbpKlAv3
         kokFeznSBsgR06ybz8/OAD65dey+GNq2fZ6lHZ5NVrM8Ubb6RaYj5hLjzUUfy7OHrWLt
         FaPZIIxqk8lMiUNyM822AEjaZAyWg1SMLhhzEEbmlR+RwkYokXWxCEbdMsjmySYboWiS
         2qpeu6x5sTJ2wsv9IxH53gUCwQrgxqKIQPaYELY56gizC7PUuzAw6FahG9hZVSg/8gGX
         4fc4ElrvSB8NrTFypCUSeTtRA2Sevqnft/A6U1AwDIo8COjJ1RkJlIivz+uOTyBJ1SGl
         lk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=X1SdScS0pJ3mpXQidkxmuvpGZqOVzChrbcKXKudpDIE=;
        b=Lu+kFiGm7s4r1xx7miP5dFbd1M6viNuMfURr1jvHfQJRg7gaug7Y5ihswjzD6PLPq9
         xWlHmjVcrQmfsV/HHIh86d5k3AxM5r4N56NbTDpydMHzu/paq1A+mr2BAiXyrdVfoelX
         X5BMAyD72rcMD9EIfNLoQCtcDbTU34vkSA1PSE2I/gjYaCH8PP1BW5LI+h+AHwLU622u
         9qivxF+HTcweZcfL+WiXOytULK00w5GLyv891hwduoyT3KqIXKsHi4onxY1QLCMMBCOY
         v7bhDKtfxoK1Urq19hg7+TT56vTxpJWEgquCJyuxZXk31oKYMUXWDLjkyZKPYUARwMqI
         K4jg==
X-Gm-Message-State: AGi0Pub+x+tpTT3KE0KGw93wctV5cVKpT/4jMkIZ9/6FvJFrDNFmbxq+
        Nm334VzB8lYH+AryfDc2pUqTxNGv
X-Google-Smtp-Source: APiQypJrspyRp5umB9TCpbf1jLE5RudoTIIta4kOP3pK2QDOLN/kiqt2GTpeVBzTaLoYy1KFfMJgNw==
X-Received: by 2002:a17:90b:14cf:: with SMTP id jz15mr4929463pjb.36.1585670667858;
        Tue, 31 Mar 2020 09:04:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k189sm11972590pgc.24.2020.03.31.09.04.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 09:04:27 -0700 (PDT)
Date:   Tue, 31 Mar 2020 09:04:26 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] watchdog: da9062: Use pre-configured timeout until
 userspace takes over
Message-ID: <20200331160426.GA41516@roeck-us.net>
References: <20200326150203.371673-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326150203.371673-1-s.riedmueller@phytec.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Mar 26, 2020 at 04:02:01PM +0100, Stefan Riedmueller wrote:
> If the watchdog is already running during probe read back its
> pre-configured timeout (set e.g. by the bootloader) and use it to ping
> the watchdog until userspace takes over. Otherwise the default timeout
> set before might not result in a fast enough ping.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/watchdog/da9062_wdt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 0ad15d55071c..6d81b1276b87 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -35,6 +35,14 @@ struct da9062_watchdog {
>  	bool use_sw_pm;
>  };
>  
> +static unsigned int da9062_wdt_read_timeout(struct da9062_watchdog *wdt)
> +{
> +	int val;
> +
> +	regmap_read(wdt->hw->regmap, DA9062AA_CONTROL_D, &val);
> +	return wdt_timeout[val & DA9062AA_TWDSCALE_MASK];
> +}
> +
>  static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
>  {
>  	unsigned int i;
> @@ -184,6 +192,7 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	int ret;
> +	int timeout;
>  	struct da9062 *chip;
>  	struct da9062_watchdog *wdt;
>  
> @@ -213,6 +222,13 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_drvdata(&wdt->wdtdev, wdt);
>  	dev_set_drvdata(dev, &wdt->wdtdev);
>  
> +	timeout = da9062_wdt_read_timeout(wdt);
> +	if (timeout > 0) {
> +		wdt->wdtdev.timeout = timeout;
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdtdev.status);
> +		dev_info(wdt->hw->dev, "watchdog is running (%u s)", timeout);
> +	}

Oh, and I agree with the comment made for the da9063 driver: This driver
should really implement watchdog_init_timeout() and set the default timeout
accordingly if specified in dt (or, in other words, follow the da9063
implementation).

Guenter

> +
>  	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
>  	if (ret < 0)
>  		return ret;
