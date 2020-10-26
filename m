Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D86298F41
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Oct 2020 15:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781103AbgJZO1f (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Oct 2020 10:27:35 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42098 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1780904AbgJZO1f (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Oct 2020 10:27:35 -0400
Received: by mail-ot1-f65.google.com with SMTP id h62so8121080oth.9;
        Mon, 26 Oct 2020 07:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g+6aCntDtsGAemsa9rPEtVzMOpz91ekmPAbdX9YmA2c=;
        b=cKO9uEFBLPt+O0v9E9rGSbndWtnzqhUdDlvIC9nURqSKQxHoYt9MTGt/y4nunapaJV
         r4MLp10UxUSV+1DK5e6ne00xaPcOua3AurOMxSq5qNBQecpLKAH1RvAEhURyg3JTkTHH
         R/tYLFBMGhGf1Yb5HH5p65J2qQuGwQK4hWBiHWEvtpmbYEyZWLoAdgPJyjJvzWfo9067
         6C64qNe2lh6QBsJclh1wisBI6FE8lCHE3cfm0dXjnt4B4hQ6OZ5vDGVVb+OHKk+S7lLC
         Rlz8Cj/zeyfKv3m1O6b66P2InBzGvpx3occYbxZ4xNLxW5Pb+Zf+dfeZG2QC1N7+2CEj
         mG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=g+6aCntDtsGAemsa9rPEtVzMOpz91ekmPAbdX9YmA2c=;
        b=iuJfqmvmIftmjcljvIvo0xiq1a5Mf03c+A6hIy8VSRIrchU2pH6LPBfjPz4AvULNPN
         y5R36/t+uGsoje8hAlx70NKzJhsz/IR2u+2rvYCoZhy+MHpYB8+sVp03/c0iXZRYbDls
         pdeOQI4Symihy0eHiJX14/qY2rws0XpqEL1AR2FPS4VofiQlJ1vMRFjVlEM68aHJrr9F
         AuRtiZWO5M/eBg+vteZ5psDQQP5CVAW44J3S4UgdM22qmEpkNNemL4VmxYRWx/8BRGoz
         PX6MgkdpfVswb0URwblYwJHyjCndY0qrIRm58U+I49lJLu5hab9Au15Gx9N3Zejv++OL
         Q7yQ==
X-Gm-Message-State: AOAM532JjfjTaFTeGhM2QdXyDdnkjGw2J/g7qLn2drIT1ndhCGYH07ux
        oJdBQL3lu0tFx1blxUWYa11JceoFMZ8=
X-Google-Smtp-Source: ABdhPJwnPfhBjied3YpM8GNk3ad58YzbNkhEE/7sJERIQsydLEgPBNim1xVuw/j1d//8vzl/R0879A==
X-Received: by 2002:a9d:2034:: with SMTP id n49mr4838235ota.358.1603722453699;
        Mon, 26 Oct 2020 07:27:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j3sm1420199oij.9.2020.10.26.07.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:27:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/3] watchdog: sprd: should not disable watchdog in resume
To:     Chunyan Zhang <zhang.lyra@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
References: <20201026080919.28413-1-zhang.lyra@gmail.com>
 <20201026080919.28413-2-zhang.lyra@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <2691dbe4-0bff-fdb4-0871-60b491d740a4@roeck-us.net>
Date:   Mon, 26 Oct 2020 07:27:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026080919.28413-2-zhang.lyra@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/26/20 1:09 AM, Chunyan Zhang wrote:
> From: Lingling Xu <ling_ling.xu@unisoc.com>
> 
> Don't disable watchdog in resume process, otherwise system would crash
> once kick watchdog.
> 

This is a bit misleading: It is only disabled if the attempt to start it
has failed. Was this observed in practice ? If so, it might make sense
to identify and fix the underlying problem instead of trying to work
around it (or is this addressed with the second patch of the series ?)

Anyway, the patch itself is fine.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
> Signed-off-by: Lingling Xu <ling_ling.xu@unisoc.com>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
>  drivers/watchdog/sprd_wdt.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
> index 65cb55f3916f..f3c90b4afead 100644
> --- a/drivers/watchdog/sprd_wdt.c
> +++ b/drivers/watchdog/sprd_wdt.c
> @@ -345,15 +345,10 @@ static int __maybe_unused sprd_wdt_pm_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	if (watchdog_active(&wdt->wdd)) {
> +	if (watchdog_active(&wdt->wdd))
>  		ret = sprd_wdt_start(&wdt->wdd);
> -		if (ret) {
> -			sprd_wdt_disable(wdt);
> -			return ret;
> -		}
> -	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static const struct dev_pm_ops sprd_wdt_pm_ops = {
> 

