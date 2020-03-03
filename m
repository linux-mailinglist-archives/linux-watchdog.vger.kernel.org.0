Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6791F1784D6
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2020 22:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732598AbgCCVZQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Mar 2020 16:25:16 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42929 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732580AbgCCVZQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Mar 2020 16:25:16 -0500
Received: by mail-pf1-f194.google.com with SMTP id f5so2124892pfk.9;
        Tue, 03 Mar 2020 13:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pogs7tPo/L/NBSyyRxPvOrbszi59KiJaOrJoFUbt2WY=;
        b=Kn9+nUVfu3l+nTvfNq/uPFWNk9LhmCulmVcbQTiFCrzt87NWiJeEfwUlfj+wvg/pjb
         8vJWrV3V+QUc+z3cQ3rblXKBOnBh4cxRyH66THpI0TC/g+Yi9viEOfGKoZfvGRbjsTjb
         lSdn3NmShU2JTxYtekvZsreSYc4PxJETF0GwCh8nx85+DxwfC+3n+LZiR2Kf/nNOPHMy
         MgiM4+8WUBmXUpScefLvyeHOvU6Axf6+/U7aNd9PELE7dBj4GzXSYsRbsjkMCs7/ej5c
         Joga0FcKcl2GvMdm5uPoIztFnrnEtK5Jyrzb0zi7aASy+l0JUcZTktxDhE06nV7Xu1UD
         EKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pogs7tPo/L/NBSyyRxPvOrbszi59KiJaOrJoFUbt2WY=;
        b=UKOKodjcmCYkC9ikFFqSh5i+H8ZrACW3UrUxUtTKKYtk8dfsPxWp1pcTaictpVSgZr
         e4NDsNbHTZFgMHdNqq09aH0GunnuumxjrMnkuwdvV8ZYWRp7rudzQcWMYObwI9xW88ZX
         X4J1tMotGIkOAQUlqGX6eGUS4CoZeCcYZhbJV4lsLttjU6RHzuFUfJubA1xaMawvR2lx
         jGhWX4Qww0ycR8d9UgpD2vC5bRjluLjZAZ/SNsJMsSpXeVotQe5+irdAl1VChHHSUpGw
         MhyWt35RIpwwkTeapICCZQDUKWjx/sZ9OwtZPKO08InAa3lpijQx6YbSyy2pCK/kGQ3e
         UPaQ==
X-Gm-Message-State: ANhLgQ15PCucqbobasirCrKpKUqMnKM6Glo8MxA5mEMIXIK2He3sBwJA
        s1w14IRgz39BILNZJwOcbQw=
X-Google-Smtp-Source: ADFU+vtkWCpXDJsbFyREWnVzsCvO7puF/A5Fgv1NB2cWK73a/Md3BJQYPqwAqrxzo+2D4FVURkMW8g==
X-Received: by 2002:aa7:8582:: with SMTP id w2mr5814744pfn.89.1583270714393;
        Tue, 03 Mar 2020 13:25:14 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h16sm131571pje.43.2020.03.03.13.25.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 13:25:13 -0800 (PST)
Date:   Tue, 3 Mar 2020 13:25:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, avifishman70@gmail.com, tali.perry1@gmail.com,
        yuenn@google.com, benjaminfair@google.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 3/3] watchdog: npcm: remove whitespaces
Message-ID: <20200303212512.GA20448@roeck-us.net>
References: <20200303100114.87786-1-tmaimon77@gmail.com>
 <20200303100114.87786-4-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303100114.87786-4-tmaimon77@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Mar 03, 2020 at 12:01:14PM +0200, Tomer Maimon wrote:
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Turns out this problem does not actually exist in the upstream driver
(as of v5.6-rc4). You might want to align your code with the upstream
kernel.

Guenter

> ---
>  drivers/watchdog/npcm_wdt.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> index 84a728af6664..bd38bf1ee6a1 100644
> --- a/drivers/watchdog/npcm_wdt.c
> +++ b/drivers/watchdog/npcm_wdt.c
> @@ -123,30 +123,29 @@ static int npcm_wdt_stop(struct watchdog_device *wdd)
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
>  	if (watchdog_active(wdd))
>  		npcm_wdt_start(wdd);
