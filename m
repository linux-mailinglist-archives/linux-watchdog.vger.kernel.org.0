Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB6D3FA6B1
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Aug 2021 18:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbhH1QIi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 28 Aug 2021 12:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhH1QIi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 28 Aug 2021 12:08:38 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7994DC061756;
        Sat, 28 Aug 2021 09:07:47 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso12110206ots.5;
        Sat, 28 Aug 2021 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2VSHN+bX61bBu0HKZx7e+D6ogg641gI+oqi5t3Zor1E=;
        b=ffM2dwYg9+9sgqDI6h9s+23W6oIIEr9AkJnGn7WyOlw1tOw/W6px1/S68gpSfY7ssX
         aojm+JzoZr8d3YY8HtAhHfWz49B+6vrMUzV+HXUkQeqIDsOveQ12vQL1fAffUkBhzSIf
         zbeTNtGDNSVrkJhpnna69sLHJ5jvPXR4Mw/4lTYPJszUYac6YZWCxOxqcNL4PPPjO23K
         w376rADNxS8Jy+Zz7q2BLVvNmMJv5X9Mz5KLXAzQVZQKb1iC8aDVLSLVFowV+AEGpa32
         VFoLY42kbpRQBSScbgF9kkSYEeVhM+BEHwyT3/zD5qx0wsZ8IubAcfokTyVYTuYvKxTS
         QFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=2VSHN+bX61bBu0HKZx7e+D6ogg641gI+oqi5t3Zor1E=;
        b=hqPOEJWMMBaRU+TIBfRp3o5nEdI6SsSYly5SxcBFSOH5dgRwEuX2P1Rqx+WwDJn2Fi
         MisF+d0ToN8DLPhe1tQ+RQeAhxyymDYwEa6tLooAOU27ITB5+UBzrXCvfUpWr6BtQJgq
         lobBH1qqYMsJRfxj6Mm5zxrPWb6HjoZ2/XHvkS412fD3N1t4a0cvUBDsV6tdllu79JCF
         MJFEQJnj22nCMr1lsTWv/rFnU3v4vgYKihBduc6RY/EBjNRErdufyNfqU0rvfAwxvCDR
         yF5x+8EZVnJzy+c4/OuH9YwaWcqzwbSMPxH6GOf0rxlLzZO2Sr4REXr4Mlm6BjZHtM1H
         UUtA==
X-Gm-Message-State: AOAM530ROy3HaO964WbxHdAHYulNRkLEt+TUc/YDhXdyVzJwPHUimfxG
        n2HKi7s2RDDmaOLMsCe36oeLUfgNG9w=
X-Google-Smtp-Source: ABdhPJy2cBW3VljjNjy4ypuDm4MArJiEDmUQvQprEerGa4pE/7OcNGpKQc7PBE+mL6+KVjvlhi9isA==
X-Received: by 2002:a05:6830:9:: with SMTP id c9mr13462389otp.122.1630166866907;
        Sat, 28 Aug 2021 09:07:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l8sm1861271oom.19.2021.08.28.09.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 09:07:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 28 Aug 2021 09:07:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v5 3/7] watchdog: f71808e_wdt: constify static array
Message-ID: <20210828160745.GA822154@roeck-us.net>
References: <cover.3654d10d79751f1b01adc9403f9840543df4bcc4.1628525954.git-series.a.fatoum@pengutronix.de>
 <9720c5a1efcef861da68b693453bb3eb3c21af37.1628525954.git-series.a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9720c5a1efcef861da68b693453bb3eb3c21af37.1628525954.git-series.a.fatoum@pengutronix.de>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 09, 2021 at 06:20:33PM +0200, Ahmad Fatoum wrote:
> The fintek_wdt_names is meant for read-only use and is currently not
> modified. Mark it const to catch future writes.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/f71808e_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index 3a0b29cb5854..8913747517fa 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -112,7 +112,7 @@ MODULE_PARM_DESC(start_withtimeout, "Start watchdog timer on module load with"
>  enum chips { f71808fg, f71858fg, f71862fg, f71868, f71869, f71882fg, f71889fg,
>  	     f81803, f81865, f81866};
>  
> -static const char *f71808e_names[] = {
> +static const char * const f71808e_names[] = {
>  	"f71808fg",
>  	"f71858fg",
>  	"f71862fg",
