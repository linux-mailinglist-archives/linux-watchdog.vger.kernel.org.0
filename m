Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513B63D94F1
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jul 2021 20:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhG1SE3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Jul 2021 14:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbhG1SE3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Jul 2021 14:04:29 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A69ECC061757;
        Wed, 28 Jul 2021 11:04:27 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id w10so1997501qtj.3;
        Wed, 28 Jul 2021 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Eu3sOrRu2dRVm5OFQtLF1th9KrG3VzRFBaqLcVcuQDY=;
        b=e9B5RKGBARiwAuQbPO8vu2HybvZyeqCbsjCgKalcuInoJG8dVOUxg569NzAh6gRUY1
         THPUfMhewthFj/6DdxKyu+1RNxO7Iq7bBVYsamgWV8iQJOI4da5x9IM8cRmcou1DP61s
         aPyT0rWOKnYZuVCieRUN7HXGr5XbYEy5JSZoLcacg+1er6/g3vPXcOel88ZMbyfq47V9
         aUq8qbEwjWtKn77+qba9ht0cmGk7sNO2Z/NcrEfauSd40yEX931AySve+81ZNlBW5mdV
         WEC2JNKFbqoKmj/8fD1J+68TMS+P16UvfWz27K8c0PT+Qm9/l0/pH8kPC9rrObmKy7AA
         HT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Eu3sOrRu2dRVm5OFQtLF1th9KrG3VzRFBaqLcVcuQDY=;
        b=qiQ7LU1BjOQ0S+hbHWldYM732ZbuYIujwml/aTyhCEAF+2npaS8WCqXRjvwvP0Ige4
         wJ5BpbE3N2wzmBJBU2iTu6nUQ+F2XUBmkR6MOXV0iXvq7yeiogCL86NiBfEXlxpwslbb
         V1CJbjn0CxrdXewt55GRCypMy9DLHkl8eOkUgq1qeq2OwHi7Ex2oid/9XLD2tsi29caI
         7LGbq9gBU21Y5n9Sc2duBxaFBZzDKTt9y7ey1Qp3ldPQO0ZewnohFJxY9b0Vz8r6JwBj
         3xpwpvWwTPjePSe+O+IEoJqcjmbqtg8G+BK/f896oZ+4nZ3a9AnzN+m+GOOl53u6b9P8
         zybQ==
X-Gm-Message-State: AOAM530HRFf+gZPUtStKd2o4Vhd/bAIkgyjilcjTNvRPFOx1cXUoRZC6
        gnsr1o5Lt2lz4taMkdrbni0=
X-Google-Smtp-Source: ABdhPJzuAvt1tc5q0t1Pwd681AOsdeT/mbCaV4s/F4aIRYzhQUMxzj3oZyUPE65x/xNU9yzTQs7Fhg==
X-Received: by 2002:ac8:5896:: with SMTP id t22mr789999qta.18.1627495466944;
        Wed, 28 Jul 2021 11:04:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a9sm385619qka.32.2021.07.28.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 11:04:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 28 Jul 2021 11:04:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: tqmx86: Constify static struct watchdog_ops
Message-ID: <20210728180425.GB1663715@roeck-us.net>
References: <20210727223042.48150-1-rikard.falkeborn@gmail.com>
 <20210727223042.48150-3-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727223042.48150-3-rikard.falkeborn@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 28, 2021 at 12:30:41AM +0200, Rikard Falkeborn wrote:
> The struct tqmx86_wdt_ops is only assigned to the ops pointer in the
> watchdog_device struct, which is a pointer to const struct watchdog_ops.
> Make it const to allow the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/tqmx86_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/tqmx86_wdt.c b/drivers/watchdog/tqmx86_wdt.c
> index 72d0b0adde38..83860e94ce9d 100644
> --- a/drivers/watchdog/tqmx86_wdt.c
> +++ b/drivers/watchdog/tqmx86_wdt.c
> @@ -62,7 +62,7 @@ static const struct watchdog_info tqmx86_wdt_info = {
>  	.identity	= "TQMx86 Watchdog",
>  };
>  
> -static struct watchdog_ops tqmx86_wdt_ops = {
> +static const struct watchdog_ops tqmx86_wdt_ops = {
>  	.owner		= THIS_MODULE,
>  	.start		= tqmx86_wdt_start,
>  	.set_timeout	= tqmx86_wdt_set_timeout,
> -- 
> 2.32.0
> 
