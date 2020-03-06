Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A78F917C196
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Mar 2020 16:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgCFPUd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Mar 2020 10:20:33 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:51488 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgCFPUc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Mar 2020 10:20:32 -0500
Received: by mail-pj1-f67.google.com with SMTP id l8so1191679pjy.1;
        Fri, 06 Mar 2020 07:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LTW/5J9zbOegV+y5cwFRAAha8iVgu2WAeK+wZzLrVgo=;
        b=eEMYXZmlifY7rqDP1JgSqRZhs6FijSm2MeNPTI/pArcB79sBdzpZV0p9k30TB2hCVa
         xf5Tb8aTUIN1y8SnLwKmLpyb3pmqCrPVQDaf6fgRW9HRbi3es4nmBX1ocyu+ek+IT9k0
         YlePXtI59/NYbY8gbfRcohI4ejUiYblLQeTTM88V0jWXKi3E9sIUSl2BEZRxi7cUghcy
         ZYU5U51b/WOWHTfphlAXrEQlVTYrP5kwm4UZnbEHI4MIgkFV9pJYKWXz2DK6k6VzLAly
         maqEsrv4OeQ8S+0+R8+PTO3aQpx9idaFB156o3daVdLKBdXjDngtdP6EAhgXbUBMHvWv
         lU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LTW/5J9zbOegV+y5cwFRAAha8iVgu2WAeK+wZzLrVgo=;
        b=f73lBOivOjU1Cwu294bN9asqDiZFX/j8tX9vYcs2Y5PSfsp/b1xXRtxP9lS4Sp22yD
         wWON/ySDgox43NTo1nNIaN47DURgRy0ikF5bm+Gfrk2hUph0cgejlh8AvTnFl3KDNXjC
         i2s0zFdPC+wc2F6x4JGszknC+qchfVnB9B7Mu+LaJ/bXvjfnlf8skMB0Ua7QWxIL15WG
         IkccJJv8GarSdgTq871lp94c2i9ikzPY+C/XlLqOnd6E6uW/0b8pCUC/AlM2hx/pZVbL
         zoI9SEZN1vTkAWOY/d5SdqsLoFrSLxtJ9sYmVvn+W3foWZpqzWCXAf1m2EaOAUe8X+YW
         Ia3A==
X-Gm-Message-State: ANhLgQ1bc+8Klx11TUYHP8/zXkrUqG8Qqy+OFjPwMXWnpBnbW6Bl9dSi
        pgKhFBmF8vz1PKvCW1tgCfkSZ0gT
X-Google-Smtp-Source: ADFU+vvYPWE8JwxjsELSGmJq9+MKPyt1KPBd8D9w1sNOv5bJaA9LfFz8t1RznbuX5ewyTebNMYgV1g==
X-Received: by 2002:a17:902:8e84:: with SMTP id bg4mr3419034plb.11.1583508030906;
        Fri, 06 Mar 2020 07:20:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k20sm13877826pfk.123.2020.03.06.07.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 07:20:30 -0800 (PST)
Subject: Re: [PATCH 3/7] watchdog: watchdog_dev: Use generic msec-per-sec
 macro
To:     Sergey.Semin@baikalelectronics.ru,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132823.D5C5B803087C@mail.baikalelectronics.ru>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5d0a9d49-cbc8-08bb-8c34-065427a16bec@roeck-us.net>
Date:   Fri, 6 Mar 2020 07:20:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200306132823.D5C5B803087C@mail.baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/6/20 5:27 AM, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> For better readability replace the numeric literals with globally
> available xSEC_PER_SEC macro.
> 

This is really completely unrelated to the rest of the series,
and I don't really see the point. I am fine with such changes if there
are some context changes around it, but otherwise they add no value
other than being a potential source of backport conflicts.

Guenter

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>  drivers/watchdog/watchdog_dev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 8b5c742f24e8..a1a3bbe21653 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -99,7 +99,7 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
>  {
>  	/* All variables in milli-seconds */
>  	unsigned int hm = wdd->max_hw_heartbeat_ms;
> -	unsigned int t = wdd->timeout * 1000;
> +	unsigned int t = wdd->timeout * MSEC_PER_SEC;
>  
>  	/*
>  	 * A worker to generate heartbeat requests is needed if all of the
> @@ -121,7 +121,7 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
>  static ktime_t watchdog_next_keepalive(struct watchdog_device *wdd)
>  {
>  	struct watchdog_core_data *wd_data = wdd->wd_data;
> -	unsigned int timeout_ms = wdd->timeout * 1000;
> +	unsigned int timeout_ms = wdd->timeout * MSEC_PER_SEC;
>  	ktime_t keepalive_interval;
>  	ktime_t last_heartbeat, latest_heartbeat;
>  	ktime_t virt_timeout;
> 

