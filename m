Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAF93D94ED
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jul 2021 20:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhG1SEV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Jul 2021 14:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhG1SEV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Jul 2021 14:04:21 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B494C061757;
        Wed, 28 Jul 2021 11:04:19 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id z24so3099555qkz.7;
        Wed, 28 Jul 2021 11:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JfbD5ep0NnF8FbqtBMbVTm96BShvDEthsXDXWrAdkOY=;
        b=AEDT7MKE9yV9QqWU6GVh/K7nHxaQOcTXwQcgUkBYhtRXDbfrAJ68czr5H6jkh0Bat9
         RuIMrhEWqBAkNaEMKviNJ8qxECGF4h+yILqxw/yrtzqMfjXz/7u6PdgqPejZ/7p/3Ue1
         dMmHuNq8hjOhUt4ALnk00Pnp0g4ERTv6QF6Z8IOP0LZbl4L1K10v5UxGLqVdweyVFXgi
         kr2x55fXzOC3VhzW86VneFM/cr7sTp5NYv79m6pICYHEPwouXxYftQu/9N1bUQRhHFTw
         FU0GaQVop2t8Fn4iBtOmJaZ46i+Yvve/PysKq9xEB+ATJrB8x17c3W9eqUdPt8xlnkJw
         bfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=JfbD5ep0NnF8FbqtBMbVTm96BShvDEthsXDXWrAdkOY=;
        b=oN0vAehIoplZuCYU6Z/7V1UzQ95K7ADUdRBEcEz23NQb2yV/HeOclLldFGlHMAUUyH
         J1ERVF0iXF6R/IBTqPICY8blqjmBUM/T++4R39l4zzh2GgjVIfEn+p9EJmiQz9pDbNgJ
         Zk9JZaeGDajfdQNSsF9fXmMw/YWGavMjOPf1xHLqUu50q2jjZHUNI289vKkWg2cFA1NM
         YGORBK2j33cCxFKzN7KVBsawttvQACRruJQW8sYC6ByGlJwRkxo1pIhV/AKRoFqvkTaU
         xIdzVNbJ7su+jgeckjUNPR5dTWsoDVt3TYXcCqNu4OAZ7tlZt8Hy5ArEdXVuEA8WF+1C
         tOLQ==
X-Gm-Message-State: AOAM533SGH1gfZTszqW5z45XjJGlD/fGG/JrMEQEb5FO6kpAN/OIoUpc
        sWxKja4wjlmuzLjmDvoU4ag=
X-Google-Smtp-Source: ABdhPJwz/qmvv9nYaWpTBUQlDI1rnXJGE8wEfJVgD8wPPsVRfpImcVoefrGkrtd7mKlWatBDNugmxw==
X-Received: by 2002:a37:6ca:: with SMTP id 193mr912322qkg.484.1627495458512;
        Wed, 28 Jul 2021 11:04:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d7sm238060qth.70.2021.07.28.11.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 11:04:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 28 Jul 2021 11:04:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] watchdog: sl28cpld_wdt: Constify static struct
 watchdog_ops
Message-ID: <20210728180416.GA1663715@roeck-us.net>
References: <20210727223042.48150-1-rikard.falkeborn@gmail.com>
 <20210727223042.48150-2-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727223042.48150-2-rikard.falkeborn@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 28, 2021 at 12:30:40AM +0200, Rikard Falkeborn wrote:
> The struct sl28cpld_wdt_ops is only assigned to the ops pointer in the
> watchdog_device struct, which is a pointer to const struct watchdog_ops.
> Make it const to allow the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sl28cpld_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sl28cpld_wdt.c b/drivers/watchdog/sl28cpld_wdt.c
> index 2de93298475f..9ce456f09f73 100644
> --- a/drivers/watchdog/sl28cpld_wdt.c
> +++ b/drivers/watchdog/sl28cpld_wdt.c
> @@ -108,7 +108,7 @@ static const struct watchdog_info sl28cpld_wdt_info = {
>  	.identity = "sl28cpld watchdog",
>  };
>  
> -static struct watchdog_ops sl28cpld_wdt_ops = {
> +static const struct watchdog_ops sl28cpld_wdt_ops = {
>  	.owner = THIS_MODULE,
>  	.start = sl28cpld_wdt_start,
>  	.stop = sl28cpld_wdt_stop,
> -- 
> 2.32.0
> 
