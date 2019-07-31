Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28E147D034
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 23:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729479AbfGaVnQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 17:43:16 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44910 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbfGaVnQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 17:43:16 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so32719902pgl.11;
        Wed, 31 Jul 2019 14:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2pcA+syml3U+BXTqn3loBbpI1NaVKecN6K6ot7Zdntg=;
        b=mNtkPCUHO21n40nc0/+DHmFweaSNsuJBE/xiqBmTMNLux8y9mlHBtE69fHb1010Q8V
         nEFAFkhiSXyqT8avuYi4chItgDtHAaV+D8XZFO99X2s5vVZqTcCkjqMKWQtMlPnp0q0n
         N/Fk4QITiuu9B3qQu0+iBTsW2e2Rs/4F1TJhQ0lYiemoB5St5rp/cp6qnoNVnK6Ii/XG
         iPzeV5M7wkPYxlBTfRbRYSY7Mf2+vyrA03C+FDROhpGIbw9MRUV68B4WerCd8XG9AJRE
         p9yiJzt5h55056+iVbJwTySoJ6ceb3KxcX9y23cN4Osv5G6zhgX+ZhT8wxJ2O3C0cjP/
         ED7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=2pcA+syml3U+BXTqn3loBbpI1NaVKecN6K6ot7Zdntg=;
        b=W19+IN29emOqpVZCNDdFWaqO/2gKY4xQUdEKuXiAozWdssRGnC5e0pgWNYdAzgIipF
         Mreizy95IcYdyC2sI3N2FsDJgPrTm3VNE3iTYXEkKVguiaAFQlXdPZZooSwbl3QTyGfE
         6xvMZUqvp88sKkHdPECgprbZCUuSvcN7HNv7PLEPJAjaW9lqks03X/WvT2p/PyKUfDoW
         hEMUxweTtQt+NQgJFQsii171rRvOCKMbedm5kmZLid3hod4BLAFaLGgYhJMlTt41hQib
         rqly7816LGmLhbQSknWC21M5hR9k1sfj+EGzqpWki5Uq0Jp57lCPRFsolWEepb5cghHM
         A4Ew==
X-Gm-Message-State: APjAAAVLz1IyJPdjgw+tUAiTeTFheAx/FkCfjEGbFW5Bl9scsz2wDWNa
        Lccq+54F1auFFTlszO/R5hI=
X-Google-Smtp-Source: APXvYqyZH5whmkutUHHOSPp06mIwUYsJ6Gy1C+Ms7szpgEJVfqIxdjSA2+KdpbKpaAP/4PdVCOrrZw==
X-Received: by 2002:aa7:8e17:: with SMTP id c23mr49709377pfr.227.1564609395613;
        Wed, 31 Jul 2019 14:43:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b36sm6576934pjc.16.2019.07.31.14.43.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 14:43:15 -0700 (PDT)
Date:   Wed, 31 Jul 2019 14:43:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] watchdog: ziirave_wdt: Be more verbose during
 firmware update
Message-ID: <20190731214314.GC17277@roeck-us.net>
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
 <20190731174252.18041-4-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731174252.18041-4-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 31, 2019 at 10:42:50AM -0700, Andrey Smirnov wrote:
> Add more error logging to ziirave_firm_upload() for diagnostics.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/ziirave_wdt.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index 8c71341a9c1c..89ce6982ba53 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -335,14 +335,18 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
>  
>  	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_JUMP_TO_BOOTLOADER, 1,
>  				      false);
> -	if (ret)
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to jump to bootloader\n");
>  		return ret;
> +	}
>  
>  	msleep(500);
>  
>  	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_DOWNLOAD_START, 1, true);
> -	if (ret)
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to start download\n");
>  		return ret;
> +	}
>  
>  	msleep(500);
>  
> -- 
> 2.21.0
> 
