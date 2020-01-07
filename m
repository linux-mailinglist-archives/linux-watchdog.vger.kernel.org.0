Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1104E132E5F
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jan 2020 19:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgAGS0y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Jan 2020 13:26:54 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:53157 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgAGS0y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Jan 2020 13:26:54 -0500
Received: by mail-pj1-f67.google.com with SMTP id a6so142855pjh.2;
        Tue, 07 Jan 2020 10:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zus/oHEPfUKUrotru7IYE6Udovf2Bf4kyzexAklf/mc=;
        b=ZN1v7QiONPOPW1IOT5zRpZOShKub+VrlaoY9JyHqBNagonMul3zriQZkhMe4mWGP0B
         FVCSgZmNoeYJNVuSuFFoaabfYXf+Q7gLwpHn9Z+OvTPyf8All5dirorZ82w34aop+ni0
         laU4Ajwb0e1J3JUZRkD1296WBkVvgzzaiehbUSBl1AbHab7ElANmsSVjcM9PShfB2HbS
         b2pcTFrHmAm50ot5Y/cd1SXlpuCLwSGollOeyUDqNEg+h+esFT191xy5hM+2rJd7Zh6d
         2kJJ7GTN61Wn4UMZDJUW8df/XoAn9rQZTVCO+QzdWxf3HIT7OlFWmIU42HwTf+arq7ue
         nWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zus/oHEPfUKUrotru7IYE6Udovf2Bf4kyzexAklf/mc=;
        b=jcSsGjzzB7w5czlLbNr2MDvVyZvVyaJIqQY87CN+mTVAnpwg7C1xLsb4ifYTA8wth6
         qNDmc8VgBa75By0/84tgBeB9ympT2HszRP+iqaskC8B/Sej/ZSkJtvPuDuMrNTA2yZsk
         WJu5Ul8rEK0e4av8eRMRDCW2myjOlL8iFs0PGIjBY4Nqs3lu4+k0kYNHtZ7gE0VOKP1n
         J2Hz+QitL93FYKbBZ+Gi8vJoIHWp7HAIOpibFTCyescf5fU+sR3LYzZrZdlF8gr1KUFN
         iptvbRdmG3OBnYwbItaJOYFHqL7eNGYz+DiW6u00XAdt2Isj9EKUBN0pjL0izRv1EBqh
         xEAg==
X-Gm-Message-State: APjAAAU+F49z4S+zGHGNoJbswBD+EQ++KRWzuqYllLnXigzWWM/G/2wV
        q8uDOxcD7ijZE9MegkGdBEGQ/Lbe
X-Google-Smtp-Source: APXvYqwXogUfoviDu1YExWXKGJfXEm5s1mQ/WrVmJBNWbh7jEUBf88go0HCM9HfxbABqMciykm7hRw==
X-Received: by 2002:a17:90a:a60c:: with SMTP id c12mr1200747pjq.36.1578421613893;
        Tue, 07 Jan 2020 10:26:53 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d24sm247488pfq.75.2020.01.07.10.26.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 10:26:53 -0800 (PST)
Date:   Tue, 7 Jan 2020 10:26:52 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jack Mitchell <ml@embed.me.uk>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: dw_wdt: ping watchdog to reset countdown
 before start
Message-ID: <20200107182652.GA22909@roeck-us.net>
References: <20200107155155.278521-1-ml@embed.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107155155.278521-1-ml@embed.me.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jan 07, 2020 at 03:51:55PM +0000, Jack Mitchell wrote:
> Currently on an rk3288 SoC when trying to use the watchdog the SoC will
> instantly reset. This is due to the watchdog countdown counter being set
> to its initial value of 0x0. Reset the watchdog counter before start in
> order to correctly start the countdown timer from the right position.
> 
> Signed-off-by: Jack Mitchell <ml@embed.me.uk>

You sent this three times, one with v2, no explanation for v2.
On top of that, the To: destination is messed up in all three versions.
Excellent example for how not to send a patch.

Anyway,

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/dw_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index fef7c61f5555..4a902d015bc2 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -135,6 +135,7 @@ static int dw_wdt_start(struct watchdog_device *wdd)
>  	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
>  
>  	dw_wdt_set_timeout(wdd, wdd->timeout);
> +	dw_wdt_ping(&dw_wdt->wdd);
>  	dw_wdt_arm_system_reset(dw_wdt);
>  
>  	return 0;
> -- 
> 2.24.1
> 
