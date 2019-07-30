Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D777AEF3
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 19:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbfG3RIh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jul 2019 13:08:37 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41444 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbfG3RIh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jul 2019 13:08:37 -0400
Received: by mail-pg1-f195.google.com with SMTP id x15so20040268pgg.8;
        Tue, 30 Jul 2019 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=SspBJkqonVNtnFffZ/SUc8F5/DCaYi7/4FGZAhfLgYo=;
        b=oqmG6+9Ux2JRYif9qtIcFMyxB5So3G+DSjmY6nQTXeX4JZ/lHy+hvncEErmdmPUlb+
         Ed8F9xVrhpNeqcqAewCkgjpgn3ZG7M4nlGfyCjrT34v05wJ6Rv4DL6WNdSqko0rzyd+k
         d0zQYxZ3ojjOukGC/e3G4/X9aqA01COkrMpQeCUS6wKe1NzudMzhTbEp/AHoTCGSmm18
         sclfKazqaN55PBZFmtFLE61bbOrm+gN4WSRM1Ft8ouSzjv72sLPFwCfCf2OeusFgGn36
         6J4DUslBKm3D9nvDP/pLjuWxRaz9fMw5Uf1UmH94vH9ClQUGA5bnpXZvVXc9XYMir7Bu
         +J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=SspBJkqonVNtnFffZ/SUc8F5/DCaYi7/4FGZAhfLgYo=;
        b=h3Mtg5p4WSEyX9/KYREr/VG02AYM83TerJwtBVOmMOroTgGnnovz4V9hAXwL3WRTPT
         iP2VPUziSHbpqzUuIEKQVgnPzZMJZgomvh2BCu7WXll3q/zBQf9DQMtmiQuK67NYQuQb
         CtCxgsZ4GOAen3DUzfWiD1PLl42A0cmhPt0tot4nCe+wuWaVChEsx5Cqih92qycEHWQd
         z06GMeEORkx2K+bNWd31y4hlxiutQnPz2sMC/NSi22Fu6olxvdL+96zklncX0+KRPr/O
         YW2yf8DVxKt3f+7C8CCf/96fd1/1LvjBbPk6aE0EGyc8qchcUXog12kirwENIBWYdAox
         wVlA==
X-Gm-Message-State: APjAAAXQ1w3zt+p+3OJSxROxLU2txDdHq3fPUMbgLi/UtnNjM/DXMCSt
        MVjF+gP6hQiLcCCkT0dVBy0=
X-Google-Smtp-Source: APXvYqwtyVLukNVQeuVNlXJsLJ7vYiSBTR15ttR5yvvT0/d33R8QcmiopiWJMfIX5Bv4pz+/iB7bIQ==
X-Received: by 2002:a63:f452:: with SMTP id p18mr84192433pgk.373.1564506517022;
        Tue, 30 Jul 2019 10:08:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y128sm86310206pgy.41.2019.07.30.10.08.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 10:08:36 -0700 (PDT)
Date:   Tue, 30 Jul 2019 10:08:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] watchdog: wdt977: Mark expected switch fall-through
Message-ID: <20190730170835.GA20715@roeck-us.net>
References: <20190729223159.GA20878@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729223159.GA20878@embeddedor>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 29, 2019 at 05:31:59PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning (Building: arm):
> 
> drivers/watchdog/wdt977.c: In function ‘wdt977_ioctl’:
>   LD [M]  drivers/media/platform/vicodec/vicodec.o
> drivers/watchdog/wdt977.c:400:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    wdt977_keepalive();
>    ^~~~~~~~~~~~~~~~~~
> drivers/watchdog/wdt977.c:403:2: note: here
>   case WDIOC_GETTIMEOUT:
>   ^~~~
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/wdt977.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/wdt977.c b/drivers/watchdog/wdt977.c
> index 567005d7598e..5c52c73e1839 100644
> --- a/drivers/watchdog/wdt977.c
> +++ b/drivers/watchdog/wdt977.c
> @@ -398,7 +398,7 @@ static long wdt977_ioctl(struct file *file, unsigned int cmd,
>  			return -EINVAL;
>  
>  		wdt977_keepalive();
> -		/* Fall */
> +		/* Fall through */
>  
>  	case WDIOC_GETTIMEOUT:
>  		return put_user(timeout, uarg.i);
