Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 726FA174CD2
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Mar 2020 11:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgCAKsN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 1 Mar 2020 05:48:13 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37432 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgCAKsN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 1 Mar 2020 05:48:13 -0500
Received: by mail-pl1-f196.google.com with SMTP id q4so3034517pls.4;
        Sun, 01 Mar 2020 02:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A53gC+RfC7zmp0f0TDYfbN3t0EUbzSA9wOyX7JA2gYY=;
        b=XSYfapLvHcNViQ0j0sUWvp1LcPPDkSPa8h9Li50ug4i+l+yyFQ8KcE+lpdVUd4kOA4
         DlC9d2veNFOlqeH9+AjMT/Xyjr4UyN/TyH+45o/tUULVItbDAkNZECNNQJyZ6X3B8j0S
         kcLFCDdy7I5tkfWHAYBI6azHxgpwx7tYpQKwexPyCcUHKjQEZ6g9mpVFAdtTaYHjXVdT
         PIvmOLG5mQC/WYQ6VhkBX+aqVCSFQrP30oa0JjsxqJyuHZQYz+INrOhr90Umswx0cvEd
         Gi7Fbr5Qi6+XeE1XcyfmkCIlgMfgmH6368TEd/XZuwDC9qDF/uxXkUxCCKwdSwod6gQa
         q5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=A53gC+RfC7zmp0f0TDYfbN3t0EUbzSA9wOyX7JA2gYY=;
        b=SbeNqiiR3wRyTOYYbhwgRbXvEIIj3ms6NuS+YljNe7UVBQXrxav02zhQA3OiKzfTp1
         XOR1K1jOJgXnMJMAXmtqGrfxSAVYe60nKIVBoEUnC58gOSRJ2Ea6OJsbk0doLSDcWcxO
         cYQPJY4tiHRR0t/CD1fGPlAKHTfHERrXTSd3CdpvxN3Yxzc6g+D8rwmPMRM0YutVUxoN
         +i1dI6nF9VJFlA14pJL1eNAJ6LOrGhrtpiUgtGbO1NJUefknHK9HT/EDKjh+xJkTP1xr
         SwixpD95d6CbTIhifkCEuO2s59hBJarjR5BPG3lPrwO+EcXJbAFzspdJRIThKpbx5sbM
         uAQg==
X-Gm-Message-State: APjAAAV8b3JIb76ONd4JhtxLKMbWqsEcUjquAng44aBTRVVt2xSHxoqW
        yw1uEc/Y8GY4WYgFDU27ApU=
X-Google-Smtp-Source: APXvYqxv+gV2P7/wOE+6NDBdXmUZquV1RpSVjIKbo8Asb52yZ6IFL0CjUInClqrtYn3NRVeZ1WjMCA==
X-Received: by 2002:a17:902:9f83:: with SMTP id g3mr12817171plq.101.1583059691512;
        Sun, 01 Mar 2020 02:48:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d1sm8827044pfc.3.2020.03.01.02.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2020 02:48:10 -0800 (PST)
Subject: Re: [PATCH v1 4/4] watchdog: npcm: sets card ext1 and ext2 bootstatus
 during probe
To:     Tomer Maimon <tmaimon77@gmail.com>, wim@linux-watchdog.org,
        robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
        avifishman70@gmail.com, tali.perry1@gmail.com, yuenn@google.com,
        benjaminfair@google.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20200301094040.123189-1-tmaimon77@gmail.com>
 <20200301094040.123189-5-tmaimon77@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <026fa94c-8fde-acda-e218-ffff9b5891c9@roeck-us.net>
Date:   Sun, 1 Mar 2020 02:48:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200301094040.123189-5-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/1/20 1:40 AM, Tomer Maimon wrote:
> During probe NPCM watchdog sets the following bootstatus flags:
> 	- WDIOF_CARDRESET represent power and core reset.
> 	- WDIOF_EXTERN1 represent watchdog 0-2 reset.
> 	- WDIOF_EXTERN2 represent software 1-4 reset.
> 
> Each flag is representing a group of bootstatus.
> The user can configure through the device treethe exact reset
> to each flag group.
> 

Sorry, this doesn't make sense to me. I could understand reporting
the above, but it looks to me like devicetree is used to associate
a reset bit from the controller with one of the above.
Devicetree only seems to be used to associate reset status bits
from the controller with WDIOF_CARDRESET, WDIOF_EXTERN1, or
WDIOF_EXTERN2. That adds a lot of complexity for little if any
gain.

It would make sense to set the bootstatus bits as suggested above,
but that doesn't require devicetree properties.

More comments inline.

Guenter

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/watchdog/npcm_wdt.c | 132 ++++++++++++++++++++++++++++++++----
>  1 file changed, 119 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> index 8609c7acf17d..dba9a73249c9 100644
> --- a/drivers/watchdog/npcm_wdt.c
> +++ b/drivers/watchdog/npcm_wdt.c
> @@ -11,7 +11,24 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/watchdog.h>
> -
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +
New include files in alphabetic order merged with existing ones, please.

> +/* NPCM7xx GCR module */
> +#define NPCM7XX_RESSR_OFFSET		0x6C
> +#define NPCM7XX_INTCR2_OFFSET		0x60
> +
> +#define NPCM7XX_PORST			BIT(31)
> +#define NPCM7XX_CORST			BIT(30)
> +#define NPCM7XX_WD0RST			BIT(29)
> +#define NPCM7XX_WD1RST			BIT(24)
> +#define NPCM7XX_WD2RST			BIT(23)
> +#define NPCM7XX_SWR1RST			BIT(28)
> +#define NPCM7XX_SWR2RST			BIT(27)
> +#define NPCM7XX_SWR3RST			BIT(26)
> +#define NPCM7XX_SWR4RST			BIT(25)
> +
> + /* WD register */
>  #define NPCM_WTCR	0x1C
>  
>  #define NPCM_WTCLK	(BIT(10) | BIT(11))	/* Clock divider */
> @@ -43,6 +60,9 @@
>  struct npcm_wdt {
>  	struct watchdog_device  wdd;
>  	void __iomem		*reg;
> +	u32			card_reset;
> +	u32			ext1_reset;
> +	u32			ext2_reset;
>  };
>  
>  static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
> @@ -103,30 +123,29 @@ static int npcm_wdt_stop(struct watchdog_device *wdd)
>  	return 0;
>  }
>  
> -
>  static int npcm_wdt_set_timeout(struct watchdog_device *wdd,
>  				unsigned int timeout)
>  {
>  	if (timeout < 2)
>  		wdd->timeout = 1;
>  	else if (timeout < 3)
> -	      wdd->timeout = 2;
> +		wdd->timeout = 2;
>  	else if (timeout < 6)
> -	      wdd->timeout = 5;
> +		wdd->timeout = 5;
>  	else if (timeout < 11)
> -	      wdd->timeout = 10;
> +		wdd->timeout = 10;
>  	else if (timeout < 22)
> -	      wdd->timeout = 21;
> +		wdd->timeout = 21;
>  	else if (timeout < 44)
> -	      wdd->timeout = 43;
> +		wdd->timeout = 43;
>  	else if (timeout < 87)
> -	      wdd->timeout = 86;
> +		wdd->timeout = 86;
>  	else if (timeout < 173)
> -	      wdd->timeout = 172;
> +		wdd->timeout = 172;
>  	else if (timeout < 688)
> -	      wdd->timeout = 687;
> +		wdd->timeout = 687;
>  	else
> -	      wdd->timeout = 2750;
> +		wdd->timeout = 2750;
>  

Whitespace changes in a separate patch, please.

>  	if (watchdog_active(wdd))
>  		npcm_wdt_start(wdd);
> @@ -177,9 +196,61 @@ static const struct watchdog_ops npcm_wdt_ops = {
>  	.restart = npcm_wdt_restart,
>  };
>  
> +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev)
> +{
> +	struct regmap *gcr_regmap;
> +	u32 rstval;
> +
> +	if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
> +		gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
> +		if (IS_ERR(gcr_regmap))
> +			dev_warn(dev, "Failed to find nuvoton,npcm750-gcr WD reset status not supported\n");
> +
> +		regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &rstval);
> +		if (!rstval) {
> +			regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &rstval);
> +			rstval = ~rstval;
> +		}

The second register reports the same as the first only negated if
bits in the first register are not set ? That seems unlikely.
Please point to the datasheet, or at least provide a reference to the
two registers.

> +
> +		if (rstval & wdt->card_reset)
> +			wdt->wdd.bootstatus |= WDIOF_CARDRESET;
> +		if (rstval & wdt->ext1_reset)
> +			wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> +		if (rstval & wdt->ext2_reset)
> +			wdt->wdd.bootstatus |= WDIOF_EXTERN2;
> +	}
> +}
> +
> +static u32 npcm_wdt_reset_type(const char *reset_type)
> +{
> +	if (!strcmp(reset_type, "porst"))
> +		return NPCM7XX_PORST;
> +	else if (!strcmp(reset_type, "corst"))
> +		return NPCM7XX_CORST;
> +	else if (!strcmp(reset_type, "wd0"))
> +		return NPCM7XX_WD0RST;
> +	else if (!strcmp(reset_type, "wd1"))
> +		return NPCM7XX_WD1RST;
> +	else if (!strcmp(reset_type, "wd2"))
> +		return NPCM7XX_WD2RST;
> +	else if (!strcmp(reset_type, "sw1"))
> +		return NPCM7XX_SWR1RST;
> +	else if (!strcmp(reset_type, "sw2"))
> +		return NPCM7XX_SWR2RST;
> +	else if (!strcmp(reset_type, "sw3"))
> +		return NPCM7XX_SWR3RST;
> +	else if (!strcmp(reset_type, "sw4"))
> +		return NPCM7XX_SWR4RST;
> +
> +	return 0;
> +}
> +
>  static int npcm_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	const char *card_reset_type;
> +	const char *ext1_reset_type;
> +	const char *ext2_reset_type;
>  	struct npcm_wdt *wdt;
>  	u32 priority;
>  	int irq;
> @@ -202,6 +273,39 @@ static int npcm_wdt_probe(struct platform_device *pdev)
>  	else
>  		watchdog_set_restart_priority(&wdt->wdd, priority);
>  
> +	ret = of_property_read_string(pdev->dev.of_node,
> +				      "nuvoton,card-reset-type",
> +				      &card_reset_type);
> +	if (ret) {
> +		wdt->card_reset = NPCM7XX_PORST;
> +	} else {
> +		wdt->card_reset = npcm_wdt_reset_type(card_reset_type);
> +		if (!wdt->card_reset)
> +			wdt->card_reset = NPCM7XX_PORST;
> +	}
> +
> +	ret = of_property_read_string(pdev->dev.of_node,
> +				      "nuvoton,ext1-reset-type",
> +				      &ext1_reset_type);
> +	if (ret) {
> +		wdt->ext1_reset = NPCM7XX_WD0RST;
> +	} else {
> +		wdt->ext1_reset = npcm_wdt_reset_type(ext1_reset_type);
> +		if (!wdt->ext1_reset)
> +			wdt->ext1_reset = NPCM7XX_WD0RST;
> +	}
> +
> +	ret = of_property_read_string(pdev->dev.of_node,
> +				      "nuvoton,ext2-reset-type",
> +				      &ext2_reset_type);
> +	if (ret) {
> +		wdt->ext2_reset = NPCM7XX_SWR1RST;
> +	} else {
> +		wdt->ext2_reset = npcm_wdt_reset_type(ext2_reset_type);
> +		if (!wdt->ext2_reset)
> +			wdt->ext2_reset = NPCM7XX_SWR1RST;
> +	}
> +
>  	wdt->wdd.info = &npcm_wdt_info;
>  	wdt->wdd.ops = &npcm_wdt_ops;
>  	wdt->wdd.min_timeout = 1;
> @@ -220,8 +324,10 @@ static int npcm_wdt_probe(struct platform_device *pdev)
>  		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
>  	}
>  
> -	ret = devm_request_irq(dev, irq, npcm_wdt_interrupt, 0, "watchdog",
> -			       wdt);
> +	npcm_get_reset_status(wdt, dev);
> +
> +	ret = devm_request_irq(dev, irq, npcm_wdt_interrupt, 0,
> +			       "watchdog", wdt);
>  	if (ret)
>  		return ret;
>  
> 

