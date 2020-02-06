Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6BA154664
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2020 15:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgBFOpJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Feb 2020 09:45:09 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:55382 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbgBFOpJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Feb 2020 09:45:09 -0500
Received: by mail-pj1-f68.google.com with SMTP id d5so64024pjz.5;
        Thu, 06 Feb 2020 06:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZE5pr5H6hvMlDNS4zB/gxs27dYvMV2BawxvYH6pi0do=;
        b=gbOGeDbGejEATAJsmupRXx1OGbSnuQtdiKRVXy4T9gze0qsJnKxVyTiLmyI8x2PVlX
         pRM2lpZ9pB17Ac3HXKZXYC2qVCXIh4fAirTQI/DFzMeQQAz3udH43jigUxIUdzxmj2cE
         VgO28E+kbX8blTr3I7lXVJBV5XJ5ziOnNNS1iY7MRLliYI/01hXtPIwuD6mGpwXhCWua
         vTNhs1KM0+FVlUii5tG/+gt21H1bj1G0VYPumP+Wt+bG/YJ8gUOjvsC2waPoBM8VF7BA
         CnfdtixJ6cEGCfBSl390qw837d14+NHUprWug8Bz/hgkBPURLhkRL0XtQBy0m5LWDjOH
         eung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZE5pr5H6hvMlDNS4zB/gxs27dYvMV2BawxvYH6pi0do=;
        b=DgaHgMae0foR2hmcV0gdmcB3jzrIq41yGnQDUganrwpYAWVyOOjACV2gZ/BFx1DNEW
         h0/DWMdn+yO9hAxiqWXqvtIsrldM/xXymVlsg9Mai2VA7HISMiDd2hslUxEaYkPQnOad
         ve+9mrUu0kIPYbSCqROviabad+WMXMnfO2cRnn9rUAUJXhBVWp6mSJdxBeK8LoOAua7O
         vZ4wLo/pdMxusgV5NBs6CTSvHRqA6eXPQwQdYNEj4JIfiFDbm2gGar8xxnfwym2kgpIb
         HLCg5KnVwhU2sM4x+p36RPqWc55QeNRV7cstV4V9nP2cVucvSJ1Gsn+pFy8Dab2KoYgz
         a++A==
X-Gm-Message-State: APjAAAXZjOpgn16XTnxC4+LBuuu49Kotj7KhkPbATvZdQHXDKhKK5jZS
        Fpd7kEOsak1C2TIdZZkCr1U=
X-Google-Smtp-Source: APXvYqx9ZszK8VTATue0ZKY28pvbrF7QUbfFxeax1OgidxbBs3YHS3LARjrq5lekGFQGbd6HOTz1Og==
X-Received: by 2002:a17:902:a984:: with SMTP id bh4mr4153989plb.281.1581000307332;
        Thu, 06 Feb 2020 06:45:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n14sm3853937pgf.79.2020.02.06.06.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 06:45:06 -0800 (PST)
Subject: Re: [PATCH 3/3] watchdog: da9062: add power management ops
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        lee.jones@linaro.org, stwiss.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-4-m.felsch@pengutronix.de>
 <20200123205132.GA13377@roeck-us.net>
 <20200206090010.ya6p2kvab452kedr@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a5d61822-c4fa-d5d3-c3ef-174b57a651bc@roeck-us.net>
Date:   Thu, 6 Feb 2020 06:45:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206090010.ya6p2kvab452kedr@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/6/20 1:00 AM, Marco Felsch wrote:
> Hi Guenter,
> 
> On 20-01-23 12:51, Guenter Roeck wrote:
>> On Wed, Jan 08, 2020 at 10:57:04AM +0100, Marco Felsch wrote:
>>> Disable the watchdog during suspend if it is enabled and re-enable it on
>>> resume. So we can sleep without the interruptions.
>>>
>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>>> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> I got an kbuild email so I checked the linux-next master tree. On
> linux-next this patch isn't used instead the old v1 was used...
> 

Yes, it appears that I picked the wrong version as well, and Wim picked it
up from there. But, really, what do you expect if you don't tag your
submissions with version numbers ?

I would suggest to send a follow-up patch to fix what is in -next.

Guenter
