Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 580524A7D7
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jun 2019 19:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729801AbfFRRFy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Jun 2019 13:05:54 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34176 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729541AbfFRRFy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Jun 2019 13:05:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id c85so8030304pfc.1
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Jun 2019 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ro2rygZepBsANX6PfvAaXy4RCAhsMCYn++ypIDKs4t4=;
        b=Cbwj/vq/37rE49Qc8d2eO+aTb2DigU4QiWLjOz8JpMNBRZdSHgTnZFtCNEO+KKDQPQ
         CmrdfIcs4DtwNXAJ0LKyxk5OtXjuZnumsQZoZg8eWlSrH11OEEbxjGGPq6aGq6MzlptN
         EO9uQtYO5QDxH9KM0YYe86drZp2/32DOWpSYzGn3LAY/v2sgv5oG3nxXy7P/ePigTukY
         U/shm16DIOgk/4AyCS85W6v+KGKsWuHxZSi0qyKbDncsWL2fTh5BYTW5bL/YG/ep0x0e
         Wu/Z1rmqkbplL/Vcyw6ujiTdZEHjHUHOxyFgzbQpN6CxvUmLmmWVHVMemFO8e4FayDXt
         v1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ro2rygZepBsANX6PfvAaXy4RCAhsMCYn++ypIDKs4t4=;
        b=X6MLz0Bp4vyHyY16uLAn4HkW7+DplQR6L2pLu0rNlwtOxOVPLVwzCNDvWnX8M83u6o
         ivep7ykgYA51fDzF5PI09s3HQM4f62GEpPGVPxNrC5DRxFv/T59F43zjA1UHgpVLs+d3
         9yQHG/IeoZ4dCzbyVFpSG4/vIkrPcTMzC3/vvkFhSEU+bSCpkd2187yCZkvEMGXIk36i
         v0GnINPxCRnGbASKAD39yAj+E3lJPpvrzobbF0DB6ke4keoY6JlonCNo0Yd/8VrCVUtK
         Op/5jKkw9Z2qEcNAfq+1ircgEZ80tEegf2VmEhoicij3+G37mOYaNuYF8Vl3uVpZrOLh
         4w6w==
X-Gm-Message-State: APjAAAU1ohs/rk4d7PtTunalmeVDDcwtTYGFa6YmJRLxqH9aRcmRwdrW
        6D62Yfa5lctvT9l2m/eoK4I=
X-Google-Smtp-Source: APXvYqyfwuVwFf8DVR+Dry1NxKti5V3m+mN226RiqIbTvmPqTEJhhQf01MV+ct/5f8ma22SkSiJVZQ==
X-Received: by 2002:a17:90a:8d86:: with SMTP id d6mr5913032pjo.127.1560877553827;
        Tue, 18 Jun 2019 10:05:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 135sm21145541pfb.137.2019.06.18.10.05.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 10:05:52 -0700 (PDT)
Date:   Tue, 18 Jun 2019 10:05:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: bcm_kona_wdt: no need to check return value of
 debugfs_create functions
Message-ID: <20190618170551.GA10509@roeck-us.net>
References: <20190618155809.GA21825@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618155809.GA21825@kroah.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 18, 2019 at 05:58:09PM +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/bcm_kona_wdt.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kona_wdt.c
> index e2ad44816359..921291025680 100644
> --- a/drivers/watchdog/bcm_kona_wdt.c
> +++ b/drivers/watchdog/bcm_kona_wdt.c
> @@ -143,24 +143,18 @@ static void bcm_kona_wdt_debug_init(struct platform_device *pdev)
>  	wdt->debugfs = NULL;
>  
>  	dir = debugfs_create_dir(BCM_KONA_WDT_NAME, NULL);
> -	if (IS_ERR_OR_NULL(dir))
> -		return;
>  
> -	if (debugfs_create_file("info", S_IFREG | S_IRUGO, dir, wdt,
> -				&bcm_kona_fops))
> -		wdt->debugfs = dir;
> -	else
> -		debugfs_remove_recursive(dir);
> +	debugfs_create_file("info", S_IFREG | S_IRUGO, dir, wdt,
> +			    &bcm_kona_fops);
> +	wdt->debugfs = dir;
>  }
>  
>  static void bcm_kona_wdt_debug_exit(struct platform_device *pdev)
>  {
>  	struct bcm_kona_wdt *wdt = platform_get_drvdata(pdev);
>  
> -	if (wdt && wdt->debugfs) {
> +	if (wdt)
>  		debugfs_remove_recursive(wdt->debugfs);
> -		wdt->debugfs = NULL;
> -	}
>  }
>  
>  #else
> -- 
> 2.22.0
> 
