Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A642B627FB
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jul 2019 20:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730714AbfGHSJC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Jul 2019 14:09:02 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37045 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729025AbfGHSJC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Jul 2019 14:09:02 -0400
Received: by mail-pl1-f194.google.com with SMTP id b3so5362749plr.4
        for <linux-watchdog@vger.kernel.org>; Mon, 08 Jul 2019 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MYRD/UM0RaP057UiZmuJrjwCSqgPaX3z3z5TTCq17bE=;
        b=n5JDtGtK8Rjn1LN7xKAiz5Ozn8ZI/QHLgtN36dI6BqIOq79i1aOmWe4M1stFzL1Bza
         8SqQb56H26JwEiknkDSfdvfAwIK84Cy2eqcyqpwbjwDGoqWgWsr0aUX2L3IpMKKXYQ2q
         r7ih6T2HIaW0jKW/LWT9v0l9syPHJ94+VyKLhTyD53bw/dqPJrfEpWJoXRDhSnHTH4H9
         0KD9NnpJENOwB7qy3PoKKwdqt7tjIuFygoKPj8Rc41KFEvo5t8iC2/ug3W5F9X0h5YLi
         K7mTy3jfu2LyrEBOrAgF0H5QwqIMg5zZDwYBnLpnYPmNnZZf+H7JP7+DISPT9GLDl26j
         7TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=MYRD/UM0RaP057UiZmuJrjwCSqgPaX3z3z5TTCq17bE=;
        b=MYHAK1Kncm1QDyYahJm+F+RnQVQAAv7aCtHZUgpjm4vEXsJpkm1nZLfjefgsttDzQr
         qBGYIQdsQNtAEEyX3P2c8/V602COiffdVsTU1Y8KiAW993/ZHXXgVApIKY0hiEXN7wby
         QUKB4OZNdCDMriG3B+qcPejXectDBWwDl2+iLkLsjEi6xVLNW1l3R2uk+Y1Yon5m99Cp
         DFUb2oHo+GdsKgixc/gBBf8M9MgH2P8GZYvxrHSaMEQti/VtgPO/jT6x4K4Lw6nsACsC
         9Wo5t4RTFPhof7aPK6Rv6ilYcnDvWJRcmoBLyyjXI3uP+8qwyqQXiuTW2mZ64a6qCs1/
         UEvw==
X-Gm-Message-State: APjAAAWgiIZC8mUP4vdO3is6JqG/yVnmV8mkTUEPHQ7b5tAcyDnIIz5G
        uEDt9KXxorLW13nDEBODBZPlawzG
X-Google-Smtp-Source: APXvYqyhUQvDLYCeRSGXRUVafyl5hoVsRM/q9OcaSCLonm26szZpb7dS90Tqd+GPE1guNSyiE793AA==
X-Received: by 2002:a17:902:112c:: with SMTP id d41mr26269335pla.33.1562609341805;
        Mon, 08 Jul 2019 11:09:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n7sm22817532pff.59.2019.07.08.11.09.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 11:09:01 -0700 (PDT)
Date:   Mon, 8 Jul 2019 11:09:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Melin Tomas <tomas.melin@vaisala.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] watchdog: cadence_wdt: Group struct member init
 statements
Message-ID: <20190708180900.GA14613@roeck-us.net>
References: <20190705114522.42565-1-tomas.melin@vaisala.com>
 <20190705114522.42565-4-tomas.melin@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705114522.42565-4-tomas.melin@vaisala.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jul 05, 2019 at 11:46:03AM +0000, Melin Tomas wrote:
> Move init statement and remove stray comment.
> 
> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> ---
>  drivers/watchdog/cadence_wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index 87b767c87bb6..4657800d9d8e 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -313,6 +313,7 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	}
>  	
>  	cdns_wdt_device = &wdt->cdns_wdt_device;
> +	cdns_wdt_device->parent = &pdev->dev;

In the upstream kernel, we have
	struct device *dev = &pdev->dev;
and
	cdns_wdt_device->parent = dev;

so this patch no longer applies.

>  	cdns_wdt_device->info = &cdns_wdt_info;
>  	cdns_wdt_device->ops = &cdns_wdt_ops;
>  	cdns_wdt_device->timeout = CDNS_WDT_DEFAULT_TIMEOUT;
> @@ -340,9 +341,6 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	/* Initialize the members of cdns_wdt structure */
> -	cdns_wdt_device->parent = &pdev->dev;
> -
>  	ret = watchdog_init_timeout(cdns_wdt_device, wdt_timeout, &pdev->dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "unable to set timeout value\n");
