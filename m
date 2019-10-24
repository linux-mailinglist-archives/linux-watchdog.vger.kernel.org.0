Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFCF1E3A25
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Oct 2019 19:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503829AbfJXRet (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Oct 2019 13:34:49 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:32973 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503819AbfJXRes (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Oct 2019 13:34:48 -0400
Received: by mail-pl1-f195.google.com with SMTP id y8so3686972plk.0;
        Thu, 24 Oct 2019 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4xAH5O7ZmGTGh/7bz/H2A/raubLFZFEOmbd1GQrCgUg=;
        b=XiIsTe0NN2X+NUlLdwWwmfzTywIeIZOpqjqet92yDH0L1tvipqmrxvMcpAakVniyIr
         vhSBR+w7W3qHfRxWD1nWUGgfCGAulGqtbVmxo66PSToWXkCOXzLJbJwyNULRMcwXOvJP
         PERyVI0dmTNcfBNhY0azGglCG/0+byVVCwLQ1QOHXH/cygX5SWzpGwYRYiYDP38A14xn
         keZ1PDpIE5ijMvNeMY+UrG0ILxXieladffE9iQsS9y3r+ngmBxobIdVJ1aGtrfpU3lbe
         TAitqoWC4v8YpEFWSL5bHMSj9S3B7S6EmOWCDQfGpKv3VDNbDuqYWtRT2q7isjuOr8Mg
         iNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=4xAH5O7ZmGTGh/7bz/H2A/raubLFZFEOmbd1GQrCgUg=;
        b=rZT2amhe2eTTPBV0FBTYdd3VwP3uMR7ZwT9nTqPPyoeqFB4g8fUgAj+Vpvt7pBg4NS
         8u//k2mem1dBDXqLKKMt3NJfsyNTo2sTg6aIb/8C4aY9STqGXm4OdESSh1ibBRXT4t86
         ljtj7Pe+9082R21Ju0mKpEvvfGxRBYhSN2PdFOgTt5oaWdqTnfirPF+A3yP4LxTiher3
         dOohW2ZvDPf0MTUre+4WulxHA8IkeY/oLp8lQIAoHhiavO5yfArrayvRKDEbhH/gbo6j
         cG3gx4IWrPAeV4Ww2hj08/GCJO9TDf96YI2NnT+bjA++xk7GSNqGCrUOPFrfBOhEYKtJ
         D6vQ==
X-Gm-Message-State: APjAAAUoPw+/KSatUEbXdPHKrHWqNC8qbyTDCj8z2u5DAlSPg+eFDNrZ
        Ls/Yp7/LRoG1b/6wiAsKN98l+p9w
X-Google-Smtp-Source: APXvYqwugV0LLLMtrWu8L2CZrijCdJYYJeNq2E9wIJSg50BwD9FkI1TfNcFoy2Vmlh3NS+Lg8t7nwA==
X-Received: by 2002:a17:902:7c03:: with SMTP id x3mr17367584pll.171.1571938486568;
        Thu, 24 Oct 2019 10:34:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s3sm2704619pjq.32.2019.10.24.10.34.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 10:34:45 -0700 (PDT)
Date:   Thu, 24 Oct 2019 10:34:44 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jiri Kosina <trivial@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH trivial] watchdog: wdat_wdt: Spelling
 s/configrable/configurable/
Message-ID: <20191024173444.GA27754@roeck-us.net>
References: <20191024152856.30788-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024152856.30788-1-geert+renesas@glider.be>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Oct 24, 2019 at 05:28:56PM +0200, Geert Uytterhoeven wrote:
> Fix misspelling of "configurable".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/wdat_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
> index e7cf41aa26c3bbfc..b069349b52f55f92 100644
> --- a/drivers/watchdog/wdat_wdt.c
> +++ b/drivers/watchdog/wdat_wdt.c
> @@ -202,7 +202,7 @@ static int wdat_wdt_enable_reboot(struct wdat_wdt *wdat)
>  	 * WDAT specification says that the watchdog is required to reboot
>  	 * the system when it fires. However, it also states that it is
>  	 * recommeded to make it configurable through hardware register. We
> -	 * enable reboot now if it is configrable, just in case.
> +	 * enable reboot now if it is configurable, just in case.
>  	 */
>  	ret = wdat_wdt_run_action(wdat, ACPI_WDAT_SET_REBOOT, 0, NULL);
>  	if (ret && ret != -EOPNOTSUPP) {
> -- 
> 2.17.1
> 
