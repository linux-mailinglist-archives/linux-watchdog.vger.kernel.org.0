Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3734C22522A
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 Jul 2020 16:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgGSOLy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 19 Jul 2020 10:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGSOLy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 19 Jul 2020 10:11:54 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029E1C0619D2
        for <linux-watchdog@vger.kernel.org>; Sun, 19 Jul 2020 07:11:54 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j19so9055303pgm.11
        for <linux-watchdog@vger.kernel.org>; Sun, 19 Jul 2020 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5u/HW26w17MfG2IrobXMD3a0Tj7Cjkm8iFs2sLQMUqQ=;
        b=HoQonhf1NWa+myoLzD+iI+7StFSMHwjma914klOh6UIWkhw9+JK8p11bRDtj4iCwWi
         f7Pu2xa8w0+vSj38jeDcDJNSFUeyBWnNjZdHDIzdeQjKajrLNJ5zs2rdIbl9fweXLtx0
         pbw+6dpJO02wN5cJ3AQblrDkCAAxHRpBc7urVTh7eR5qFoGlyXhV7zgdiF0pF4Z/GDaV
         LOXQ+0YvQZHev6T7048ec2AObMnHa9fnWuAhn9UTEfcirXuHEuJ8LEektk4/++jLsbNY
         P9zjL22Tc6/BY/SiVwrouRyvpiN/DsMuQe9NZP5anxvQ3gJhoY0PjlgTL4l+1HYPwLcl
         xmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=5u/HW26w17MfG2IrobXMD3a0Tj7Cjkm8iFs2sLQMUqQ=;
        b=MnnoQ8meMWB5CYlxI8IT8+VsKZ0s4xbriglIhGSI1MpZdQmB30JHSmuSUoUAf96K7v
         PKb7UOK+9kT9KsZxcSuhjtM3ohXhhL+TIB3rUzYEOmnya7hGr+FOWnWXc7Bk0U07Ohw6
         Le6Fn83Oiu5CWgSAP1lpuZ7SV177KCX3qvxjZGAprGefstDJakt/Z+xawu8TnhmJ3f9L
         UdmHiBG8egtGZCgJWUZD2y/hVziyyiu9HTEv2YNprnUV+l/7NJDS0risxSzbR4AfCrHo
         RQuRChdZlg92b3gLaUYTo3AO6Ws1ETkvyjqOa60jRMSnHxUnHnzEOFA4jY0EUQzkrihD
         MafQ==
X-Gm-Message-State: AOAM533L5YzAGp/47ubFKQhnoqmHfoGIEROdCAhbWE9AQoqKYz2I62Ud
        u4XqMylxFwRKRVnVCm+5xKw=
X-Google-Smtp-Source: ABdhPJznekm52KgeSsndWvIVqQGqNz3z2zIKMDvniRypOcoVB+7dmJwoftyZUeu5hxR8fgzJMnrpOA==
X-Received: by 2002:a62:ab17:: with SMTP id p23mr16626824pff.177.1595167913534;
        Sun, 19 Jul 2020 07:11:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q5sm13755177pfc.130.2020.07.19.07.11.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Jul 2020 07:11:53 -0700 (PDT)
Date:   Sun, 19 Jul 2020 07:11:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     minyard@acm.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 01/10] watchdog: Ignore stop_on_reboot if no stop function
Message-ID: <20200719141152.GA38930@roeck-us.net>
References: <20200620174907.20229-1-minyard@acm.org>
 <20200620174907.20229-2-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200620174907.20229-2-minyard@acm.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Jun 20, 2020 at 12:48:58PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> The reboot notifier unconditionally calls the stop function on the
> watchdog, which would result in a crash if the watchdog didn't have a
> stop function.  So check at register time to see if there is a stop
> function, and don't do stop_on_reboot if it is NULL.
> 
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  drivers/watchdog/watchdog_core.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 423844757812..03943a34e9fb 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -260,10 +260,16 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  
>  	/* Module parameter to force watchdog policy on reboot. */
>  	if (stop_on_reboot != -1) {
> -		if (stop_on_reboot)
> -			set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> -		else
> +		if (stop_on_reboot) {
> +			if (!wdd->ops->stop) {
> +				pr_err("watchdog%d: stop_on_reboot set, but no stop function.  Ignoring stop_on_reboot.\n", wdd->id);

This should be pr_notice(). It is not an error (otherwise I would expect
registration to abort). Also:

WARNING: line length of 133 exceeds 100 columns
#108: FILE: drivers/watchdog/watchdog_core.c:265:
+				pr_err("watchdog%d: stop_on_reboot set, but no stop function.  Ignoring stop_on_reboot.\n", wdd->id);


This patch that is independent from the rest of the series and should be
applied/handled independently.

Thanks,
Guenter

> +				clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> +			} else {
> +				set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> +			}
> +		} else {
>  			clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> +		}
>  	}
>  
>  	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
